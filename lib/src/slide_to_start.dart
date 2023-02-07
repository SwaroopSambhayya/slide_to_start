import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SlideToStart extends StatefulWidget {
  final Function onSlide;
  final String? text;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final double? borderWidth;
  final BorderRadiusGeometry? borderRadius;
  final BorderType? dashedBorderType;
  final IconData? icon;
  final Color? shimmerBaseColor;
  final Color? shimmerHighLightColor;
  final Color? iconColor;
  final Color? borderColor;
  final Color? dashButtonBorderColor;
  final Size? dashButtonSize;
  final double? slideButtonRadius;
  final Color? slideButtonColor;

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
  double horizontalDragPosition = 0;
  bool showText = true;
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
