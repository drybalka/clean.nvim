local M = {}

local function clean_keys(mode, prefix, keys, suffix, rhs)
  for key in keys:gmatch '<[^<>]->' do
    -- print(prefix .. key .. suffix)
    vim.keymap.set(mode, prefix .. key .. suffix, rhs, { nowait = true })
  end
  local single_keys = keys:gsub('<[^<>]->', '')
  for key in single_keys:gmatch '.' do
    -- print(prefix .. key .. suffix)
    vim.keymap.set(mode, prefix .. key .. suffix, rhs, { nowait = true })
  end
end

M.clean_plugins = function()
	vim.o.loadplugins = false
	-- vim.g.loaded_gzip = 1
	-- vim.g.loaded_zip = 1
	-- vim.g.loaded_zipPlugin = 1
	-- vim.g.loaded_tar = 1
	-- vim.g.loaded_tarPlugin = 1
	-- vim.g.loaded_matchit = 1
	-- vim.g.loaded_2html_plugin = 1
	-- vim.g.loaded_netrw = 1
	-- vim.g.loaded_netrwPlugin = 1
	-- vim.g.loaded_netrwSettings = 1	
end

M.clean_keymap = function()
  local i_ctrl_G_keys = '<C-j>j<Down><C-k>k<Up>uU'
  clean_keys('!', '<C-g>', i_ctrl_G_keys, '', '<Nop>')

  -- local i_ctrl_R_keys = '<C-r><C-o><C-p>'
  -- clean_keys('!', '<C-r>', i_ctrl_R_keys, '', '<Nop>')

  local i_ctrl_X_ctrl_keys = 'abcdefghijklmnopqrstuvwxyz1234567890[]'
  clean_keys('!', '<C-x><C-', i_ctrl_X_ctrl_keys, '>', '<Nop>')
  clean_keys('!', '<C-x>', 's', '', '<Nop>')

  local i_ctrl_keys = '@abcdefghijklmnopqrstuvwxyz[\\]^_'
  clean_keys('!', '<C-', i_ctrl_keys, '>', '<Nop>')
  vim.keymap.del('!', '<Esc>')
  vim.keymap.del('!', '<Cr>')
  vim.keymap.del('!', '<Tab>')

  local nv_q_keys = ':/?'
  clean_keys({ 'n', 'v' }, 'q', nv_q_keys, '', '<Nop>')

  local vo_textobjects = '\'"()><BW[]`bpstw{}'
  clean_keys('v', 'i', vo_textobjects, '', '<Nop>')
  clean_keys('v', 'a', vo_textobjects, '', '<Nop>')
  clean_keys('o', 'i', vo_textobjects, '', '<Esc>')
  clean_keys('o', 'a', vo_textobjects, '', '<Esc>')

  local nvo_marks = '`\'"^.()><[]{}'
  clean_keys({ 'n', 'v' }, "'", nvo_marks, '', '<Nop>')
  clean_keys('o', "'", nvo_marks, '', '<Esc>')
  clean_keys({ 'n', 'v' }, '`', nvo_marks, '', '<Nop>')
  clean_keys('o', '`', nvo_marks, '', '<Esc>')

  local nvo_bracket_keys = "<C-d><C-i>#'(*`/DIP[]cdfimpsz{"
  clean_keys({ 'n', 'v' }, '[', nvo_bracket_keys, '', '<Nop>')
  clean_keys({ 'n', 'v' }, ']', nvo_bracket_keys, '', '<Nop>')
  clean_keys('o', '[', nvo_bracket_keys, '', '<Esc>')
  clean_keys('o', ']', nvo_bracket_keys, '', '<Esc>')

  local nvo_g_keys = "<C-a><C-g><C-h><C-]>#$&'`*+,-08;<?DEHIJNPQRTUV]^_adefFhijkmMnopqrstuvwx@~"
  clean_keys({ 'n', 'v' }, 'g', nvo_g_keys, '', '<Nop>')
  clean_keys('o', 'g', nvo_g_keys, '', '<Esc>')

  local nv_zu_keys = 'wgWG'
  clean_keys({ 'n', 'v' }, 'zu', nv_zu_keys, '', '<Nop>')
  local nv_z_keys = '<Cr>1234567890+-.=ACDEFGHLMNORWX^abcdefghijklmnopPrstuvwxyz'
  clean_keys({ 'n', 'v' }, 'z', nv_z_keys, '', '<Nop>')

  local n_ctrl_W_g_keys = '<C-]>}fFtT<Tab>'
  clean_keys({ 'n', 'v' }, '<C-w>g', n_ctrl_W_g_keys, '', '<Nop>')
  local n_ctrl_W_keys = 'abcdefghijklmnopqrstuvwxyz+-><=]^_|}'
  clean_keys({ 'n', 'v' }, '<C-w><C-', n_ctrl_W_keys, '>', '<Nop>')
  clean_keys({ 'n', 'v' }, '<C-w>', n_ctrl_W_keys, '', '<Nop>')

  local nvo_ctrl_keys = '@abcdefghjklmnpqstuwxyz\\]^_'
  clean_keys({ 'n', 'v' }, '<C-', nvo_ctrl_keys, '>', '<Nop>')
  clean_keys('o', '<C-', nvo_ctrl_keys, '>', '<Esc>')

  local o_keys = "opaitfTF'`[]{}()vVgz,;|?HLM+-_*%#"
  clean_keys('o', '', o_keys, '', '<Esc>')

  local v_keys = 'uoai'
  clean_keys('v', '', v_keys, '', '<Nop>')

  local nv_keys = ' !"#%&\'()*+,-.0;><=?@FHJKLMQSTUZ[]_`fmqstz{}|~'
  clean_keys({ 'n', 'v' }, '', nv_keys, '', '<Nop>')

  -- Potentially useful: <c-r>, <c-w>, <c-l>, <c-o/i/t>, <c-e/y>, <c-d/u>, <c-b/f>, <c-a/x>
end
-- Basic functionality
-- i: only basic input keys
-- n, v: <C-v>, <C-o/i>, $, ^, /, n, N, :, u, <C-r>, A, B, C, D, E, G, I, O, P, R, V, W, X, Y, a, b, c/cc, d/dd, e, g/gg, i, o, hjkl, p, r, v, w, x, y/yy

return M
