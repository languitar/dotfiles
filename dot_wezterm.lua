local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 28

-- Configure a reasonable leader key similar to screen, so we retain tmux and nvim, which are in use
config.leader = { key = "a", mods = "CTRL" }
wezterm.on("update-right-status", function(window, pane)
	local leader = ""
	if window:leader_is_active() then
		leader = "󰘳"
	end
	window:set_right_status(leader)
end)

config.launch_menu = {
	{
		label = "WSL fish",
		args = { "wsl", "~", "--", "fish" },
	},
	{
		label = "Powershell",
		args = { "powershell.exe", "-NoLogo" },
	},
}
config.default_prog = { "wsl", "~", "--", "fish" }

config.keys = {
	-- used by broot
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "v",
		mods = "LEADER",
		action = act.SplitPane({
			direction = "Right",
			size = { Percent = 50 },
		}),
	},
	{
		key = "b",
		mods = "LEADER",
		action = act.SplitPane({
			direction = "Down",
			size = { Percent = 50 },
		}),
	},
	{
		key = "x",
		mods = "LEADER",
		action = act.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "X",
		mods = "LEADER",
		action = act.CloseCurrentTab({ confirm = true }),
	},
	{
		key = ",",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}

return config
