--[[
  @description Search Snare samples in media explorer and randomize list
  @author DemianD
  @version 1.0
  @about
    Search can be tweaked at line 51
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
function MediaSearch(search_string)
  local title = reaper.JS_Localize("Media Explorer", "common")
  local explorer = reaper.JS_Window_Find(title, true)
  reaper.JS_Window_SetFocus(explorer) 
  local search = reaper.JS_Window_FindChildByID(explorer, 1015) 
  if search then
    local search_value = reaper.JS_Window_GetTitle(search) -- get the text of the search box
    if search_value then -- check if the search box is empty
      reaper.JS_Window_SetFocus(search) 
      reaper.JS_Window_SetTitle(search, ' ')
      reaper.JS_Window_SetTitle(search, tostring(search_string))
      --reaper.JS_WindowMessage_Send(search, "WM_KEYDOWN", 13, 0, 0, 0) -- send enter press
      MediaOnCommand(40018)--refresh
    end
  end
end

function MediaOnCommand(actionid)
  explorerHWND = reaper.OpenMediaExplorer("", false)
  reaper.JS_Window_OnCommand(explorerHWND, actionid) 
end

MediaSearch('snare OR snr OR rim OR clap NOT loop')
local t = reaper.time_precise()
function wait()
  local dt = reaper.time_precise() - t
  if dt >= 0.1 then
    MediaOnCommand(42122) -- randomize list
    MediaOnCommand(42184) -- play random sample from list
    
    local title = reaper.JS_Localize("Media Explorer", "common")
    local explorer = reaper.JS_Window_Find(title, true)
    reaper.JS_Window_SetFocus(explorer) -- return focus to file list
    
  else
    reaper.defer(wait) -- defer the loop again
  end
end

wait()
reaper.defer(function () end)


