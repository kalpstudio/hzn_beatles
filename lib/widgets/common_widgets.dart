import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TextImage extends StatelessWidget {
  final AppText text;
  final String imagePath;
  const TextImage({
    super.key,
    required this.text,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            imagePath,
            width: getValueForScreenType<bool>(
              context: context,
              tablet: true,
              desktop: false,
              mobile: true,
            )
                ? MediaQuery.of(context).size.width * .90
                : null,
          ),
          text
        ],
      ),
    );
  }
}

class AppText extends StatelessWidget {
  final String text;
  final bool isBoldText;
  final double fontSize;
  final TextAlign? textAlign;
  const AppText({
    super.key,
    required this.text,
    this.isBoldText = false,
    this.fontSize = 32,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Clash Display',
        fontWeight: isBoldText ? FontWeight.bold : null,
        fontSize: getValueForScreenType<double>(
          context: context,
          mobile: fontSize / 2,
          tablet: fontSize,
          desktop: fontSize,
        ),
      ),
    );
  }
}

class AppSizedBox extends StatelessWidget {
  final double height;
  const AppSizedBox({super.key, this.height = 40});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
