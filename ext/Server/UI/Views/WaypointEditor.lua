class('WaypointEditor');

function WaypointEditor:__init(core)
	self.view 			= View(core, 'WaypointEditor');
	self.trace_index	= 0;
	self.tracing		= false;
	
	NetEvents:Subscribe('WaypointEditor:TraceToggle', self, function(userData, player, data)
		if data.Enabled ~= nil then
			self.tracing = data.Enabled;
		end
		
		if data.Distance ~= nil then
			NetEvents:SendToLocal('UI', player, 'VIEW', self.view:GetName(), 'UPDATE', json.encode({
				Type	= 'Entry',
				Name	= 'trace_distance',
				Value	= math.floor(data.Distance) .. ' m'
			}));
		end
		
		if data.Waypoints ~= nil then
			NetEvents:SendToLocal('UI', player, 'VIEW', self.view:GetName(), 'UPDATE', json.encode({
				Type	= 'Entry',
				Name	= 'trace_waypoints',
				Value	= data.Waypoints
			}));
		end
		
		if data.TraceIndex ~= nil then
			NetEvents:SendToLocal('UI', player, 'VIEW', self.view:GetName(), 'UPDATE', json.encode({
				Type	= 'Input',
				Name	= 'trace_index',
				Value	= data.TraceIndex
			}));
		end
		
		if self.tracing then
			NetEvents:SendToLocal('UI', player, 'VIEW', self.view:GetName(), 'UPDATE', json.encode({
				Type	= 'MenuItem',
				Name	= 'trace_toggle',
				Text	= 'Stop Trace',
				Icon	= 'Assets/Icons/Stop.svg'
			}));
		else
			NetEvents:SendToLocal('UI', player, 'VIEW', self.view:GetName(), 'UPDATE', json.encode({
				Type	= 'MenuItem',
				Name	= 'trace_toggle',
				Text	= 'Start Trace',
				Icon	= 'Assets/Icons/Start.svg'
			}));
		end
	end);
end

function WaypointEditor:Show(player)
	Config.debugTracePaths = true;
	NetEvents:SendToLocal('UI_ClientNodeEditor_Enabled', player, Config.debugTracePaths);
	self.view:Show(player);
	self:Deactivate(player);
	self.view:GetCore():GetView('BotEditor'):Hide(player);
end

function WaypointEditor:Hide(player)
	Config.debugTracePaths = false;
	NetEvents:SendToLocal('UI_ClientNodeEditor_Enabled', player, Config.debugTracePaths);
	
	self.view:Hide(player);
	
	if PermissionManager:HasPermission(player, 'UserInterface.BotEditor') then
		self.view:GetCore():GetView('BotEditor'):Show(player);
	end
end

function WaypointEditor:UpdateNewPath(player)
	local nodes		= g_NodeCollection:Get(nil, self.trace_index);
	local distance	= 0;
	
	-- Show the new path
	NetEvents:SendToLocal('NodeCollection:ShowPath', player, self.trace_index);
		
	NetEvents:SendToLocal('UI', player, 'VIEW', self.view:GetName(), 'UPDATE', json.encode({
		Type	= 'Input',
		Name	= 'trace_index',
		Value	= self.trace_index
	}));
	
	NetEvents:SendToLocal('UI', player, 'VIEW', self.view:GetName(), 'UPDATE', json.encode({
		Type	= 'Entry',
		Name	= 'trace_waypoints',
		Value	= #nodes
	}));
	
	-- @ToDo calculate distance of node collection
	NetEvents:SendToLocal('UI', player, 'VIEW', self.view:GetName(), 'UPDATE', json.encode({
		Type	= 'Entry',
		Name	= 'trace_distance',
		Value	= distance .. ' m'
	}));
end

function WaypointEditor:Activate(player)
	self.view:Activate(player);
end

function WaypointEditor:Deactivate(player)
	self.view:Deactivate(player);
end

function WaypointEditor:Toggle(player)
	self.view:Toggle(player);
end

function WaypointEditor:Call(player, element, name)
	self.view:Call(player, element, name);
end

function WaypointEditor:GetName()
	return self.view:GetName();
end

