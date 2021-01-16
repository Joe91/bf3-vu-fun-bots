class 'FunBotUIServer';

require('__shared/ArrayMap');
local TraceManager	= require('traceManager');

function FunBotUIServer:__init()
	self._webui			= 0;
	self._authenticated	= ArrayMap();

	Events:Subscribe('Player:Left', self, self._onPlayerLeft);
	NetEvents:Subscribe('UI_Request_Open', self, self._onUIRequestOpen);
	NetEvents:Subscribe('BotEditor', self, self._onBotEditorEvent);
end

function FunBotUIServer:_onBotEditorEvent(player, data)
	print('UIServer: BotEditor (' .. tostring(data) .. ')');
	
	if (Config.settingsPassword ~= nil and self:_isAuthenticated(player.accountGuid) ~= true) then
			print(player.name .. ' has no permissions for Bot-Editor.');
			ChatManager:Yell('You are not permitted to change Bots. Please press F12 for authenticate!', 2.5);
		return;
	end
	
	local request = json.decode(data);
	
	if request.action == "request_settings" then
		NetEvents:SendTo('UI_Settings', player, Config);
		
	-- Bots
	-- elseif request.action == "bot_spawn_default" then
	-- elseif request.action == "bot_spawn_random" then
	-- elseif request.action == "bot_kick_all" then
	-- elseif request.action == "bot_respawn" then
	
	-- Trace
	-- elseif request.action == "trace_toggle" then
	-- elseif request.action == "trace_clear_current" then
	-- elseif request.action == "trace_reset_all" then
	-- elseif request.action == "trace_save" then
	-- elseif request.action == "trace_reload" then
	
	else
		ChatManager:Yell(request.action .. ' is currently not implemented. 😒', 2.5);
	end
end

function FunBotUIServer:_onPlayerLeft(player)
	-- @ToDo current fix for auth-check after rejoin, remove it later or make it as configuration!
	self._authenticated:delete(tostring(player.accountGuid));
end

function FunBotUIServer:_onUIRequestOpen(player, data)
	print(player.name .. ' requesting open Bot-Editor.');

	if (Config.settingsPassword == nil or self:_isAuthenticated(player.accountGuid)) then
		if (Config.settingsPassword == nil) then
			ChatManager:Yell('The Bot-Editor is not protected by an password!', 2.5);
			NetEvents:SendTo('UI_Password_Protection', player, 'true');
		end
		
		print('Open Bot-Editor for ' .. player.name .. '.');
		NetEvents:SendTo('UI_Toggle', player);
		NetEvents:SendTo('UI_Show_Toolbar', player, 'true');
	else
		if (data == nil) then
			print('Ask ' .. player.name .. ' for Bot-Editor password.');
			ChatManager:Yell('Please authenticate with password!', 2.5);
			NetEvents:SendTo('UI_Request_Password', player, 'true');
		else
			local form = json.decode(data);
			
			if (form.password ~= nil or form.password ~= '') then
				print(player.name .. ' has entered following Password: ' .. form.password);
				
				if (form.password == Config.settingsPassword) then
					self._authenticated:add(tostring(player.accountGuid));
					print('accountGuid: ' .. tostring(player.accountGuid));
					ChatManager:Yell('Successfully authenticated.', 2.5);
					NetEvents:SendTo('UI_Request_Password', player, 'false');
					NetEvents:SendTo('UI_Show_Toolbar', player, 'true');
				else
					print(player.name .. ' has entered a bad password.');
					NetEvents:SendTo('UI_Request_Password_Error', player, 'The password you entered is not correct!');
					ChatManager:Yell('Bad password.', 2.5);
				end
			else
				print(player.name .. ' has entered an empty password.');
				NetEvents:SendTo('UI_Request_Password_Error', player, 'The password you entered is not correct!');
				ChatManager:Yell('Please enter a password!', 2.5);
			end
		end
	end
end

function FunBotUIServer:_isAuthenticated(guid)
	if self._authenticated:isEmpty() then
		return false;
	end
	
	return self._authenticated:exists(tostring(guid));
end

if (g_FunBotUIServer == nil) then
	g_FunBotUIServer = FunBotUIServer();
end

return g_FunBotUIServer;
