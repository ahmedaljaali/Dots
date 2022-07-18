----------------------------------------------------------------------
--        Everything here will be executed only with neovide        --

vim.cmd([[
if exists("g:neovide")
    let g:neovide_fullscreen=v:true

    set guifont=MesloLGS\ Nerd\ Font:h13

    let g:neovide_cursor_animation_length=0.35

    let g:neovide_cursor_vfx_mode = "pixiedust"

    let g:neovide_cursor_vfx_particle_lifetime=5

    let g:neovide_cursor_vfx_particle_density=28.0

    let g:neovide_refresh_rate=60

    let g:neovide_profiler = v:false

    let g:neovide_cursor_trail_length=5.0

    let g:neovide_cursor_vfx_particle_lifetime=5.0


endif
]])
----------------------------------------------------------------------
