-- Solarized Dark
local M = {}

M.colors = {
  dark0_hard = "#2b1b17",
  dark0 = "#3a2822",
  dark0_soft = "#4e3c32",
  dark1 = "#5f4b3a",
  dark2 = "#7e6651",
  dark3 = "#94785f",
  dark4 = "#d8c8bb",
  light0_hard = "#f8f5ec",
  light0 = "#f8f5ec",
  light0_soft = "#f8f5ec",
  light1 = "#94785f",
  light2 = "#7e6651",
  light3 = "#5f4b3a",
  light4 = "#4e3c32",
  bright_red = "#cb4b16",
  bright_green = "#859900",
  bright_yellow = "#b58900",
  bright_blue = "#268bd2",
  bright_purple = "#6c71c4",
  bright_aqua = "#2aa198",
  bright_orange = "#d65d0e",
  neutral_red = "#cb4b16",
  neutral_green = "#859900",
  neutral_yellow = "#b58900",
  neutral_blue = "#268bd2",
  neutral_purple = "#6c71c4",
  neutral_aqua = "#2aa198",
  neutral_orange = "#d65d0e",
  faded_red = "#cb4b16",
  faded_green = "#859900",
  faded_yellow = "#b58900",
  faded_blue = "#268bd2",
  faded_purple = "#6c71c4",
  faded_aqua = "#2aa198",
  faded_orange = "#d65d0e",
  gray = "#94785f",
}

M.get_base_colors = function(bg, contrast)
  local config = require("catpuccin").config
  local p = M.colors

  for color, hex in pairs(config.palette_overrides) do
    p[color] = hex
  end

  if bg == nil then
    bg = vim.o.background
  end

  local colors = {
    dark = {
      bg0 = p.dark0,
      bg1 = p.dark1,
      bg2 = p.dark2,
      bg3 = p.dark3,
      bg4 = p.dark4,
      fg0 = p.light0,
      fg1 = p.light1,
      fg2 = p.light2,
      fg3 = p.light3,
      fg4 = p.light4,
      red = p.bright_red,
      green = p.bright_green,
      yellow = p.bright_yellow,
      blue = p.bright_blue,
      purple = p.bright_purple,
      aqua = p.bright_aqua,
      orange = p.bright_orange,
      neutral_red = p.neutral_red,
      neutral_green = p.neutral_green,
      neutral_yellow = p.neutral_yellow,
      neutral_blue = p.neutral_blue,
      neutral_purple = p.neutral_purple,
      neutral_aqua = p.neutral_aqua,
      gray = p.gray,
    },
    light = {
      bg0 = p.light0,
      bg1 = p.light1,
      bg2 = p.light2,
      bg3 = p.light3,
      bg4 = p.light4,
      fg0 = p.dark0,
      fg1 = p.dark1,
      fg2 = p.dark2,
      fg3 = p.dark3,
      fg4 = p.dark4,
      red = p.faded_red,
      green = p.faded_green,
      yellow = p.faded_yellow,
      blue = p.faded_blue,
      purple = p.faded_purple,
      aqua = p.faded_aqua,
      orange = p.faded_orange,
      neutral_red = p.neutral_red,
      neutral_green = p.neutral_green,
      neutral_yellow = p.neutral_yellow,
      neutral_blue = p.neutral_blue,
      neutral_purple = p.neutral_purple,
      neutral_aqua = p.neutral_aqua,
      gray = p.gray,
    },
  }

  if contrast ~= nil and contrast ~= "" then
    colors[bg].bg0 = p[bg .. string.format("0_%s", contrast)]
  end

  return colors[bg]
end

return M
