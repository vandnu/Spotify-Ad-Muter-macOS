property normalVolume : 80
property adVolume : 2

on idle
	tell application "Spotify"
		try
			if player state is playing then
				set currentTrack to current track
				set trackUrl to spotify url of currentTrack
				set trackName to name of currentTrack
				set trackArtist to artist of currentTrack
				set trackAlbum to album of currentTrack
				set trackNum to track number of currentTrack
				
				set isAd to false
				
				-- TJEK 1: Den mest sikre (URL-tjek)
				if trackUrl starts with "spotify:ad" or trackUrl contains ":ad:" then
					set isAd to true
					
					-- TJEK 2: Manglende metadata (Reklamer har ofte ingen artist eller albumnavn)
				else if trackArtist is "" or trackArtist is "Spotify" then
					set isAd to true
					
					-- TJEK 3: Spor-nummer (Sange i et album har et nummer, reklamer er ofte nr. 0)
				else if trackNum is 0 and trackAlbum is "" then
					set isAd to true
				end if
				
				-- LOGIK FOR LYDSTYRKE
				if isAd is true then
					if sound volume > adVolume then
						set sound volume to adVolume
					end if
				else
					-- Det er musik (selvom populariteten er lav)
					if sound volume ≤ adVolume then
						set sound volume to normalVolume
					end if
				end if
			end if
		on error
			-- Ved fejl gør vi intet
		end try
	end tell
	return 1
end idle

on quit
	tell application "Spotify" to set sound volume to normalVolume
	continue quit
end quit
