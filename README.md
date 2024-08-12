# galaxy_planets

A galaxy_planets project created in flutter. galaxy_planets supports both ios and android, clone the appropriate branches mentioned below:

* For Mobile: https://github.com/rajiyanareja1517/galaxy_planets

Download or clone this repo by using the link below:

```
https://github.com/rajiyanareja1517/galaxy_planets.git
```


### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- assets
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- constants/
|- custom_class/
|- models/
|- view/screen/
|- utils/
|- main.dart
```

### view/screens

This directory screens all the screen of the application together in one place. A separate file is created for each type as shown in example below:

```
screens/
|- SplashScreen.dart
|- HomePage.dart
|- HomeScreen.dart
|- DetailsScreen.dart

```

### utils

Contains the common file(s) and utilities used in a project. The folder structure is as follows:

```

|- utils/
    |- Constants/

```


### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.

```dart
import 'package:flutter/material.dart';
import 'package:galaxy_planets/models/planets_des_model.dart';
import 'package:galaxy_planets/views/screens/details_screen.dart';
import 'package:galaxy_planets/views/screens/home_screen.dart';
import 'package:galaxy_planets/views/screens/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => SplashScreen(),),
        GetPage(name: '/home_screen', page: () => HomeScreen(),),
        GetPage(name: '/details_screen', page: () => DetailsScreen(),)

      ],
    );
  }
}

  
```

![Screenshot_20240812_104718](https://github.com/user-attachments/assets/fc4ed645-293e-446f-8324-2c25305ca035)
![Screenshot_20240812_104736](https://github.com/user-attachments/assets/8c3cd72b-03d7-4b7b-9f19-34cac2a76e73)
![Screenshot_20240812_104753](https://github.com/user-attachments/assets/29b3a5cb-bcaf-4b01-8858-c7b0a25ddc62)
![Screenshot_20240812_104759](https://github.com/user-attachments/assets/9e7d6ec0-2c47-4bdf-8f33-ee0711084306)

![Screenshot_20240812_104842](https://github.com/user-attachments/assets/b7223090-90f0-4ee9-a4aa-bb8febdb2381)

![Screenshot_20240812_104855](https://github.com/user-attachments/assets/60da6195-281e-4091-abff-59ebf37634eb)


## Conclusion

Again to note, this is example can appear as my code for what it is - but it is an example only. If you liked my work, don’t forget to ⭐ star the repo to show your support.
