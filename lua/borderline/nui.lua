local util = require('borderline.util')
local cache = require('borderline.cache')
local M = {}

---@type BorderlineOptions
local opts = {}

local orig = {}

local popups = {}

local override_nui_border = function(nui_border, force)
  -- assume normalized
  return util.override_border({ border = nui_border }, force)
end

local borderline_setstyle = function(self, style, force)
  util.normalize_config()
  if not orig.set_style then
    vim.notify('borderline.nvim: could not find nui.popup.border.set_style()', vim.log.levels.ERROR, {})
    return
  end
  local border = util.normalize_border(style)
  style = override_nui_border(border, force)
  orig.set_style(self, border)
end

M.update_borders = function()
  util.normalize_config()
  for winid, popup in pairs(popups) do
    if popup.border._ and popup.border._.style and popup.border.winid then
      if cache.nui_had_border[winid] == nil then
        cache.nui_had_border[winid] = util.has_border(popup.border._.style)
      end
      local border_override = util.override_border({ border = popup.border._.style }, cache.nui_had_border[winid])
          .border
      local success, _ = pcall(borderline_setstyle, popup.border, border_override, cache.nui_had_border[winid])
      if not success then
      end
      success, _ = pcall(popup.update_layout, popup)
      if not success then
      end
    end
  end
end

local borderline_mount = function(self, mount_fn)
  util.normalize_config()
  if not mount_fn then
    vim.notify('borderline.nvim: could not find nui.*.mount()', vim.log.levels.ERROR, {})
    return
  end
  local has_border = false

  local border_internal = self.border._
  if border_internal.style then
    has_border = util.has_border(border_internal.style)
    local border_override = util.override_border(
      { border = border_internal.style }, has_border
    ).border
    self.border:set_style(border_override, has_border)
    -- self._.win_config.border = self.border:get()
    self:update_layout()
  end

  mount_fn(self)

  if self.winid then
    popups[self.winid] = self
    if cache.nui_had_border[self.winid] == nil then
      cache.nui_had_border[self.winid] = util.has_border(self.border._.style)
    end
  end
end

M.setup = function(borderline_opts)
  opts = borderline_opts
  local success_popup, nui_popup = pcall(require, 'nui.popup')
  local success_border, nui_border = pcall(require, 'nui.popup.border')
  if success_popup and success_border then
    orig.set_style = nui_border.set_style
    nui_border.set_style = borderline_setstyle
    orig.popup_mount = nui_popup.mount
    nui_popup.mount = function(self)
      borderline_mount(self, orig.popup_mount)
    end
  end
end

return M
