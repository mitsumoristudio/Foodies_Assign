# Foodies v2 (Instructions) IOS (Swift/SwiftUI)
 Foodies App was designed to satisfy your taste buds by allowing the user to interact popular International cuisines. 
 The target is setup for IOS 17.0 minimum and configured to be utilizied for Iphone 12 and above.
 For building and running the app, click on the Product and Run button through XCode and it will diplay the parent view
 (ContentView).

## App Focus Area
The Food App offers variety of friendly features which makes it great experience for cooking.
- Search and Filter Options: Search button to find recipes based on world cuisine types and filters alphabetically.
- Recipes Collections: Access the curated collection from your favorite confection. Simple one touch design to scroll through recipes in which the   combination of ScrollView and LazyVStack does not create new items unless
the user needs to render and display onscreen.
- Images are cached on disk/memory using KingFisher api, and the cach storage expiration date is set to 90 days.
Design Implmentation: Having done some research on conventional UI interface from social media, cooking recipes apps, decided to apply the Grid View from URL image with shadow, masking and overlaying the cuisine and dish name. Adjusted the resolution and aligment if the user sees the UIView in dimmer setting. 
- Includes the ContentUnavailable view introducted in iOS 17.0 to display no search result content if the user types a cuisine not found in the JSON.

## How might we resolve warning in the project? 
- Set the CG_NUMERICS_SHOW_BACKTRACE environmental variable to YES in the Scheme-Environmental Variable. 
- Added .autocorrectionDisabled() in the RecipeMainView to resolve the error (Error: this application, or a library it uses, has passed an invalid numeric value (NaN, or not-a-number) to CoreGraphics API and this value is being ignored. Please fix this problem.) From reviewing common error from iOS 17, this corrects the auto correction in the search bar. 

## How can we better inform users that no search results are found? 
Corrected the search bar by adding conditional statement in RecipeMainView with ContentUnavailable view to display no search result text and SF symbol if cuisine type is not found in the API. Included default SF symbol if there was no image associated with the URL. 

## How might we make bad state in the view model impossible?
Added property wrapper @MainActor in association with the ObservableObject in ViewModel to ensure that class marked with it will run on the main thread. Include the final keyword for the viewmodel class so it does not support inheritance to a subclass and improve the modularity of the app. 

## How can we unit test API unhappy paths? 

## App Features

<a ><img src="Modern Aesthetic Weekend To Do List Instagram Story.png" width="256" height = "500" /></a>
<a ><img src="Modern Aesthetic Weekend To Do List Instagram Story-3.png" width="256" height = "500" /></a>
<a ><img src="Modern Aesthetic Weekend To Do List Instagram Story-2.png" width="256" height = "500" /></a>
ty
