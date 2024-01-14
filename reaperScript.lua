
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

audioFile = "/Users/danielstahl/Documents/Music/Pieces/Ambient Music/Ambient Music 8/stage/ambientMusic8Score.caf"

CreateFolder(0, "Sound")
ImportAudio(1, 1, "Sound Effect", audioFile, false)
ImportAudio(2, 3, "Sound Clean", audioFile, true)

CreateFolder(3, "Sub")
ImportAudio(4, 5, "Sub noise", audioFile, false)
ImportAudio(5, 7, "Sub reverb", audioFile, true)

CreateFolder(6, "Low")
ImportAudio(7, 9, "Low noise", audioFile, false)
ImportAudio(8, 11, "Low reverb", audioFile, true)

CreateFolder(9, "Middle")
ImportAudio(10, 13, "Middle noise", audioFile, false)
ImportAudio(11, 15, "Middle reverb", audioFile, true)

CreateFolder(12, "High")
ImportAudio(13, 17, "High noise", audioFile, false)
ImportAudio(14, 19, "High reverb", audioFile, true)
