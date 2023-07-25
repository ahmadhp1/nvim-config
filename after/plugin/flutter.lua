local telescope = require("telescope")

telescope.load_extension("flutter")

vim.keymap.set("n", '<leader>ru', vim.cmd.FlutterRun)
vim.keymap.set("n", '<leader>re', vim.cmd.FlutterReload)
vim.keymap.set("n", '<leader>rs', vim.cmd.FlutterRestart)
vim.keymap.set("n", '<leader>q', vim.cmd.FlutterQuit)

vim.keymap.set("n", '<leader><leader>f', telescope.extensions.flutter.commands)
