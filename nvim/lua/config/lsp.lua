vim.api.nvim_create_autocmd("LspAttach", {
    desc = "enable completion",
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        local bufnr = ev.buf

        local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
        client.server_capabilities.completionProvider.triggerCharacters = chars

        vim.lsp.completion.enable(true, client.id, bufnr, {
            autotrigger = true,
        })
    end
})

vim.lsp.config("*", {})
vim.lsp.enable('pyright')
vim.lsp.enable("rust_analyzer")

