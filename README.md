# ViewHunter

View Hunter is a simple debugging tool for iOS Apps.

Just drag and drop ViewHunter.h and ViewHunter.m into your project and add the line

[[ViewHunter sharedType] installGestureRecognizerInWindow]

At the end of applicationDidFinishLaunchingWithOptions: .

Now long press on any view and you will get a UIAlert telling you the name of the viewcontroller and the owning storyboard.

Perfect to figure out where you need to make the change in that large app :P .