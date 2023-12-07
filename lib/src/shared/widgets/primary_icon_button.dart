import 'package:flutter/material.dart';
import 'package:laba_flutter/src/shared/extensions/context_extensions.dart';
import 'package:laba_flutter/src/shared/widgets/svg_icon.dart';

class PrimaryIconButton extends StatelessWidget {
  const PrimaryIconButton({
    super.key,
    this.size,
    this.backgroundColor,
    this.iconColor,
    this.onClick,
    required this.icon,
    this.iconWidth,
    this.iconHeight,
    this.padding,
  });

  final double? size;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? iconWidth;
  final double? iconHeight;
  final EdgeInsets? padding;
  final void Function()? onClick;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? 44,
      width: size ?? 44,
      child: IconButton(
        padding: padding,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            backgroundColor ?? context.theme.colorScheme.background,
          ),
        ),
        onPressed: onClick,
        icon: SvgIcon(
          icon: icon,
          color:
              iconColor ?? context.theme.colorScheme.primary.withOpacity(.54),
          width: iconWidth,
          height: iconHeight,
        ),
      ),
    );
  }
}
