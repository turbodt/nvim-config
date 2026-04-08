local function is_obsidian_directory(dir)
      local obsidian_path = dir .. "/.obsidian"
      return vim.fn.isdirectory(obsidian_path) == 1
end

local cwd = vim.fn.getcwd()

if not is_obsidian_directory(cwd) then
      return
end

local M = {}

local function get_hashtags()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local tags = {}
    for lnum, line in ipairs(lines) do
      for tag in line:gmatch("#%w+") do
        table.insert(tags, { tag = tag, line = lnum })
      end
    end
    return tags
end

local function open_hashtag_panel()
    local tags = get_hashtags()
    if #tags == 0 then
      print("No hashtags found!")
      return
    end

    local buf = vim.api.nvim_create_buf(false, true)
    local width = 20
    local height = math.min(#tags, 10)
    local opts = {
      relative = "editor",
      width = width,
      height = height,
      row = 1,
      col = 1,
      style = "minimal",
      border = "single",
    }
    vim.api.nvim_open_win(buf, true, opts)

    local lines = {}
    for _, tag in ipairs(tags) do
      table.insert(lines, tag.tag .. " (line " .. tag.line .. ")")
    end
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

    vim.api.nvim_buf_set_keymap(buf, "n", "<CR>", ":lua require('plugin').jump_to_hashtag()<CR>", { noremap = true, silent = true })

    M.hashtag_list = tags
end

function M.jump_to_hashtag()
    local win = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_win_get_buf(win)
    local cursor = vim.api.nvim_win_get_cursor(win)
    local line_num = cursor[1]
    local tag = M.hashtag_list[line_num]
    if tag then
      vim.api.nvim_win_close(win, true)
      vim.api.nvim_win_set_cursor(0, { tag.line, 0 })
    end
end

function M.setup()
    vim.api.nvim_create_user_command("HashtagPanel", open_hashtag_panel, {})
    vim.api.nvim_set_keymap("n", "<leader>ht", ":lua require('outline').open_hashtag_panel()<CR>", { noremap = true, silent = true })
    return M
end


return M.setup()
