
This package provides a interactive way of slide to complete facility similar to slide to answer in Iphone!

## Features

1. Slide to start drag animation
2. Changing following properties like slide button size,color,radius, similarly for dashbutton
3. Changing the width,height,padding,length,background,border of slide container
4. Changing the slide text, shimmer effect color



### Animation action

![ezgif com-video-to-gif (1)](https://user-images.githubusercontent.com/31922733/217453687-7e351fba-bdb3-4ef3-9bb3-c4ad6dd727a1.gif)


### Animation usecase

![ezgif com-video-to-gif](https://user-images.githubusercontent.com/31922733/217453740-3193b2a6-234c-4686-b637-adc181418def.gif)


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
