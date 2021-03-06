# CYBR8480 Semester Project
A semester project regarding to health care records and instructions along with customer support service.

## Overview

* [Executive Project Summary](#project-name)
* [Requirements Analysis](#requirements-analysis)
* [Design](#design)
* [Security Analysis](#security-analysis)
* [Implementation](#implementation) 
* [Testing](#testing)
* [Demo](#demo)
* [Packaging and Release](#packaging-and-release)


### Project Name
HealthCare app makes us amazing

#### Executive Summary - Problem statement text goes here

Thanks for technology, the contemporary people's life become very convenient and efficient. More Specifically, electronics can help them experience variety of services without leaving their houses. Such as, ordering foods, online shopping, finding jobs, remote working, facetimes with others are living in different countries, or electronic business. However, with relying on those technologies, people's health is gradually decreasing in a rapid way. Due to lack of exercise, all kinds of diseases jump into people life. Therefore, in this project, I would like to develop a kind of exercise reward body healthy app to help people increase their health condition and raise attention on the importance of workout. Additionally, we are still providing the customer support service to help our user while they encounter with any other problems. If it possible, I would like to embed with a payment function into the app and provide some bonus mechanism (cash, giftcard, and coupon) which can be used for inspiring people's interest on using my app while they would like to do the exercise. 

#### Project Goals
* **User authentication mechanism:** We will provide an app user interface to allow our user to interact with our customer service. The privacy is guaranteed because every user can only access his own comments and our support service responses. In other words, individual users’ comment will not be exposed to everyone in our system.  
* **Heart rate measurement:** To measure user's heart rate, our users don't need to purchase any other peripheral to test their heart rate after or before workout. Hence, it saves users expenditure. More specifically, we use the image processing technique to detect the user's pulse by taking advantages from phone's camera.
* **Video guide of exercise procedures:** Which is a video list to let user access their preferred video demo to refer while they have no idea how to do the exercise. Also, this video guide page can let user search specific video to fit in his/her preference even through that are not related to exercises. 
* **Route calculator:** This will be used while user would like to do the outdoor exercise like jogging, biking, or hiking. Our app will offer a trail calculator to help user realized what the distance he/she will spend on outdoor exercising and the movement route which can help him/her check if it satisfy their daily workout plan.   
* **Fitness data recorder:** It works as a memorandum to record all the users' working out status. Such as, it will show a walking steps panel, a calories statistic data, exercising time, and instant heart rate. In addition, it gives instruction to suggest user about how many cups of water ought to drink based on analyzing user's current working out rate.   

### Requirements-analysis
#### User stories 1

As a busy employee who has to do extra work after the normal working time, I want increase my health condition by watching some professional video of indoor execises with lower cost and spend less time, so that I will not stay in the suboptimal health condition or even protect myself from diseases.  

**Acceptance Criteria:**
* A busy employee uses HealthCare mobile app to do indoor workout  
  * “Given I’m a busy employee who doesn't have time to find personal trainer to teach him/her about how to do indoor exercise, and I download the HealthCare mobile app. When     I open the HealthCare mobile app on my phone, and I am able to find some short indoor exercise videos that are recorded by professional coach. Then, I can spend less time     on workout to stay healthy."  

#### User stories 2

As a fitness fanatic, I want to measure my heart rate after I have done intensive exercise in the gym without using a wearable detector, so that I will not working out too hard to cause me drained or injury.

**Acceptance Criteria:**
* A fitness fanatic uses HealthCare mobile app to measure heart rate after exercising, in case higher heart rate causes drained or injury. 
  * “Given I’m a fitness fanatic who likes to do intensive exercise, and I download the HealthCare mobile app. When I have working out for a while, I can place my fingers on my     phone's camera and test my heart rate without wearing any physical detector. Then, I can decide if I need to do more exercise or not, so I don't get drained or injury."  

#### User stories 3

As a cycling enthusiast, I want to calculate the mileage between two different locations and also know my current location at any time, so that I won't lose my way and get wrong direction to bicycle.

**Acceptance Criteria:**
* A cycling enthusiast uses HealthCare mobile app to get his/her current location on the earth and calculate the total cycling distance between the current position and final   destination, so he/she won't lose the direction.  
  * “Given I’m a cycling enthusiast who likes to do long distance cycling, and I download the HealthCare mobile app. When I want to bicycle and haven't decide the destination     because I don't know how far I will do the cycling, I can open the HealthCare mobile app to get my current location and type in different destination addresses to select a     better direction to go with. Then, I will know how far I need to do cycling from my current address without losing my way."  



#### Misuser stories 1 
As a network eavesdropper who has experience on doing packets sniffing, I want to use some external tool to sniff user's personal information from HealthCare mobile app, so that I can use those users' info to blackmail them.

**Mitigations:**
* Instead of using insecure communication between mobile app and database, I will use a most developed backend like Firebase with NoSQL and Google Cloud Platform API. Hence,     the HealthCare mobile app's data will become very difficult to capture.
* The HealthCare app will not collect the actual user's information except the name and email address during register phase. To be honest, when the user is asked to input        his/her name, we are not recommended to put the user's real name into our system. In this case, even though eavesdropper can get the user's email, he/she doesn't know the        real name which can correspond with the email, so it increases the difficulty of blackmailing.  

#### Misuser stories 2 
As a internet hacker who is a member in the dark web, I want to collect all of the user's health records and location information from HealthCare mobile app, so that I can sell those information to someone who would like to pay me in the dark web.

**Mitigations:**
* This HealthCare mobile app is actually accessing the users' location and some health records, but we purposely store personal inforamtion locally. In other words, all of the     information is not traveling through the internet, and only the person who has access to the actual phone can get those records.



### Design

![High Level Design of HealthCare App](./assets/high_level_design_1.svg)

**If you would like acess the larger view of the image, please click [this link to HealthCare Design](./assets/design_2.png), or you can click the top image then check the "raw" resource.**

## Component List
### 1. Authentication Component
User authentication mechanism will be provided while our customer wants to contact question services. It is using the Firebase Backend-as-a-Service (Baas) to process user's credential authorization. Individual can only access his/her own messages along with those response from customer support, so the privacy will be guaranteed.

#### Sub-component 1.1 User Login
Each existed user in the backend has to log in before they can directly send and check the communication message between himself/herself with our client service. We are using HTTPS protocol to build the connection, and user's login is not complicated. Just provide their email address and personal chosen password (which should at least 6 characters).

#### Sub-component 1.2 User Register
If there is a new user that the backend has not stored his/her information, the mobile app will prompt this user to do a simple registration with nickname, email, and password.

#### Sub-component 1.2 Cloud Firestone
It is a database which is using JSON format or some secure ways to store all the user's credentials along with their questions. Every user's personal information will be managed by Google instead of the mobile app.  


### 2. Mobile Local Features
A user health record demo page will be provided. It is running locally and recording all kind of workout related data of the user. Such as, how many steps he/she has walked along with the consumption of calories. Additionally, there is a timer to calculate how long does the user spend on exercising

#### Sub-component 2.1 Hydration Tracker
The hydration tracker has also been embedded in the local features. Users can put their daily dose of water ingestion into the app, so the app will help them to remember how many cups of water they have drunk in case dehydration  

#### Sub-component 2.2 Heart Rate Detector
Heart rate detector has been designed for those users who would not like to wear a kind of senser to measure their heart rate. This local function is mainly taking advantage from camera image processing technology to detect users' heart rate. Just put two fingers under phones camera while running HealthCare app, users will know their current heartbeat after working out. 

### 3. Google Map Service
Google Map services is using the Google Cloud Platform as the backend to interact with HealthCare app. The HealthCare app will use a secure API to access Google's services like Map Direction, Map iOS, and Map Android. Users' data will be protected by the security structure of Google.

#### Sub-component 1.1 GPS Service
The HealthCare location tracker will access user's current location, since it is mainly designing for those users who like to hike and bicycle. Thus, they will not lose their direction and can also realize if they have gone too far from their home. All those data will be processed by Google, so HealthCare will not collect any information from users.

#### Sub-component 1.2 Distance Calculator
Distance measure function is very useful to give the general idea for those users who are always running or cycling too far away because it helps users calculate the total kilometers between two locations. Furthermore, it can show the fastest path between two places, so users can bypass the heavy traffic while exercising.  

### 3. Video Accessing Service
HealthCare ought to provide some video demo to those users who would like to do the indoor exercising or have no idea how to do some less workflow workout. Users can adjust the play speed of video and full screen it. 

#### Sub-component 1.1 Video Searching
Searching other video is useful if users have their preference to watch or favorite youtuber trainer to follow, but they have to know the exact video id or link. This is a concern for users' privacy because HealthCare app will not use plain text to retrieve video from YouTube, so it will not expose users' behaviors.

#### Sub-component 1.2 Video List
Default video list is necessary, since some users might not want to do some search on watch exercise demo. Therefore, HealthCare provides some basic workout video or even live channel, so users could just warm up themselves and practice with those workout channels. 


## Security analysis
The misuse case and its remediation of HealthCare app is mainly discussing the security level while hackers would like to do several attacks to get unauthorized access or escalate his privilege to retrieve user's location and login credentials.   
![The Security Analysis of HealthCare APP](https://github.com/ZexiXin/CYBR8480_Semester_Project/blob/main/assets/security_analysis_CYBR8480(1).svg)

| Component name | Category of vulnerability | Issue Description | Mitigation |
|----------------|---------------------------|-------------------|------------|
| Unauthorized Login | Denial of Service | Without credential validating, anyone can query the server. Hence, this component could cause network paralysis and traffic latency, so that right users will not be able to login | Requiring of registration with user identity and password will restrict bad behaviors because the malicious user will expose themselves |
| Password Crack | Information Disclosure & Spoofing | Weak password length and complexity will make cracking users' accounts in a simple way, so that hacker can use those cracked credentials to request other services without users' awareness’s | Password management policy will set a minimum length and require more complicated combination while users are creating their passcodes |
| Password Sniffing | Information Disclosure & Spoofing | Hackers can capture the traffic between users and server while they are communicating each other to sniff passcode, so they could pretend as the right users | The Firebase backend, which is developed by Google, is using secure communication channel and complex encryption algorithm while it builds connection with users. Hence, it makes network capture become harder |
| Unauthorized Location Access | Privilege Escalation | This component can expose user's location to let hackers steal their daily fitness and GPS data, so they can understand their exercise habits/hobbies and go ahead social engineering them | Google Cloud Platform not only provide the Map services, but also provides the restricted secure API key feature to the developer, so as long as hacker cannot get the key, they won't be able to access users' GPS data |
| Inject Script | Tampering | Malicious users can target on user's route calculating function to provide wrong direction and distance by injecting script to the tamper with the Google Map API key | Google provides a code log monitor to check analyze the traffic between itself and user to see if there is any unauthorized access to its API key and inform this to the project owner (developer) |


## Implementation
Implementation has been submitted and please check the /lib/main file in this repo. Or for simple acess, please click [Here!](https://github.com/ZexiXin/CYBR8480_Semester_Project/blob/main/lib/main.dart)


## Testing
I will use the flutter Unit test to evalute if the HealthApp can pass those test. In general, I will test some values inside of each function to see if those have been changed after one widget has been pumped. All the test case can be viewed [Over Here!](https://github.com/ZexiXin/CYBR8480_Semester_Project/blob/main/test/widget_test.dart)


| Test Function | Criteria | Test result | Need further modification |
| ------------- | -------- | ----------- | ------------------------- |
| HeartRate | Tested the variable change and compare if it is equal to a expected value | correctly passed | Not required at this stage |
| Customer Service | Tested if a widget can be pumped and execute right login and logout status | correctly passed | Prefer to develop a chat windows between the customer and support services, also it is great to embed an AI representative while during the off time |
| Google GPS | Tested if wighets can retrieve the right data from cloud service and all widgets can be found | correctly passed | Adding keyword recommendation will be good for exercises to find a better destination to go |
| Video demo | Test if the youtube video widgets, play button, and icon can be find by flutter tester | correctly passed | Can add more video features |
| Workout records | Test if those health records can be shown | correcly passed | Data can be dynamic for the next development phase and the layout can be changed to fit in multiple devices screen |


## Demo

The video demo can be visited [here](https://app.vidgrid.com/view/tSy0JJZw5J3w)   
Since this file are too large to upload, so I uploaded the complete file on Canvas. Here, the slide without implementation video can be accessed from [here](https://github.com/ZexiXin/CYBR8480_Semester_Project/blob/main/Semester%20Project%20Presentation.pptx)


## Packaging and Release

To run this app, you need to download this app into you local directory by click the "Code" button on the top right side in the main page of this repo, and click either "Open with GitHub Desktop" or "Download Zip". Here, if you select zip file to download, you need to unzip it order to run it. 

![GitHub download](https://github.com/ZexiXin/CYBR8480_Semester_Project/blob/main/assets/github_download.PNG)

Additionally, you need to download the Android Studio with several Plugin like flutter to check the code. For more installation, please visiting [here](https://flutter.dev/docs/get-started/install). In the previous link, it includes instructions of how to set up emulator and other required configurations of Android Studio for several different OS. 

Next, if you want to run this app in the actual phone though USB, you have to install the appropriate USB driver enable the development option in your device. Please following with this [link for more detail (Note: this is just for Android devices)](https://developer.android.com/studio/run/oem-usb). For iOS, please visit this [Build and release an iOS app](https://flutter.dev/docs/deployment/ios)  

**Hardware Requirement:** laptop, actual phones running on either iOS or Android, network cable or Wifi, USB cable  
**Software Requirement:** Android studio, Flutter plugin, USB devices driver, Google Cloud Platform API (You have to create you own API to enable the GPS function), Firebase NoSQL backend

While you are able to run this app in the emulator, you should see an UI similar to the image below:  
![Sample](https://github.com/ZexiXin/CYBR8480_Semester_Project/blob/main/assets/UI_sample.PNG)


**Note:** After set everything necessary for this app, if the Android Studio gives you an error message while you compile/build the app. You could try to run the command in the terminal
```
flutter clean
```
then try to rebuild the app on your device. The reason causes this is the file pubspec.yaml contains conflict class variables in different imported packages. 


#### License
<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">CYBER4580 and related works</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="http://faculty.ist.unomaha.edu/mlhale" property="cc:attributionName" rel="cc:attributionURL">Matt Hale</a> are licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.
