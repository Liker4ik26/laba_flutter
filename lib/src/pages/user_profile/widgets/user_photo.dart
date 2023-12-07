import 'package:flutter/material.dart';
import 'package:laba_flutter/src/app/styles/dimensions.dart';
import 'package:laba_flutter/src/shared/extensions/context_extensions.dart';

class UserPhoto extends StatelessWidget {
  const UserPhoto({
    super.key,
    this.width = 110,
    this.height = 110,
    required this.image,
  });

  final double? width;
  final double? height;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.tinyMedium),
        image: DecorationImage(
          image: AssetImage(image),
        ),
        boxShadow: [
          BoxShadow(
            color: context.theme.colorScheme.onBackground,
            blurRadius: 24,
            offset: const Offset(0, 16),
            spreadRadius: -16,
          ),
        ],
      ),
    );
  }
}
