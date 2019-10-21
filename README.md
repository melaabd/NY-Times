# NY-Times App


A simple app to hit the NY Times Most Popular Articles API and:
* Show a list of articles newest first(sorted based on date)
* Shows details when items on the list are tapped. 
* Show Cached articles if network not available


We'll are using the most viewed section of this API.
http://api.nytimes.com/svc/mostpopular/v2/viewed/{period}.json?api-key=sample-key To test this API, 
For testAPI we used 
* all-sections for the section path component in the URL
* 7 for period

This is configurable in Constants.Swift file in Project. 
We used MVC Design pattern and swift generic approach to develop this application.
For CI/CD App using XcodeServer + Fastlane combination.

We are generating TestCase and Coverage report using three tools, you can opt out any one as per your connivance:
* **XcodeServer TestCase and Coverage report.**
* **Fastlane+scan+slather TestCase and Coverage reports.**
* **SonarQube TestCase and Coverage reports.**

&nbsp; 


## Tools And Resources Used

- [CocoaPods](https://cocoapods.org/) - CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects. It has over 33 thousand libraries and is used in over 2.2 million apps. CocoaPods can help you scale your projects elegantly.


## Library Used
- [SDWebImage](https://github.com/rs/SDWebImage) - This library provides an async image downloader with cache support.


## TODO
* Sorting option for user to sort article based popularity, Date, Alphabetically 


&nbsp; 

# Installation

* Installation by cloning the repository
* Go to directory
* use command + B or Product -> Build to build the project
* Incase of build fail due to dependency SDWebImageView, install SDWebImageView using CocoaPods.
* Press run icon in Xcode or command + R to run the project on Simulator

&nbsp; 


## Running The Tests Manually 

Follow the steps to get test case reports:
* Enable coverage Data under test schema section:
* Select the Test Icon by pressing and holding Xcode Run Icon OR press `Command+Control+U`
* In the Project Navigator under Test Navigator tab, check test status and coverage 

# Architecture

We used MVC :

&nbsp; 
&nbsp; 

<kbd >
<img src="https://mdn.mozillademos.org/files/16042/model-view-controller-light-blue.png">
</kbd>

</br>
</br>

