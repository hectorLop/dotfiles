function ColorMyPencils(color)
    --color = color or "rose-pine"
    vim.opt.termguicolors = true
    vim.opt.background = "dark"
    vim.g.gruvbox_material_background = 'soft'
    vim.g.gruvbox_material_better_performance = 1

    vim.cmd.colorscheme("gruvbox-material")


    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
