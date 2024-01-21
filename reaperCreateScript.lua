
function CreateFolder(index, name)
  reaper.InsertTrackAtIndex(index, false)
  folder = reaper.GetTrack(0, index)
  reaper.GetSetMediaTrackInfo_String(folder, 'P_NAME', name, true)
  reaper.SetMediaTrackInfo_Value( folder, 'I_FOLDERDEPTH',1)
  reaper.SetMediaTrackInfo_Value(folder, 'I_FOLDERCOMPACT', 0)
end

function ImportAudio(index, channel, trackName, fileName, lastInFolder)
  local folderDepth = 0
  if lastInFolder then folderDepth = -1 end

  reaper.SetEditCurPos(0, false, false)
  reaper.InsertTrackAtIndex(index, false)
  tr = reaper.GetTrack(0, index)
  reaper.GetSetMediaTrackInfo_String(tr, 'P_NAME', trackName, true)
  reaper.SetMediaTrackInfo_Value( tr, 'I_FOLDERDEPTH',folderDepth)
  reaper.SetOnlyTrackSelected(tr, true)
  reaper.InsertMedia(fileName, 0)
  item = reaper.GetTrackMediaItem(tr, 0)
  take = reaper.GetActiveTake(item)
  reaper.SetMediaItemTakeInfo_Value(take, "I_CHANMODE", channel + 64 + 2)
end

audioFile = "/Users/danielstahl/Documents/Music/Pieces/Ambient Music/Ambient Music 9/stage/ambientMusic9Score-v1.caf"

CreateFolder(0, "Sub Sound")
ImportAudio(1, 1, "Sub Sound Effect", audioFile, false)
ImportAudio(2, 3, "Sub Sound Clean", audioFile, true)

CreateFolder(3, "Sub Noise")
ImportAudio(4, 5, "Sub Noise Effect", audioFile, false)
ImportAudio(5, 7, "Sub Noise Clean", audioFile, true)

CreateFolder(6, "Low Sound")
ImportAudio(7, 9, "Low Sound Effect", audioFile, false)
ImportAudio(8, 11, "Low Sound Clean", audioFile, true)

CreateFolder(9, "Low Noise")
ImportAudio(10, 13, "Low Noise Effect", audioFile, false)
ImportAudio(11, 15, "Low Noise Clean", audioFile, true)

CreateFolder(12, "Middle Sound")
ImportAudio(13, 17, "Middle Sound Effect", audioFile, false)
ImportAudio(14, 19, "Middle Sound Clean", audioFile, true)

CreateFolder(15, "Middle Noise")
ImportAudio(16, 21, "Middle Noise Effect", audioFile, false)
ImportAudio(17, 23, "MIddle Noise Clean", audioFile, true)

CreateFolder(18, "High Sound")
ImportAudio(19, 25, "High Sound Effect", audioFile, false)
ImportAudio(20, 27, "High Sound Clean", audioFile, true)

CreateFolder(21, "High Noise")
ImportAudio(22, 29, "High Noise Effect", audioFile, false)
ImportAudio(23, 31, "High Noise Clean", audioFile, true)
