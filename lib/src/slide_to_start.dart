import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SlideToStart extends StatefulWidget {
  final Function onSlide;

  /// onSlide callback function
  final String? text;

  /// title of onslide action
  final TextStyle? textStyle;

  /// style of title
  final double? width;

  /// width of widget
  final double? height;

  /// height of the widget
  final EdgeInsetsGeometry? padding;

  /// Widget padding
  final Color? backgroundColor;

  /// Background color of the widget
  final double? borderWidth;

  /// border width of the widget when the border is specified
  final BorderRadiusGeometry? borderRadius;

  /// border radius of the widget
  final BorderType? dashedBorderType;

  /// borderType of the dashed component
  final IconData? icon;

  /// slide button icon
  final Color? shimmerBaseColor;

  /// shimmer effect base color
  final Color? shimmerHighLightColor;

  /// shimmer effect highlight color
  final Color? iconColor;

  /// slide button icon color
  final Color? borderColor;

  /// widget border color
  final Color? dashButtonBorderColor;

  /// dashed component boder color
  final Size? dashButtonSize;

  /// dashed component size
  final double? slideButtonRadius;

  /// Radius of the slide button
  final Color? slideButtonColor;

  /// Slide button color

  /// SlideToStart constructor
  const SlideToStart(
      {Key? key,
      required this.onSlide,
      this.padding,
      this.text,
      this.textStyle,
      this.width,
      this.height,
      this.backgroundColor,
      this.borderRadius,
      this.icon,
      this.iconColor,
      this.shimmerBaseColor,
      this.shimmerHighLightColor,
      this.dashedBorderType,
      this.borderColor,
      this.borderWidth,
      this.dashButtonSize,
      this.dashButtonBorderColor,
      this.slideButtonRadius,
      this.slideButtonColor})
      : super(key: key);

  @override
  State<SlideToStart> createState() => _SlideToStartState();
}

class _SlideToStartState extends State<SlideToStart> {
  /// tracking horizontal drag position
  double horizontalDragPosition = 0;

  /// tracking when to show action text
  bool showText = true;

  /// key for tracking position of slide button
  final GlobalKey _slideKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width * 0.75,
      padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 5),
      height: widget.height ?? 60,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.grey[100],
        border: Border.all(
            color: widget.borderColor ?? Colors.transparent,
            width: widget.borderWidth ?? 0),
        borderRadius: widget.borderRadius ??
            BorderRadius.circular(
                (MediaQuery.of(context).size.width * 0.75 + 80) / 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onPanUpdate: (details) async {
              if (!(details.globalPosition.dx >=
                      (MediaQuery.of(context).size.width -
                                  MediaQuery.of(context).size.width * 0.75) /
                              2 +
                          MediaQuery.of(context).size.width * 0.75 -
                          55) &&
                  details.localPosition.dx > 0) {
                setState(() {
                  horizontalDragPosition = details.localPosition.dx;
                  showText = false;
                });
                RenderBox? box =
                    _slideKey.currentContext?.findRenderObject() as RenderBox?;
                Offset? position = box?.localToGlobal(Offset.zero);
                if (position?.dx != null &&
                    horizontalDragPosition + 55 > position!.dx) {}
              } else {
                widget.onSlide();
                setState(() {
                  horizontalDragPosition = 0;
                  showText = true;
                });
              }
            },
            onPanEnd: (details) {
              setState(() {
                horizontalDragPosition = 0;
                showText = true;
              });
            },
            child: Transform(
              transform:
                  Matrix4.translationValues(horizontalDragPosition, 0, 0),
              child: CircleAvatar(
                backgroundColor:
                    widget.slideButtonColor ?? Theme.of(context).primaryColor,
                radius: widget.slideButtonRadius ?? 25,
                child: Icon(
                  widget.icon ?? Icons.arrow_forward,
                  color: widget.iconColor ??
                      Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
            ),
          ),
          if (showText)
            Expanded(
              child: Center(
                child: Shimmer.fromColors(
                  baseColor:
                      widget.shimmerBaseColor ?? Theme.of(context).primaryColor,
                  highlightColor: widget.shimmerHighLightColor ?? Colors.grey,
                  child: Text(
                    widget.text ?? "Slide to interact",
                    style: widget.textStyle ??
                        TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          if (!showText)
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: DottedBorder(
                  borderType: widget.dashedBorderType ?? BorderType.Circle,
                  color: widget.dashButtonBorderColor ??
                      Theme.of(context).primaryColor,
                  dashPattern: const [6, 3, 6, 3],
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    width: widget.dashButtonSize?.width ?? 50,
                    height: widget.dashButtonSize?.height ?? 50,
                    key: _slideKey,
                    margin: const EdgeInsets.only(right: 2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: widget.slideButtonColor ??
                              Theme.of(context).scaffoldBackgroundColor,
                          style: BorderStyle.none),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
