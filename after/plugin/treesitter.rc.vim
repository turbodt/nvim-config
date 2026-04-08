lua << EOF
local ok, ts = pcall(require, "nvim-treesitter")
if not ok then
  vim.api.nvim_echo({{"Not loaded treesitter", "WarningMsg"}}, false, {})
  return
end

ts.setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

ts.install({
  "bash",
  "bibtex",
  "c",
  "cpp",
  "html",
  "http",
  "json",
  "php",
  "python",
  "regex",
  "scss",
  "toml",
  "tsx",
  "typescript",
  "yaml",
})

vim.treesitter.language.register("tsx", { "javascript", "typescript.tsx" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "bash",
    "bibtex",
    "c",
    "cpp",
    "html",
    "http",
    "json",
    "php",
    "python",
    "regex",
    "scss",
    "toml",
    "typescript",
    "yaml",
    "javascript",
    "typescript.tsx",
  },
  callback = function()
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
EOF
