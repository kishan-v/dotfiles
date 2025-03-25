return {
	"nosduco/remote-sshfs.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	opts = { -- https://github.com/nosduco/remote-sshfs.nvim?tab=readme-ov-file
		sshfs_args = { -- arguments to pass to the sshfs command
			"-o reconnect",
			"-o ConnectTimeout=5",
		},
		mounts = {
			base_dir = vim.fn.expand("$HOME") .. "/.sshfs/", -- base directory for mount points
			unmount_on_exit = true, -- run sshfs as foreground, will unmount on vim exit
		},
		handlers = {
			on_connect = {
				change_dir = true, -- when connected change vim working directory to mount point
			},
			on_disconnect = {
				clean_mount_folders = true, -- remove mount point folder on disconnect/unmount
			},
		},
		confirm = {
			connect = false, -- prompt y/n when host is selected to connect to
			change_dir = false, -- prompt y/n to change working directory on connection (only applicable if handlers.on_connect.change_dir is enabled)
		},
	},
}
