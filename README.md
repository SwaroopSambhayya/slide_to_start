<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

This package provides a interactive way of slide to complete facility similar to slide to answer in Iphone!

## Features

1. Slide to start drag animation
2. Changing following properties like slide button size,color,radius, similarly for dashbutton
3. Changing the width,height,padding,length,background,border of slide container
4. Changing the slide text, shimmer effect color

## Getting started

Add slide_to_start file to your pubspec.yaml file
dependencies:
flutter_native_splash: ^2.2.17

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
SlideToStart(

        onSlide: () async {
                Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Home(),
                                ),
                            );
                        },
        ),
```

## Additional information

1. You can file the issues at https://github.com/SwaroopSambhayya/slide_to_start
2. Any contribution will be appreciated, please raise a issue to contribute
