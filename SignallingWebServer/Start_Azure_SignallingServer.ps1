# Copyright 1998-2018 Epic Games, Inc. All Rights Reserved.

# To avoid customers seeing an IP in the browser, set VMFQDN env variable with the VM DNS
if ($env:VMFQDN) {
    $PublicIp = $env:VMFQDN
}
else {
	# Hit a common url to grab the VM's public URL (non-platform specific)
    $PublicIp = (Invoke-WebRequest -Uri "https://api.ipify.org" -UseBasicParsing).Content
}

Write-Output "Public IP: $PublicIp"

# Uses a common STUN server from Google for testing, but recommended to host your own
$peerConnectionOptions = "{ \""iceServers\"": [{\""urls\"": [\""stun:stun.l.google.com:19302\""]}] }"

$ProcessExe = "node.exe"
$Arguments = @("cirrus", "--peerConnectionOptions=""$peerConnectionOptions""", "--publicIp=$PublicIp")

# Add arguments passed to script to Arguments for executable
$Arguments += $args

Write-Output "Running: $ProcessExe $Arguments"
Start-Process -FilePath $ProcessExe -ArgumentList $Arguments -Wait -NoNewWindow
