local function get_hex_color(group, color_type)
  local hl = vim.api.nvim_get_hl_by_name(group, true)
  if color_type == "fg" and hl.foreground then
    return string.format("#%06x", hl.foreground)
  elseif color_type == "bg" and hl.background then
    return string.format("#%06x", hl.background)
  elseif color_type == "sp" and hl.special then
    return string.format("#%06x", hl.special)
  else
    return nil
  end
end

return {
  get_hex_color = get_hex_color,
}
