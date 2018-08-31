# Augmented-Reality
Development of iOS based application using ARToolKit, Unity Game Engine and conversion of iOS application to Android platform

For development of iOS application on Windows 10 following steps must be followed -

1) Install vmware Workstation Pro 14.
2) Get a disc image of macOS High Sierra 10.12.14 or higher version.
3) Install Patch Tool for vmware.
4) In workstation, create a new virtual machine by selecting Apple MacOS X and follow the required steps.
5) Do edit the virtual machine before playing it for the first time by changing the allocated number of processors to atleast 4 and allocated RAM to atleast 4 GB. Then remove the hard disk and add a new SATA hard disk option in virtual machine with the path to the unzipped disc image of macOS High Sierra.
6) In macOS Sierra VM file, search macOS Sierra.vmx and add smc.version = "0" to the end of list.
7) Finally one can now run macOS High Sierra on the virtual machine.
8) For iOS applicaion development, Xcode 9 or higher version like Xcode 10 software must be installed, by creating an apple id, from the app-store. 

For reference on installing and configuring the vmware the following URL can be used - 
https://www.wikigain.com/install-macos-sierra-10-12-vmware/

For making the augmented reality app do as follows-

1) Download Unity Game Engine for using ARKit.
2) Get Unity ARKit plugin from the following link -
   https://assetstore.unity.com/packages/essentials/tutorial-projects/unity-arkit-plugin-92515
3) Unity is used for building scenes which are later compiled in Xcode. 
4) Unity Plugin folder contains the compiled code.
