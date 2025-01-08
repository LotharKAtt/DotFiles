-- Return to the same line when reopening a file
if vim.fn.has("autocmd") == 1 then
  vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
      local last_position = vim.fn.line("'\"")
      if last_position > 1 and last_position <= vim.fn.line("$") then
        vim.cmd("normal! g'\"")
      end
    end,
  })
end
