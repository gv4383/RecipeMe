# RecipeMe
<br />
<p align="center">
  <img src="https://dl.dropboxusercontent.com/s/2g44xjhwxq5bm1e/recipe_me_app_icon.png?dl=0" alt="RainBoot" width="80" height="80">
  <p align="center">
    RecipeMe is a simple iOS app that keeps track of your recipes.
  </p>
</p>

<p align="center">
  <img src= "https://dl.dropboxusercontent.com/s/znwwz75uo8k2kg2/recipe_me_menu_view.png?dl=0" width="300">
  <img src= "https://dl.dropboxusercontent.com/s/awxiagoi02q9m99/recipe_me_new_recipe_view.png?dl=0" width="300">
  <img src= "https://dl.dropboxusercontent.com/s/tu50t1nijbtlqi7/recipe_me_recipe_view.png?dl=0" width="300">
</p>

## Features
- [x] Displays user's saved recipes in an easy-to-navigate "menu"
- [x] Add new recipes by tapping on the `+` button at the top right
- [x] Display a specific recipe (along with that recipe's details) when tapped on in the "menu" screen
- [x] Users can use their iPhone's photo library to update the recipe image
- [x] Recipes can be deleted

## Technical Implementation
- Persisted user data by storing it to local device through a custom Core Data recipe entity
- Subscribed to Core Data recipe model changes with Combine to show correct recipe data across the app
- Implemented photo library image picker using UIViewControllerRepresentable/Coordinator pattern

## Requirements
- iOS 15.2+
- Xcode 13.3.1

## How to run the app
1. Clone this repo
2. Open `RecipeMe.xcodeproj`
3. Select your device/simulator and run the the project
