tell application "Spotify"
	set normalVolume to 80
	set adVolume to 2
	
	repeat
		try
			if player state is playing then
				-- Hent info om det nuværende nummer
				set currentTrack to current track
				set trackPop to popularity of currentTrack
				set trackUrl to spotify url of currentTrack
				
				-- LOGIKKEN:
				-- Reklamer har ofte 0 popularitet, eller en URL der starter med "spotify:ad"
				-- Bemærk: Spotify ændrer ofte hvordan dette virker for at snyde scripts.
				
				if trackPop < 1 or trackUrl starts with "spotify:ad" then
					-- Hvis det ligner en reklame, skru ned
					if sound volume > adVolume then
						set sound volume to adVolume
					end if
				else
					-- Hvis det er musik, skru op igen (hvis den er nede)
					if sound volume ≤ adVolume then
						set sound volume to normalVolume
					end if
				end if
			end if
		end try
		
		delay 1 -- Vent 2 sekunder før næste tjek
	end repeat
end tell
