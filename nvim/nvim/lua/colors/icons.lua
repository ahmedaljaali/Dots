local webdev = require'nvim-web-devicons'

local my_icons = {
      cc= {
        icon = "",
        color = "#458588",
        name = "cc"
      }
}
if webdev.has_loaded then
  webdev.set_icon (my_icons)
else
  webdev.setup({ override = my_icons, default = true })
end
