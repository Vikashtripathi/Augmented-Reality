# Augmented-Reality
Development of iOS based Augmented Reality application using ARKit.

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

For making the augmented reality app with enhanced features do as follows-

1) Download Unity Game Engine for using ARKit.
2) Get Unity ARKit plugin from the following link -
   https://assetstore.unity.com/packages/essentials/tutorial-projects/unity-arkit-plugin-92515
3) Unity is used for building scenes which are later compiled in Xcode. 
4) Unity Plugin folder contains the compiled code.
5) Alternatively the Augmented Reality app can also be built by only using the inbuilt SDK of iOS, which is the ARKit SDK.

In this AR project we will be using only the ARKit SDK provided by latest version of MacOS, for developing a basic Augmented Reality app with features like 3-D model rendering, rotation and translation of 3-D model, perspective viewing of 3-D model by forward and backward translation in viewing volume, and buttons for audio and text simulation associated with the given model. 

Following steps must be followed to built the app -

1) Open Xcode and select Create a new project.
2) Then select Single View Application as the type of project and provide your project with a name.
3) Add ARSCNView to the Main.storyboard, which is used for displaying 3-D model on a camera background.
4) ARKit is a session based framework so each session has a scene which renders the virtual objects in the real world.
5) The virtual objects are rendered relative to their position and orientation with respect to the camera of device using the app thus the camera usage must be allowed in Info.plist file.
6) Now the 3-D model is added by creating a sub node of root node in SCNView which is initialized with the 3-D model (in our case, it is a Sword) and later added by invoking the class of this sub node in ViewController.swift file.
7) The 3-D model is adjusted as per our need of displaying it on screen, by the use of Scene Editor and finally it is converted to .scn format which is compatible with the SceneViewKit.
8) Now the buttons are added to the SCNView for controlling various movements like rotation and translation of 3-D model in 2-D Orthographic View and as well as 3-D Perspective View. Buttons are also added to play audio and display text associated with the 3-D model.

References -
https://free3d.com/
https://rubygarage.org/blog/create-augmented-reality-app-for-ios-11
https://code.tutsplus.com/tutorials/code-your-first-augmented-reality-app-with-arkit--cms-29705
https://in.udacity.com/course/learn-arkit-using-swift--ud116
