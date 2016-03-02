# gtacts
using google apis

Getting started
================
git clone the repo and perform a pod install

You'll need to get a "GoogleService-Info.plist" from here: https://developers.google.com/identity/sign-in/ios/

Put the .plist file in the same directory as the .xcodeproj file

In the project's Info tab, under the URL Types section, find the URL Schemes box containing the string ending with YOUR_CLIENT_ID. Replace this string with the value of the REVERSED_CLIENT_ID string found in GoogleService-Info.plist.
