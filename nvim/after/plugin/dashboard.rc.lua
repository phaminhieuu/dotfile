local status, dashboard = pcall(require, "dashboard")
if not status then
	return
end

vim.cmd([[highlight DashboardHeader guifg=#2AA198]])
vim.cmd([[highlight DashboardIcon guifg=#268BD2]])
vim.cmd([[highlight DashboardDesc guifg=#268BD2]])
vim.cmd([[highlight DashboardKey guifg=#DC322F]])

local header = {
	"",
	"",
	"",
	"███╗   ██╗ ██████╗ ██╗   ██╗ █████╗ ███████╗██████╗  █████╗ ",
	"████╗  ██║██╔═══██╗██║   ██║██╔══██╗██╔════╝██╔══██╗██╔══██╗",
	"██╔██╗ ██║██║   ██║██║   ██║███████║█████╗  ██████╔╝███████║",
	"██║╚██╗██║██║   ██║╚██╗ ██╔╝██╔══██║██╔══╝  ██╔══██╗██╔══██║",
	"██║ ╚████║╚██████╔╝ ╚████╔╝ ██║  ██║███████╗██║  ██║██║  ██║",
	"╚═╝  ╚═══╝ ╚═════╝   ╚═══╝  ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝",
	"",
	"",
}

dashboard.setup({
	theme = "doom",
	config = {
		header = header,
		center = {
			{
				icon = " ",
				desc = "File browser",
				key = "sf",
			},
			{
				icon = " ",
				desc = "Find File",
				key = ";f",
			},
			{
				icon = " ",
				desc = "Live grep",
				key = ";r",
			},
		},
	},
	footer = {},
})
