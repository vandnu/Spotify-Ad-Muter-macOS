A simple AppleScript that automatically lowers the volume when Spotify plays an advertisement.

Reported a gambling ad (that was very loud). Made me kind of prepared to turn down the volume in the end of a song. The ad was really loud. Got the idea of making it automatic for when i wanted to listen while not wanting to be interrupted so much by (the "anxiety" of) going to get scared of the sudden loud ad). This turns down the volume auto.

## How it works
The script checks Spotify's status every 2 seconds. If it detects a track with low popularity (typical for ads) or a specific ad-URL, it lowers the system volume to a set level. When music returns, volume is restored.

## How to use
1. Open **Script Editor** on your Mac.
2. Copy the code from `turn-down.scpt`.
3. Paste it into the editor.
4. Save as **Application** and check **Stay open after run handler**.
5. Run the app!

## Disclaimer
This is a hobby project. Spotify might change their API, causing this script to stop working. Use at your own risk. Takes a second to turn down the volume some times. Not sure if it's because my computer might be lagging - well-used MacBook Pro from 2015.
