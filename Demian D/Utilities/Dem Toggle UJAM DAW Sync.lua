--[[
  @description Toggle UJAM plugins DAW sync
  @author DemianD
  @version 1.0
  @about
    Toggles latch and sync to tempo for ujam plugins
]]

--[[
⠀⠀⠀⠀⣖⢶⣤⠀⣀⣀⣀⣀⢀⣤⢆⢦⠀⠀⠀⠀     @@NNNB@g,                            @K                           @@NNNB@N,
⠀⠀⠀⠀⣀⢀⠛⠀⠀⠀⠀⠀⠈⠣⢀⣸⠀⠀⠀⠀     @P     "@K    ,,g,    ,, ,g,  ,,,,   ,,   ,,gg,    , ,,g,         @K      $@
⠀⠀⠀⠊⠀⠀⢻⣷⠀⠀⠀⢠⣿⠋⠀⠀⢢⠀⠀      @P      ]@  g@*  "%b  ]@P-`]@@" "@K  $@  @P - ]@P  @@"`']@        @K      ]@P
⠀⠀⠀⠀⠀⠀⠸⠖⠀⠀⠀⠀⢾⠀⠀⠀⢈⠀⠀⠀     @P      ]@  @@gggg@@P ]@    @    $@  $@   ,ggp@@P  @C    @P       @K      ]@P
⠀⠀⠀⣀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⡜⠀⠀⠀     @P     ,@P  $@    ,g  ]@    @    $@  $@ ]@"    @L  @P    @P       @K     ,@K
⠀⠀⠀⣀⣖⢄⠀⠀⠀⠀⠀⠀⠀⢀⣠⠎⣀⠀⠀⠀     @@@@@@N*`    7BNg@P'  $@    @    &K  @K  %@ggN"%@  @P    @P       @@@@@@NP"
⠀⡄⠁⢀⠈⢄⠀⣏⢋⣧⣏⢃⣇⠀⠤⠀⠀⠈⢄⠀    
⢰⣀⣀⠀⠀⠀⠀⠀⠑⠚⠃⠈⠀⠀⠀⠀⢸⢀⣠⡀    @ Github :                                   https://github.com/DemianDeVante
⠘⣯⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢯⣧⠁    @ Reaper Forums :                https://forum.cockos.com/member.php?u=174529
⠀⠀⠀⢦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡜⠀⠀⠀    @ YouTube :          https://www.youtube.com/channel/UCSofVw-5N5cjyz8L8BYZGhg
⠀⠀⠀⢸⠀⠀⠀⠀⢤⢤⢄⢤⠀⠀⠀⠀⠀⠀⠀⠀   
 ⠀⠀⣴⣯⣿⣿⣯⢁⠀⠀⠈⣯⣿⣿⣿⣄⠀⠀⠀    @ Donation :                                  https://paypal.me/DemianDeVante

  You can learn more about Lua scripting in:
  https://www.admiralbumblebee.com/music/2018/09/22/Reascript-Tutorial.html
]]

-- Get the current track
track = reaper.GetSelectedTrack(0, 0)

-- Check if a track is selected
if track then
    -- Get the number of FX on the track
    fxCount = reaper.TrackFX_GetCount(track)

    -- Check if there is at least one FX on the track
    if fxCount > 0 then
        -- Iterate through all FX on the track
        for fxIndex = 0, fxCount - 1 do
            -- Get the number of parameters for the current FX
            paramCount = reaper.TrackFX_GetNumParams(track, fxIndex)

            -- Iterate through all parameters for the current FX
            for paramIndex = 0, paramCount - 1 do
                -- Get the name of the current parameter
                _, paramName = reaper.TrackFX_GetParamName(track, fxIndex, paramIndex, "")

                -- Check if the parameter name is "Latch" or "Song Sync"
                if paramName == "Latch" or paramName == "Player Sync" then
                    _, nengo = reaper.TrackFX_GetParamName(track, fxIndex, paramIndex, "")
                    -- Get the current value of the parameter
                    paramValue = reaper.TrackFX_GetParamNormalized(track, fxIndex, paramIndex)

                    -- Toggle the parameter based on its current value
                    if paramValue > 0.5 then
                        -- If greater than 0.5, set to the minimum value
                        reaper.TrackFX_SetParamNormalized(track, fxIndex, paramIndex, 0)
                    else
                        -- If less than or equal to 0.5, set to the maximum value
                        reaper.TrackFX_SetParamNormalized(track, fxIndex, paramIndex, 1)
                    end
                end
            end
        end
    else
    end
else
end

