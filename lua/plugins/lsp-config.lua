return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.diagnostic.config({
        virtual_text = {
          current_line = true
        }
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if client ~= nil then
            if client:supports_method('textDocument/completion') then
              vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
            end

            local map = function(keys, func, desc, mode)
              mode = mode or 'n'
              vim.keymap.set(mode, keys, func, { buffer = ev.buf, desc = 'LSP: ' .. desc })
            end

            map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
            map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
            map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          end
        end,
      })

      vim.cmd("set completeopt+=noselect,menuone,fuzzy")

      local lspconfig = require('lspconfig')
      lspconfig.denols.setup {}
      lspconfig.rust_analyzer.setup {}
      lspconfig.gopls.setup {}
      lspconfig.elp.setup {}
      lspconfig.omnisharp.setup {
        cmd = { "omnisharp" }
      }
      lspconfig.lua_ls.setup {
        on_init = function(client)
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if path ~= vim.fn.stdpath('config') and (vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc')) then
              return
            end
          end

          client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
              version = 'LuaJIT'
            },
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
                "${3rd}/luv/library"
                -- "${3rd}/busted/library",
              }
            }
          })
        end,
        settings = {
          Lua = {}
        }
      }
    end
  }
}
