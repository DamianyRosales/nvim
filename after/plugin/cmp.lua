local cmp = require("cmp")
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.setup({
    window = {
        completion = cmp.config.window.bordered({
            border = "single",
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
            side_padding = 0,
        }),
    },

})

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

