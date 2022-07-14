<# Credit to Jim6795 on Spiceworks 
https://community.spiceworks.com/topic/2457425-say-it-with-powershell?source=topic&pos=5
Allows you to output voice via powershell commands.
#>

# Set voice and volume variables
$Voice = New-Object -ComObject Sapi.spvoice
$Voice.Volume = 10
# Prompts for text to speech phrase
$Voice.Speak($(Read-Host "What to say?")) > $nul

# Powershell has a wife too. 
$Voice.Voice = $Voice.GetVoices().Item(1)  # Female
$Voice.Speak("Are we there yet?") > $Nul
$Voice.Voice = $Voice.GetVoices().Item(0)  # Male
$Voice.Speak("I don't think so.") > $Nul
$Voice.Rate++
$Voice.Rate++
$Voice.Voice = $Voice.GetVoices().Item(1)  # Female
$Voice.Speak("Do you know where you're going?") > $Nul
$Voice.Voice = $Voice.GetVoices().Item(0)  # Male
$Voice.Speak("I don't think so.") > $Nul
$Voice.Rate++
$Voice.Rate++
$Voice.Voice = $Voice.GetVoices().Item(1)  # Female
$Voice.Speak("Shouldn't you pull over and ask directions?") > $Nul
$Voice.Voice = $Voice.GetVoices().Item(0)  # Male
$Voice.Speak("I don't think so.") > $Nul
$Voice.Voice = $Voice.GetVoices().Item(1)  # Female
$Voice.Speak("Will you ever listen to me?") > $Nul
$Voice.Rate = -2
$Voice.Voice = $Voice.GetVoices().Item(0)  # Male
$Voice.Speak("As soon as you learn to read a map.  We're here!") > $Nul