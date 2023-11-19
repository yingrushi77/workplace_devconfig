local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("没有找到 dashboard")
  return
end

local custom_footer = {
  "",
  "",
  "",
  "",
  "        你一定要努力，坚决不能放弃，千万不要心急!",
}

local custom_center = {
  {
    icon = "                        ",
    desc = "Projects                            ",
    action = "Telescope projects",
  },
  {
    icon = "                        ",
    desc = "Recently files                      ",
    action = "Telescope oldfiles",
  },
  {
    icon = "                        ",
    desc = "Edit keybindings                    ",
    action = "edit ~/.config/nvim/lua/keybindings.lua",
  },
  {
    icon = "                        ",
    desc = "Edit Projects                       ",
    action = "edit ~/.local/share/nvim/project_nvim/project_history",
  },
  -- {
  --   icon = "  ",
  --   desc = "Edit .bashrc                        ",
  --   action = "edit ~/.bashrc",
  -- },
  -- {
  --   icon = "  ",
  --   desc = "Change colorscheme                  ",
  --   action = "ChangeColorScheme",
  -- },
  -- {
  --   icon = "  ",
  --   desc = "Edit init.lua                       ",
  --   action = "edit ~/.config/nvim/init.lua",
  -- },
  -- {
  --   icon = "  ",
  --   desc = "Find file                           ",
  --   action = "Telescope find_files",
  -- },
  -- {
  --   icon = "  ",
  --   desc = "Find text                           ",
  --   action = "Telescopecope live_grep",
  -- },
}

local custom_header = {
[[]],
"",
"",
"",
"",
"",
[[     ██╗   ██╗██╗███╗   ██╗ ██████╗ ██████╗ ██╗   ██╗███████╗██╗  ██╗██╗]],
[[	╚██╗ ██╔╝██║████╗  ██║██╔════╝ ██╔══██╗██║   ██║██╔════╝██║  ██║██║]],
[[	 ╚████╔╝ ██║██╔██╗ ██║██║  ███╗██████╔╝██║   ██║███████╗███████║██║]],
[[	  ╚██╔╝  ██║██║╚██╗██║██║   ██║██╔══██╗██║   ██║╚════██║██╔══██║██║]],
[[	   ██║   ██║██║ ╚████║╚██████╔╝██║  ██║╚██████╔╝███████║██║  ██║██║]],
[[	   ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝]],
"",
"",
"",
"",
}

db.setup({
	config = {
		header = custom_header,
		center = custom_center,
		footer = custom_footer,
		disable_move
	}
})
