These files are for customers looking to deploy their Unreal Pixel Streaming solution
with the Azure Marketplace, which require customizations to the Matchmaker
and Signalling Web Server files. The directions below show how to start from the Azure
base first and add your customizations on top of those so the deployment works.

NOTE:
If you HAVE NOT made any changes to those files from the exported package from Unreal, 
ignore these steps and don't select the checkbox in the Azure Marketplace that specifies
you have made custom changes, which will allow Microsoft to override the changes for you 
from your uploaded zip file.

Steps To Add Customizations

1) Export your Pixel Streaming project from Unreal Engine.
2) Navigate to the appropriate directory from the exported content: 
	[UE5] Samples\PixelStreaming\WebServers	
	[UE 4.27] Engine\Source\Programs\PixelStreaming\WebServers	
3) Take the "Matchmaker" and "SignallingWebServer" folders in this downloaded zip file and override the
   folders that were exported by Unreal Engine (adds Azure customizations like ports, scripts, etc..).As the Azure Marketplace solution still uses 4.27.2's path to run the web servers. 

***NOTE***
UE5 you will need to create the path with the web servers in the root of your project folder and place the Matchmaker and Signaling Server in this new path: Engine\Source\Programs\PixelStreaming\WebServers

4) Now you can make any additional changes to the Matchmaker and Signalling Web Server files, such
   as the player.html, CSS, images, etc., while not removing or altering the Azure specific batch
   and PowerShell files. Be careful when changing any NodeJS JavaScript files, and test locally and
   in Azure on a single VM to validate web servers still run as expected before uploading to the
   Azure Marketplace.
5) Go to the folder (not in the folder) that was exported by Unreal Engine (i.e., WindowsNoEditor [UE4.27] or Windows [UE5]) and
   right click on that folder and zip up the contents of that folder and upload that to Blob storage. 
   The zip file should contain the 1) <UE4 App name>.exe,  2) <UE4 App name> folder 
   and 3) Engine folder which has the Azure base changes and your customizations on top of that.