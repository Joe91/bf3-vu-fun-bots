class('Utilities')

require('__shared/Config')

function Utilities:__init()
	-- nothing to do
end

function Utilities:getCameraPos(p_Player, p_IsTarget, p_AimForHead)
	return Vec3(0.00 ,self:getTargetHeight(p_Player.soldier, p_IsTarget, p_AimForHead), 0.00)
end

function Utilities:getTargetHeight(p_Soldier, p_IsTarget, p_AimForHead)
	local s_CameraHeight = 0

	if not p_IsTarget then
		s_CameraHeight = 1.6 --bot.soldier.pose == CharacterPoseType.CharacterPoseType_Stand

		if p_Soldier.pose == CharacterPoseType.CharacterPoseType_Prone then
			s_CameraHeight = 0.3
		elseif p_Soldier.pose == CharacterPoseType.CharacterPoseType_Crouch then
			s_CameraHeight = 1.0
		end
	elseif p_IsTarget and p_AimForHead then
		s_CameraHeight = 1.50 --bot.soldier.pose == CharacterPoseType.CharacterPoseType_Stand

		if p_Soldier.pose == CharacterPoseType.CharacterPoseType_Prone then
			s_CameraHeight = 0.25
		elseif p_Soldier.pose == CharacterPoseType.CharacterPoseType_Crouch then
			s_CameraHeight = 1.0
		end
	else --aim a little lower
		s_CameraHeight = 1.1 --bot.soldier.pose == CharacterPoseType.CharacterPoseType_Stand - reduce by 0.5

		if p_Soldier.pose == CharacterPoseType.CharacterPoseType_Prone then
			s_CameraHeight = 0.2 -- reduce by 0.1
		elseif p_Soldier.pose == CharacterPoseType.CharacterPoseType_Crouch then
			s_CameraHeight = 0.7 -- reduce by 0.3
		end
	end

	return s_CameraHeight
end

function Utilities:isBot(p_Player)
	if type(p_Player) == 'string' then
		p_Player = PlayerManager:GetPlayerByName(p_Player)
	end

	if type(p_Player) == 'number' then
		p_Player = PlayerManager:GetPlayerById(p_Player)

		if p_Player == nil then
			p_Player = PlayerManager:GetPlayerByOnlineId(p_Player)
		end
	end

	return p_Player ~= nil and p_Player.onlineId == 0
end

function Utilities:getEnumName(p_Enum, p_Value)
	for l_Key, l_Value in pairs(getmetatable(p_Enum)['__index']) do
		if l_Value == p_Value then
			return l_Key
		end
	end

	return nil
end

-- do not use on numerically indexed tables, only tables with string keys
-- this is shallow merge, does not recurse deeper than one p_Level
function Utilities:mergeKeys(p_OriginalTable, p_NewData)
	for l_Key, l_Value in pairs(p_NewData) do
		p_OriginalTable[l_Key] = l_Value
	end

	return p_OriginalTable
end


-- <object|o> | The object to dump
-- <boolean|p_Format> | If enabled, tab-spacing and newlines are used
-- <int|p_MaxLevels> | Max recursion level, defaults to -1 for infinite
-- <int|level> | Current recursion level
-- returns <string> | a string representation of the object
function Utilities:dump(o, p_Format, p_MaxLevels, p_Level)
	local s_Tablevel = ''
	local s_Tablevellessone = ''
	local s_Newline = ''
	p_MaxLevels = p_MaxLevels or -1
	p_Level = p_Level or 1

	if p_Format then
		s_Tablevel = string.rep("\t", p_Level)
		s_Tablevellessone = string.rep("\t", math.max(p_Level - 1, 0))
		s_Newline = "\n"
	end

	if o == nil then
		return 'nil'
	end

	if type(o) == 'table' or tostring(o):starts('sol.VEXTRefArray') or tostring(o):starts('sol.VEXTArray') then
		if p_MaxLevels == -1 or p_Level <= p_MaxLevels then
			local s = tostring(o) .. ' -> { ' .. s_Newline

			for l_Key, l_Value in pairs(o) do
				if type(l_Key) ~= 'number' then
					l_Key = '"'..l_Key..'"'
				end

				s = s .. s_Tablevel .. '['..l_Key..'] = ' .. g_Utilities:dump(l_Value, p_Format, p_MaxLevels, p_Level + 1) .. ',' .. s_Newline
			end

			return s .. s_Tablevellessone .. '}'
		else
			return '{ '.. tostring(o) .. ' }'
		end
	elseif type(o) == 'userdata' and not tostring(o):starts('sol.VEXTRefArray') and not tostring(o):starts('sol.VEXTArray') and getmetatable(o) ~= nil then
		if p_MaxLevels == -1 or p_Level <= p_MaxLevels then
			local s = tostring(o)

			if o.typeInfo ~= nil then
				s = s .. ' (' .. o.typeInfo.name .. ')'
			end
			s = s .. ' -> [ ' .. s_Newline

			for l_Key, _ in pairs(getmetatable(o)) do
				if (not l_Key:starts('__') and l_Key ~= 'typeInfo' and l_Key ~= 'class_cast' and l_Key ~= 'class_check') then
					s = s .. s_Tablevel .. l_Key .. ': ' .. g_Utilities:dump(o[l_Key], p_Format, p_MaxLevels, p_Level + 1) .. ',' .. s_Newline
				end
			end
			return s .. s_Tablevellessone .. ']'
		else
			return '[ '.. tostring(o) .. ' ]'
		end
	else
		return tostring(o)
	end
end

function Utilities:has(p_Object, p_Value)
	for i = 1, #p_Object do
		if p_Object[i] == p_Value then
			return true
		end
	end

	return false
end

function table:has(p_Value)
	for i = 1, #self do
		if (self[i] == p_Value) then
			return true
		end
	end
end

function string:isLower(p_Value)
	return p_Value:lower() == p_Value
end

function string:isDigit(p_Value)
	return tonumber(p_Value) ~= nil
end

function string:split(p_Sep)
	local s_Fields = nil
	p_Sep, s_Fields = p_Sep or ':', {}
	local s_Pattern = string.format("([^%s]+)", p_Sep)

	self:gsub(s_Pattern, function(c) s_Fields[#s_Fields + 1] = c end)

	return s_Fields
end

function requireExists(p_Module)
	local function reference(p_Module)
		require(p_Module)
		return true
	end

	local s_Status, s_Error = pcall(reference, p_Module)

	if not(s_Status) then
		return s_Error
	end

	return s_Status
end

if g_Utilities == nil then
	g_Utilities = Utilities()
end

return g_Utilities
