import 'package:flutter/material.dart';
import 'package:portfolio/presentation/widgets/spaces.dart';

import '../../values/values.dart';
import 'flicker_text_animation.dart';
import 'horizontal_bar.dart';

class Menuitem extends StatefulWidget {
  const Menuitem({
    Key? key,
    required this.title,
    this.titleStyle,
    this.onTap,
    this.selectedStyle,
    this.isMobile = false,
    this.selected = false,
  }) : super(key: key);

  final String title;
  final TextStyle? titleStyle;
  final TextStyle? selectedStyle;
  final bool selected;
  final bool isMobile;
  final GestureTapCallback? onTap;

  @override
  _MenuitemState createState() => _MenuitemState();
}

class _MenuitemState extends State<Menuitem> with TickerProviderStateMixin {
  bool _hovering = false;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    super.initState();
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showAnimationOnHover() {
    if (_hovering) {
      _playAnimation();
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          padding: EdgeInsets.all(
            widget.isMobile ? Sizes.PADDING_8 : Sizes.PADDING_2,
          ),
          child: !widget.isMobile
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    widget.selected
                        ? Container(
                            width: 2,
                            height: 24,
                            color: AppColors.secondaryColor,
                          )
                        : Container(),
                    widget.selected ? const SpaceW12() : Container(),
                    FlickerTextAnimation(
                      text: widget.title,
                      textColor: AppColors.secondaryColor,
                      fadeInColor: AppColors.accentColor,
                      controller: _controller.view,
                      textStyle: !widget.selected
                          ? theme.textTheme.bodyText1!
                              .copyWith(fontSize: Sizes.TEXT_SIZE_18)
                          : null,
                    ),
                  ],
                )
              : //This menuList shows only on mobile
              Column(
                  children: [
                    FlickerTextAnimation(
                      text: widget.title,
                      textColor: AppColors.primaryColor,
                      fadeInColor: AppColors.primaryColor,
//                      mainAxisAlignment: MainAxisAlignment.center,
                      controller: _controller.view,
                      textStyle: !widget.selected
                          ? theme.textTheme.bodyText1!.copyWith(
                              fontSize: Sizes.TEXT_SIZE_16,
                              color: AppColors.accentColor2,
                            )
                          : null,
                    ),
                    widget.selected ? const SpaceH8() : Container(),
                    widget.selected
                        ? const HorizontalBar(
                            color: AppColors.primaryColor,
                          )
                        : Container(),
                  ],
                ),
        ),
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });
    _showAnimationOnHover();
  }
}
