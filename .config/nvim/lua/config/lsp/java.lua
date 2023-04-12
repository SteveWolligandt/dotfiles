local M = {}
local cmp_nvim_lsp = require "cmp_nvim_lsp"
local jdtls = require'jdtls'
local home = os.getenv("HOME")
local mason_path = vim.fn.stdpath('data') .. '/mason'
local jdtls_bin = mason_path .. "/bin/jdtls"
local jdtls_path = mason_path .. "/packages/jdtls"
local equinox_version = '1.6.400.v20210924-0641'
local equinox_jar_path = 
  jdtls_path .. "/plugins/org.eclipse.equinox.launcher_" .. equinox_version .. ".jar"

local os = ''
if vim.fn.has "mac" == 1 then
  os = "mac"
elseif vim.fn.has "unix" == 1 then
  os = "linux"
elseif vim.fn.has "win32" == 1 then
  os = "win"
else
  vim.notify("Unsupported OS", vim.log.levels.WARN, { title = "Jdtls" })
end
local configuration_path = jdtls_path .. "/config_" .. os

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. '/.cache/jdtls/' .. project_name

local config = {
  cmd = {
    "java", -- or '/path/to/java17_or_newer/bin/java'

    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    -- 
    "-jar", equinox_jar_path,
    "-configuration", configuration_path,
    "-data", workspace_dir,
  },
  on_attach = require('config.lsp').on_attach,
  capabilities = cmp_nvim_lsp.default_capabilities()
}


-- function M.setup() 
  local keymap = vim.keymap.set

  keymap("n", "A-o", ":lua require'jdtls'.organize_imports()<cr>", { silent = true })
  keymap("n", "crv", ":lua require'jdtls'.extract_variable()<cr>", { silent = true })
  keymap("v", "crv", "<Esc>:lua require'jdtls'.extract_variable(true)<cr>", { silent = true })
  keymap("n", "crc", ":lua require'jdtls'.extract_constant()<cr>", { silent = true })
  keymap("v", "crc", "<Esc>:lua require'jdtls'.extract_constant(true)<cr>", { silent = true })
  keymap("v", "crm", "<Esc>:lua require'jdtls'.extract_method(true)<cr>", { silent = true })

  vim.cmd [[
  command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)
  command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)
  command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()
  command! -buffer JdtJol lua require('jdtls').jol()
  command! -buffer JdtBytecode lua require('jdtls').javap()
  command! -buffer JdtJshell lua require('jdtls').jshell()
  ]]
  jdtls.start_or_attach(config)
-- end
return M
