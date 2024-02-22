--[[
  @description Toggle MIDI Editor creating item if needed
  @author DemianD
  @version 1.0
  @about
    Toggle MIDI Editor creating item if needed
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

-- Function to check if a media item is a MIDI item
local function isMidiItem(item)
    local take = reaper.GetActiveTake(item)
    if take then
        return reaper.TakeIsMIDI(take)
    end
    return false
end

-- Function to count MIDI items in the project
local function countMidiItems()
    local count = 0
    local numItems = reaper.CountMediaItems(0)
    for i = 0, numItems - 1 do
        local item = reaper.GetMediaItem(0, i)
        if isMidiItem(item) then
            count = count + 1
        end
    end
    return count
end

-- Main function to toggle MIDI editor and perform actions
local function toggleMidiEditor()
    local midiEditorOpen = reaper.MIDIEditor_GetActive() ~= nil
    local numMidiItems = countMidiItems()
    if midiEditorOpen then
        reaper.Main_OnCommand(40716, 0) -- Tpggle Midi Editor (Closes it because it is already opened)
        if numMidiItems == 1 then
          reaper.Main_OnCommand(reaper.NamedCommandLookup('_S&M_DELEMPTYTAKE2'),0) -- remove created midi take
        end
    else
        if numMidiItems == 0 then
            reaper.Main_OnCommand(40214, 0) -- Insert a MIDI item if none exist
            reaper.Main_OnCommand(41173,0) -- Move cursor to start of item
        end
        reaper.Main_OnCommand(40153, 0) -- Open in-built MIDI editor
    end
end

-- Call the main function
toggleMidiEditor()

reaper.defer(function()end)
