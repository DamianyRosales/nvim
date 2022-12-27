local cmp = require("cmp")

cmp.setup({
    window = {
        completion = cmp.config.window.bordered({
            border = "single",
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
            side_padding = 0,

        }),
    },

})
