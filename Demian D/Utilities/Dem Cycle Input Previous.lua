--[[
  @description Cycle to previous input for selected track (midi, mono, stereo)
  @author DemianD
  @version 1.0
  @about
    change input_number = 4 to the number of inputs you want
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

local input_number = 4

local input_number_mono = input_number -1
local input_number_stereo = input_number -2

local startmono = 0
local endmono = startmono + input_number_mono
local startstereo = 1024
local endstereo = startstereo + input_number_stereo
local startmonoroute = 512
local endmonoroute = startmonoroute + input_number_mono
local startstereoroute = 1536
local endstereoroute = startstereoroute + input_number_stereo

local startmidi = 6112
local endmidi = 6128

Count_Tracks = reaper.CountSelectedTracks(0)
for i = 0 ,Count_Tracks-1 do
  Media_Track = reaper.GetSelectedTrack(0,i) 
  current_input = reaper.GetMediaTrackInfo_Value( Media_Track, 'I_RECINPUT' )

  ---------- MONO --------------------------------------------------------------
  if current_input > startmono and current_input <= endmono then 
  reaper.SetMediaTrackInfo_Value( Media_Track, 'I_RECINPUT' , current_input -1 ) 

  elseif current_input == startmono then 
  reaper.SetMediaTrackInfo_Value( Media_Track, 'I_RECINPUT' , endmidi ) 

  ---------- STEREO ------------------------------------------------------------
  elseif current_input > startstereo and current_input <= endstereo then 
  reaper.SetMediaTrackInfo_Value( Media_Track, 'I_RECINPUT' , current_input -1 ) 

  elseif current_input == startstereo then 
  reaper.SetMediaTrackInfo_Value( Media_Track, 'I_RECINPUT' , endmono ) 

  ---------- REAROUTE MONO -----------------------------------------------------  
  elseif current_input > startmonoroute and current_input <= endmonoroute then 
  reaper.SetMediaTrackInfo_Value( Media_Track, 'I_RECINPUT' , current_input -1 )

  elseif current_input == startmonoroute then 
  reaper.SetMediaTrackInfo_Value( Media_Track, 'I_RECINPUT' , endstereo )

 ---------- REAROUTE STEREO ----------------------------------------------------
  elseif current_input > startstereoroute and current_input <= endstereoroute then 
  reaper.SetMediaTrackInfo_Value( Media_Track, 'I_RECINPUT' , current_input -1 )

  elseif current_input == startstereoroute then
  reaper.SetMediaTrackInfo_Value( Media_Track, 'I_RECINPUT' , endmonoroute )

  ---------- MIDI ALL INPUTS ---------------------------------------------------
  elseif current_input > startmidi and current_input <= endmidi then 
  reaper.SetMediaTrackInfo_Value( Media_Track, 'I_RECINPUT' , current_input -1 )

  elseif current_input == startmidi then 
  reaper.SetMediaTrackInfo_Value( Media_Track, 'I_RECINPUT' , endstereoroute )

  ------------------------------------------------------------------------------
  end
end

reaper.defer(function() end)

