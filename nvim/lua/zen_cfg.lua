require('zen-mode').setup({
    window = {
        width = 1,
        height = 1,
    },
})

vim.keymap.set('n', '<leader>z', '<cmd>ZenMode<cr>', { desc = 'Toggle zen mode' })
