----------------------------------------------------------------------
--        Everything here will be executed only with neovide        --

if vim.fn.exists('g:neovide') == 1 then

    -- Start in fullscreen
    vim.g.neovide_fullscreen= true


    -- Determines the time it takes for the cursor to complete it's animation in seconds
    vim.g.neovide_cursor_animation_length=0.35

    -- Cursor mode
    vim.g.neovide_cursor_vfx_mode = 'pixiedust'

    -- Sets the amount of time the generated particles should survive
    vim.g.neovide_cursor_vfx_particle_lifetime=5

    -- Sets the number of generated particles
    vim.g.neovide_cursor_vfx_particle_density=28.0

    -- Frame per second
    vim.g.neovide_refresh_rate=20

    -- Shows a frame time graph in the upper left corner
    vim.g.neovide_profiler = false

    -- Determines how much the trail of the cursor lags behind the front edge
    vim.g.neovide_cursor_trail_length=5.0

end
----------------------------------------------------------------------
