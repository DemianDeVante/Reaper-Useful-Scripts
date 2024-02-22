--[[
  @description Cycle track arm, unarm and auto
  @author DemianD
  @version 1.0
  @about
    Cycle track arm, unarm and auto
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

-- Function to cycle through track arming modes
function cycleTrackArmingMode(track)
    local isRecArmed = reaper.GetMediaTrackInfo_Value(track, "I_RECARM") == 1
    local isAutoRecArmed = reaper.GetMediaTrackInfo_Value(track, "B_AUTO_RECARM") == 1

    if isRecArmed and not isAutoRecArmed then
        reaper.SetMediaTrackInfo_Value(track, "B_AUTO_RECARM", 1)   -- Enable autorecarm
    elseif isAutoRecArmed then
        reaper.SetMediaTrackInfo_Value(track, "I_RECARM", 0)       -- Set to unarmed
        reaper.SetMediaTrackInfo_Value(track, "B_AUTO_RECARM", 0)   -- Disable autorecarm
    else
        reaper.SetMediaTrackInfo_Value(track, "I_RECARM", 1)       -- Set to rec armed
        reaper.SetMediaTrackInfo_Value(track, "B_AUTO_RECARM", 0)   -- Disable autorecarm
    end
end

-- Main function
function main()
    local selectedTracks = {}

    -- Get selected tracks
    for i = 0, reaper.CountSelectedTracks(0) - 1 do
        local track = reaper.GetSelectedTrack(0, i)
        table.insert(selectedTracks, track)
    end

    -- Cycle through arming modes for each selected track
    for _, track in ipairs(selectedTracks) do
        cycleTrackArmingMode(track)
    end

    reaper.UpdateArrange()
end

-- Run the main function
reaper.Undo_BeginBlock()
main()
reaper.Undo_EndBlock("Cycle Track Arming Modes", -1)

