function ImportAudioIntoChannel(index, channel, channelName, fileName)
  reaper.SetEditCurPos(0, false, false)
  local tr = reaper.GetTrack(0, index)
  
  for j = 0, reaper.GetTrackNumMediaItems(tr) - 1 do
    local item = reaper.GetTrackMediaItem(tr, j)
    reaper.DeleteTrackMediaItem(tr, item)
  end
  reaper.SetOnlyTrackSelected(tr, true)
  reaper.InsertMedia(fileName, 0)
  item = reaper.GetTrackMediaItem(tr, 0)
  take = reaper.GetActiveTake(item)
  reaper.SetMediaItemTakeInfo_Value(take, "I_CHANMODE", channel + 64 + 2)  
end

audioFile = "/Users/danielstahl/Documents/Music/Pieces/Ambient Music/Ambient Music 9/stage/ambientMusic9Score-v2.caf"

ImportAudioIntoChannel(1, 1, "Sub Sound Effect", audioFile)
ImportAudioIntoChannel(2, 3, "Sub Sound Clean", audioFile)

ImportAudioIntoChannel(4, 5, "Sub Noise Effect", audioFile)
ImportAudioIntoChannel(5, 7, "Sub Noise Clean", audioFile)

ImportAudioIntoChannel(7, 9, "Low Sound Effect", audioFile)
ImportAudioIntoChannel(8, 11, "Low Sound Clean", audioFile)

ImportAudioIntoChannel(10, 13, "Low Noise Effect", audioFile)
ImportAudioIntoChannel(11, 15, "Low Noise Clean", audioFile)

ImportAudioIntoChannel(13, 17, "Middle Sound Effect", audioFile)
ImportAudioIntoChannel(14, 19, "Middle Sound Clean", audioFile)

ImportAudioIntoChannel(16, 21, "Middle Noise Effect", audioFile)
ImportAudioIntoChannel(17, 23, "MIddle Noise Clean", audioFile)

ImportAudioIntoChannel(19, 25, "High Sound Effect", audioFile)
ImportAudioIntoChannel(20, 27, "High Sound Clean", audioFile)

ImportAudioIntoChannel(22, 29, "High Noise Effect", audioFile)
ImportAudioIntoChannel(23, 31, "High Noise Clean", audioFile)
