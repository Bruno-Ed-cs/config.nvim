
-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
  clangd = {
  },
  -- gopls = {},
  pyright = {},
  -- rust_analyzer = {},
  html = { filetypes = { 'html', 'twig', 'hbs'} },

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = true , library = {"/usr/lib/luarocks/", "home/$USER/.luarocks/lib/luarocks/"}},
      telemetry = { enable = false },
      -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
      -- diagnostics = { disable = { 'missing-fields' } },
    },
  },

  jdtls = {
        java = {
          configuration = { workspaceCacheLimit = 999},
          jdt = { ls ={javac = {enabled = "on"}}},
          signatureHelp = { enabled = true , description = {enabled = true}},
          contentProvider = { preferred = 'fernflower' },  -- Use fernflower to decompile library code
          -- Specify any completion options
          completion = {
            favoriteStaticMembers = {
              "org.hamcrest.MatcherAssert.assertThat",
              "org.hamcrest.Matchers.*",
              "org.hamcrest.CoreMatchers.*",
              "org.junit.jupiter.api.Assertions.*",
              "java.util.Objects.requireNonNull",
              "java.util.Objects.requireNonNullElse",
              "org.mockito.Mockito.*"
            },
            filteredTypes = {
              "com.sun.*",
              "io.micrometer.shaded.*",
              "java.awt.*",
              "jdk.*", "sun.*",
            },
          },
          -- Specify any options for organizing imports
          sources = {
            organizeImports = {
              starThreshold = 9999;
              staticStarThreshold = 9999;
            },
          },
          -- How code generation should act
          codeGeneration = {
            toString = {
              template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
            },
            hashCodeEquals = {
              useJava7Objects = true,
            },
            useBlocks = true,
          },

        }
      },
 
}


-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()

local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end


--Godot server 
require('lspconfig').gdscript.setup(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,

      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}


