# Project 4 - *InstaFam*

**InstaFam** is a photo sharing app using Parse as its backend.

Time spent: **15** hours spent in total

## User Stories

The following **required** functionality is completed:

- [x] User can sign up to create a new account using Parse authentication (+1pt)
- [x] User can log in and log out of his or her account (+1pt)
- [x] The current signed in user is persisted across app restarts (+1pt)
- [x] User can take a photo, add a caption, and post it to "Instagram" (+2pt)
- [x] User can view the last 20 posts submitted to "Instagram" (+2pt)
- [x] User can pull to refresh the last 20 posts submitted to "Instagram" (+1pt)
- [x] User can tap a post to view post details, including timestamp and caption (+2pt)

The following **stretch** features are implemented:

- [x] Style the login page to look like the real Instagram login page (+1pt)
- [ ] Style the feed to look like the real Instagram feed (+1pt)
- [ ] User can use a tab bar to switch between all "Instagram" posts and posts published only by the user. AKA, tabs for Home Feed and Profile (+2pt)
- [ ] Add a custom camera using the CameraManager library (+1pt)
- [ ] User can load more posts once he or she reaches the bottom of the feed using infinite scrolling (+2pt)
- [ ] Show the username and creation time for each post using section headers (+1pt)
- If you use TableView Section Headers to display the the username and creation time, you'll get "sticky headers" similar to the actual Instagram app.
- [ ] After the user submits a new post, show a progress HUD while the post is being uploaded to Parse (+1pt)
- User Profiles:
- [ ] Allow the logged in user to add a profile photo (+2pt)
- [ ] Display the profile photo with each post (+1pt)
- [ ] Tapping on a post's username or profile photo goes to that user's profile page (+2pt)
- [ ] User can comment on a post and see all comments for each post in the post details screen (+3pt)
- [ ] User can like a post and see number of likes for each post in the post details screen (+1pt)
- [ ] Run your app on your phone and use the camera to take the photo (+1pt)


The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1.
2.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

* Please view [gif here](https://image.ibb.co/ijNwqx/instagram_Req.gif). GitHub has a gif-displaying bug; clicking embedded gif leads to a message "Content length exceeded". 
<img src='https://image.ibb.co/ijNwqx/instagram_Req.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library
- <div>Launch screen icon made by <a href="https://www.flaticon.com/authors/pixel-perfect" title="Pixel perfect">Pixel perfect</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
- [App Icon Maker](http://appiconmaker.co/Home/Index/ce3fc1bf-4be2-4d9d-90b4-ef795b009a55) - creates downloadable png files of various sizes
- [Billabong Font](https://techiestechguide.com/instagram-font/) - downloaded Instagram-like font
- [Toucan](https://cocoapods.org/pods/Toucan) - Cocoa Pod for resizing images

## Notes

Describe any challenges encountered while building the app.
* Had a hard time figuring out where code snippets should be going, especially when writing and reading from the Parse server.
* Learned how to implement [persisting user session](https://guides.codepath.com/ios/Building-Data-driven-Apps-with-Parse#persisting-user-session); the window's storyboard should be instantiated with the ID of the NavigationController, *not* the ID of the HomeViewController.
* Learned how to give TextView some [placeholder text](https://stackoverflow.com/questions/27652227/text-view-placeholder-swift)
* Needed to [use NSAllowsArbitraryLoads to completely disable ATS in my app:](https://guides.codepath.com/ios/App-Transport-Security#adding-other-exceptions)

## License

    Copyright [2018] [Mavey Ma]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
