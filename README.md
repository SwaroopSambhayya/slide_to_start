
This package provides a interactive way of slide to complete facility similar to slide to answer in Iphone!

## Features

1. Slide to start drag animation
2. Changing following properties like slide button size,color,radius, similarly for dashbutton
3. Changing the width,height,padding,length,background,border of slide container
4. Changing the slide text, shimmer effect color



### Animation action

https://user-images.githubusercontent.com/31922733/217163023-867e8aac-6f69-4199-b689-5eade764f392.mov


### Animation usecase

https://user-images.githubusercontent.com/31922733/217163052-c4254513-626e-4964-8342-9a9b9e66b8d5.mov


## Getting started

Add slide_to_start file to your pubspec.yaml file
```
dependencies:
slide_to_start: ^0.0.1

```

## Usage

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
