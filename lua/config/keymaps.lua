--)LazyVim keymaps in https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
--
--
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Treesitter
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function () 
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, {})

-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
