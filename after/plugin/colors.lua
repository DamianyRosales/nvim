vim.cmd('set background=dark')
vim.g.everforest_background='hard'
vim.g.everforest_better_performance = 1
vim.g.everforest_enable_italic = 1
vim.g.everforest_transparent_background=2
vim.g.everforest_sign_column_background='none'
vim.g.everforest_spell_foreground='colored'
vim.g.everforest_ui_contrast='high'
vim.g.everforest_diagnostic_text_highlight=1
vim.g.everforest_diagnostic_line_highlight=1
vim.g.everforest_current_word='italic'
vim.cmd('colorscheme everforest')

vim.fn.sign_define({
    {
        name='DiagnosticSignError',
        text='E',
        texthl='DiagnosticSignError',
        linehl='ErrorLine'
    },
    {
        name='DiagnosticSignWarn',
        text='W',
        texthl='DignosticSignError',
        linehl='WarningLine'
    },
    {
        name='DiagnosticSignInfo',
        text='I',
        texthl='DignosticSignInfo',
        linehl='InfoLine'
    },
    {
        name='DiagnosticSignHint',
        text='H',
        texthl='DignosticSignHint',
        linehl='HintLine'
    },
})
