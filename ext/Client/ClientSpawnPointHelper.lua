class 'ClientSpawnPointHelper'

require('__shared/Config')

function ClientSpawnPointHelper:__init()
	self.m_Enabled = false
    self.m_SpawnPointTable = {}
	self.m_MaxDistance = 100
	self.m_RaycastPos = Vec3()
	self.m_RaycastTimer = 0
	self.m_SelectedSpawnPoint = nil
end

function ClientSpawnPointHelper:OnPartitionLoaded(p_Partition)
    for _, l_Instance in pairs(p_Partition.instances) do
        if l_Instance:Is("AlternateSpawnEntityData") then
            l_Instance = AlternateSpawnEntityData(l_Instance)
            table.insert(self.m_SpawnPointTable, l_Instance.transform)
        end
    end
end

function ClientSpawnPointHelper:OnLevelDestroy()
    self.m_SpawnPointTable = {}
end

function ClientSpawnPointHelper:OnSetEnabled(p_Args)
	local s_Enabled = p_Args

	if type(p_Args) == 'table' then
		s_Enabled = p_Args[1]
	end

	self.m_Enabled = (s_Enabled == true or s_Enabled == 'true' or s_Enabled == '1')
end

function ClientSpawnPointHelper:OnUIDrawHud()
	self.m_SelectedSpawnPoint = nil

	if not Config.DrawSpawnPoints or not self.m_Enabled then
		return
	end

	local s_LocalPlayer = PlayerManager:GetLocalPlayer()

	if s_LocalPlayer == nil then
		return
	end

	if s_LocalPlayer.soldier == nil then
		return
	end

	for _, l_Transform in pairs(self.m_SpawnPointTable) do
		if l_Transform.trans:Distance(s_LocalPlayer.soldier.transform.trans) <= Config.SpawnPointRange then
			self:DrawSpawnPoint(l_Transform)
		end
	end
end

function ClientSpawnPointHelper:OnClientUpdateInput(p_DeltaTime)
	if not Config.DrawSpawnPoints or not self.m_Enabled then
		return
	end

	if InputManager:WentKeyDown(InputDeviceKeys.IDK_T) and self.m_SelectedSpawnPoint ~= nil then
		local s_LocalPlayer = PlayerManager:GetLocalPlayer()

		if s_LocalPlayer == nil or s_LocalPlayer.soldier == nil then
			return
		end

		NetEvents:SendLocal("SpawnPointHelper:TeleportTo", self.m_SelectedSpawnPoint)
	end
end

function ClientSpawnPointHelper:DrawSpawnPoint(p_Transform)
	local s_Color = Vec4(1, 1, 1, 0.5)
	local s_PointScreenPos = ClientUtils:WorldToScreen(p_Transform.trans)

	-- Skip to the next point if this one isn't in view
	if s_PointScreenPos ~= nil then
		local s_Center = ClientUtils:GetWindowSize()/2
		-- Select point if its close to the hitPosition
		if s_Center:Distance(s_PointScreenPos) < 20 then
			self.m_SelectedSpawnPoint = p_Transform
			s_Color = Vec4(0, 0, 1, 0.5)
		end
	end

	local s_Up = Vec3(0, 1.5, 0)
	local s_Offset = self:GetForwardOffsetFromLT(p_Transform)

	DebugRenderer:DrawSphere(p_Transform.trans, 0.3, s_Color, true, false)
	DebugRenderer:DrawSphere(p_Transform.trans + s_Up, 0.15, s_Color, true, false)
	DebugRenderer:DrawSphere(s_Offset + s_Up, 0.1, s_Color, true, false)

	DebugRenderer:DrawLine(p_Transform.trans, p_Transform.trans + s_Up, s_Color, s_Color)
	DebugRenderer:DrawLine(p_Transform.trans + s_Up, s_Offset + s_Up, s_Color, s_Color)
end

-- Returns a Vec3 thats offset in the direction of the linearTransform
function ClientSpawnPointHelper:GetForwardOffsetFromLT(p_Transform)

	-- We get the direction from the forward vector
	local s_Direction = p_Transform.forward

	local s_Forward = Vec3(
		p_Transform.trans.x + (s_Direction.x * 0.4),
		p_Transform.trans.y + (s_Direction.y * 0.4),
		p_Transform.trans.z + (s_Direction.z * 0.4))

	return s_Forward
end


function ClientSpawnPointHelper:OnUpdateManagerUpdate(p_DeltaTime, p_UpdatePass)
	-- Only do raycast on presimulation UpdatePass
	if p_UpdatePass ~= UpdatePass.UpdatePass_PreSim then
		return
	end

	if not Config.DrawSpawnPoints or not self.m_Enabled then
		return
	end

	self.m_RaycastTimer = self.m_RaycastTimer + p_DeltaTime
	if self.m_RaycastTimer < StaticConfig.RaycastInterval then
		return
	end
	self.m_RaycastTimer = 0

	local s_RaycastHit = self:Raycast()

	if s_RaycastHit == nil then
		return
	end

	self.m_RaycastPos = s_RaycastHit.position
end

-- stolen't https://github.com/EmulatorNexus/VEXT-Samples/blob/80cddf7864a2cdcaccb9efa810e65fae1baeac78/no-headglitch-raycast/ext/Client/__init__.lua
function ClientSpawnPointHelper:Raycast()

	local s_LocalPlayer = PlayerManager:GetLocalPlayer()

	if s_LocalPlayer == nil then
		return
	end

	-- We get the camera transform, from which we will start the raycast. We get the direction from the forward vector. Camera transform
	-- is inverted, so we have to invert this vector.
	local s_Transform = ClientUtils:GetCameraTransform()
	local s_Direction = Vec3(-s_Transform.forward.x, -s_Transform.forward.y, -s_Transform.forward.z)

	if s_Transform.trans == Vec3(0,0,0) then
		return
	end

	local s_CastStart = s_Transform.trans

	-- We get the raycast end transform with the calculated direction and the max distance.
	local s_CastEnd = Vec3(
		s_Transform.trans.x + (s_Direction.x * 100),
		s_Transform.trans.y + (s_Direction.y * 100),
		s_Transform.trans.z + (s_Direction.z * 100))

	-- Perform raycast, returns a RayCastHit object.
	local s_RaycastHit = RaycastManager:Raycast(s_CastStart, s_CastEnd, RayCastFlags.DontCheckWater | RayCastFlags.DontCheckCharacter | RayCastFlags.DontCheckRagdoll | RayCastFlags.CheckDetailMesh)

	return s_RaycastHit
end

if g_ClientSpawnPointHelper == nil then
    g_ClientSpawnPointHelper = ClientSpawnPointHelper()
end

return g_ClientSpawnPointHelper