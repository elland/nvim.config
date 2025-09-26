return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'j-hui/fidget.nvim', opts = {} },
    { 'folke/neodev.nvim', opts = {} },
  },
  config = function()
    local lspconfig = require('lspconfig')
    local capabilities = vim.tbl_deep_extend(
      'force',
      vim.lsp.protocol.make_client_capabilities(),
      require('cmp_nvim_lsp').default_capabilities()
    )

    local function setup_keymaps(event)
      local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
      end

      local telescope = require('telescope.builtin')
      map('gd', telescope.lsp_definitions, '[G]oto [D]efinition')
      map('gr', telescope.lsp_references, '[G]oto [R]eferences')
      map('gI', telescope.lsp_implementations, '[G]oto [I]mplementation')
      map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      map('<leader>D', telescope.lsp_type_definitions, 'Type [D]efinition')
      map('<leader>ds', telescope.lsp_document_symbols, '[D]ocument [S]ymbols')
      map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
      map('<leader>lc', telescope.lsp_incoming_calls, '[L]SP incoming [c]alls')
      map('<leader>lo', telescope.lsp_outgoing_calls, '[L]SP [o]utgoing calls')
      
      map('K', function()
        vim.lsp.buf.hover()
        vim.lsp.buf.hover()
      end, 'Hover Documentation')
    end

    local function setup_ui()
      local border = 'single'
      vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
      vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })
      vim.diagnostic.config({ float = { border = border } })
    end

    local function setup_highlight(event, client)
      if not (client and client.server_capabilities.documentHighlightProvider) then return end
      
      local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
      
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })
      
      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })
      
      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
        callback = function(detach_event)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds({ group = 'lsp-highlight', buffer = detach_event.buf })
        end,
      })
    end

    local function setup_inlay_hints(event, client)
      if not (client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint) then return end
      
      vim.keymap.set('n', '<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
      end, { buffer = event.buf, desc = 'LSP: [T]oggle Inlay [H]ints' })
    end

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        
        setup_keymaps(event)
        setup_ui()
        -- setup_highlight(event, client)
        setup_inlay_hints(event, client)
      end,
    })

    lspconfig.hls.setup({
      capabilities = capabilities,
      filetypes = { 'haskell', 'lhaskell' },
      settings = {
        haskell = {
          plugin = {
            stan = { globalOn = false },
            semanticTokens = { globalOn = true },
          },
        },
      },
    })

    lspconfig.rust_analyzer.setup({
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = {
            enable = true,
            command = "check",
            extraArgs = {"--target-dir", "/tmp/rust/"},
          },
        },
      },
    })

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          completion = { callSnippet = 'Replace' },
        },
      },
    })

    lspconfig.helm_ls.setup({
      capabilities = capabilities,
      settings = {
        ['helm-ls'] = {
          yamlls = { path = 'yaml-language-server' },
        },
      },
    })
  end,
}

