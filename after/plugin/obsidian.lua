-- Full description of  the configuration can be found at https://github.com/epwalsh/obsidian.nvim?tab=readme-ov-file#configuration-options

local function is_obsidian_directory(dir)
    local obsidian_path = dir .. "/.obsidian"
    return vim.fn.isdirectory(obsidian_path) == 1
end

local cwd = vim.fn.getcwd()

if not is_obsidian_directory(cwd) then
    return
end

vim.keymap.set('n', '<Leader>bl', '<cmd>ObsidianBacklinks<cr>')

require("obsidian").setup({
    workspaces = {
        {
            name = "Anonymous Vault",
            path = cwd,
            overrides = {
                notes_subdir = vim.NIL,
                new_notes_location = "current_dir",
                templates = {
                    folder = vim.NIL,
                },
                disable_frontmatter = true,
            },
        },
    },
    log_level = vim.log.levels.INFO,

    completion = {
        nvim_cmp = true,
        min_chars = 2,
    },

    new_notes_location = "notes_subdir",
    preferred_link_style = "wiki",
    disable_frontmatter = true,

    picker = {
        name = "fzf-lua",
    },

    search_max_lines = 1000,

    ui = {
        enable = false,
    },
})