function WaypointEditor:InitializeComponent()
	local recording = Box(Color.Red);
	recording:SetPosition(Position.Absolute, {
		Top		= 180,
		Left	= 20
	});
			
	self.view:AddComponent(recording);
	recording:Hide();
	
	-- Logo
	local logo = Logo('Waypoint-Editor', 'fun-bots');
	logo:SetPosition(Position.Absolute, {
		Top		= 20,
		Left	= 20
	});
	self.view:AddComponent(logo);
	
	-- Menu
	local navigation = Menu();
	
	navigation:SetPosition(Position.Absolute, {
		Top		= 20,
		Right	= 20
	});
	
	-- Waypoints
	local client = MenuItem('Client', 'client');
		client:SetIcon('Assets/Icons/Client.svg');
		
		client:AddItem(MenuItem('Load', 'waypoints_client_load', function(player)
			local expectedAmount = g_NodeCollection:Get();
			NetEvents:SendToLocal('ClientNodeEditor:ReceiveNodes', player, (#expectedAmount));
		end):SetIcon('Assets/Icons/Reload.svg'));
		
		client:AddItem(MenuItem('Save', 'waypoints_client_save', function(player)
			NetEvents:SendToLocal('ClientNodeEditor:SaveNodes', player);
		end):SetIcon('Assets/Icons/Save.svg'));
		
	navigation:AddItem(client, 'UserInterface.WaypointEditor.Nodes.Client');
	
	local server = MenuItem('Server', 'server');
		server:SetIcon('Assets/Icons/Server.svg');
		
		server:AddItem(MenuItem('Load', 'waypoints_server_load', function(player)
			g_NodeCollection:Load();
		end):SetIcon('Assets/Icons/Reload.svg'));
		
		server:AddItem(MenuItem('Save', 'waypoints_server_save', function(player)
			g_NodeCollection:Save();
		end):SetIcon('Assets/Icons/Save.svg'));
	navigation:AddItem(server, 'UserInterface.WaypointEditor.Nodes.Server');

	-- View
	local view = MenuItem('View', 'view');
		view:SetIcon('Assets/Icons/View.svg');
		
		view:AddItem(MenuItem('Lines', 'lines', function(player)
			Config.drawWaypointLines = not Config.drawWaypointLines;
		end));
		
		view:AddItem(MenuItem('Labels', 'labels', function(player)
			Config.drawWaypointIDs = not Config.drawWaypointIDs;
		end));
		
	navigation:AddItem(view, 'UserInterface.WaypointEditor.View');
	
	navigation:AddItem(MenuItem('Back', 'back', 'UI:VIEW:' .. self.view:GetName() .. ':HIDE', 'F12'));
	
	-- Tools-Menu
	local tools = Menu();
	
	tools:AddItem(MenuItem('Start Trace', 'trace_toggle', function(player)		
		if self.tracing then
			NetEvents:SendToLocal('ClientNodeEditor:EndTrace', player);
		else
			NetEvents:SendToLocal('ClientNodeEditor:StartTrace', player);
		end
	end):SetIcon('Assets/Icons/Start.svg'), 'UserInterface.WaypointEditor.Tracing');
	
	tools:AddItem(MenuItem('Save Trace', 'trace_save', function(player)
		NetEvents:SendToLocal('ClientNodeEditor:SaveTrace', player, tonumber(0));
	end):SetIcon('Assets/Icons/Save.svg'), 'UserInterface.WaypointEditor.TraceSaving');
	
	tools:AddItem(MenuItem('Spawn Bot on Way', 'bot_spawn_path', function(player)
		print('bot_spawn_path Executed');
	end):SetIcon('Assets/Icons/SpawnBotWay.svg'), 'UserInterface.WaypointEditor.SpawnBot');
	
	tools:AddItem(MenuItem('Clear Trace', 'trace_clear', function(player)
		NetEvents:SendToLocal('ClientNodeEditor:ClearTrace', player);
	end):SetIcon('Assets/Icons/Clear.svg'), 'UserInterface.WaypointEditor.TraceClear');
	
	tools:AddItem(MenuItem('Reset all Traces', 'trace_reset_all', function(player)
		g_NodeCollection:Clear();
		NetEvents:BroadcastLocal('NodeCollection:Clear');
	end):SetIcon('Assets/Icons/Trash.svg'), 'UserInterface.WaypointEditor.TraceReset');
	
	navigation:AddItem(tools);
	
	self.view:AddComponent(navigation);
	
	local status = Box(Color.Blue);
	
	status:SetPosition(Position.Absolute, {
		Top		= 75,
		Left	= 15
	});
	
	local input_trace_index = Input(Type.Integer, 'trace_index', self.trace_index);
		
	input_trace_index:Disable();
	
	input_trace_index:AddArrow(Position.Left, '❰', function(player)
		-- Hide the old path
		NetEvents:SendToLocal('NodeCollection:HidePath', player, self.trace_index);
		
		self.trace_index = self.trace_index - 1;
		
		if (self.trace_index < 0) then
			local lastNode		= g_NodeCollection:GetLast();
			
			if lastNode == nil then
				self.trace_index = 0;
			else
				self.trace_index = lastNode.PathIndex;
			end
		end
		
		input_trace_index:SetValue(self.trace_index);
		self:UpdateNewPath(player);
	end);
	
	input_trace_index:AddArrow(Position.Right, '❱', function(player)
		-- Hide the old path
		NetEvents:SendToLocal('NodeCollection:HidePath', player, self.trace_index);
		
		self.trace_index	= self.trace_index + 1;
		local lastNode		= g_NodeCollection:GetLast();
		
		if lastNode == nil or self.trace_index > lastNode.PathIndex then
			self.trace_index = 0;
		end
		
		input_trace_index:SetValue(self.trace_index);
		self:UpdateNewPath(player);
	end);
	
	status:AddItem(Entry('trace_index', 'Current Trace Index', input_trace_index));
	status:AddItem(Entry('trace_waypoints', 'Waypoints', '' .. #g_NodeCollection:Get(nil, self.trace_index)));
	status:AddItem(Entry('trace_distance', 'Total Distance', '0 m'));
	
	self.view:AddComponent(status);
end

return WaypointEditor;