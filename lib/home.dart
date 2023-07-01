import 'dart:async';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:the_beatles/assetpaths/image_assets_path.dart';
import 'package:the_beatles/assetpaths/predefined_text.dart';
import 'package:the_beatles/widgets/common_widgets.dart';

class TheBeatlesHome extends StatefulWidget {
  const TheBeatlesHome({super.key});

  @override
  State<TheBeatlesHome> createState() => _TheBeatlesHomeState();
}

class _TheBeatlesHomeState extends State<TheBeatlesHome> {
  bool isHovered = false;
  int currentIndex = 0;
  List<String> imageUrls = [
    // AssetPath.ladyImage,
    AssetPath.ladyImage1,
    AssetPath.ladyImage2,
    AssetPath.ladyImage3,
    AssetPath.ladyImage4,
    AssetPath.ladyImage5,
    // Add more image URLs as needed
  ];
  List<Image> ladyImages = [];
  Timer? timer;

  @override
  void initState() {
    // imageUrls.map((e) => precacheImage(AssetImage(e), context));
    ladyImages = imageUrls.map((e) => Image.asset(e)).toList();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // // Adjust the provider based on the image type
    // imageUrls.map((e) => precacheImage(AssetImage(e), context));

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.01,
              horizontal: MediaQuery.of(context).size.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  AppText(
                    text: PredefinedText.kalpStudio,
                    isBoldText: true,
                    fontSize: 48,
                  ),
                ],
              ),
              const AppSizedBox(height: 80),
              if (getValueForScreenType<bool>(
                context: context,
                desktop: false,
                mobile: true,
                tablet: false,
              ))
                Center(
                  child: GestureDetector(
                    onLongPressStart: (_) {
                      if (!isHovered) {
                        isHovered = true;
                        startLoop();
                      }
                    },
                    onLongPressEnd: (_) {
                      if (isHovered) {
                        isHovered = false;
                        stopLoop();
                      }
                    },
                    child: ladyImages[currentIndex],
                  ),
                ),
              if (!getValueForScreenType<bool>(
                context: context,
                desktop: false,
                mobile: true,
                tablet: false,
              ))
                Center(
                  child: MouseRegion(
                    onEnter: (_) {
                      if (!isHovered) {
                        isHovered = true;
                        startLoop();
                      }
                    },
                    onExit: (_) {
                      if (isHovered) {
                        isHovered = false;
                        stopLoop();
                      }
                    },
                    child: Image.asset(
                      imageUrls[currentIndex],
                    ),
                  ),
                ),
              const AppSizedBox(height: 80),
              AppText(
                text: PredefinedText.aboutProject,
                fontSize: 64,
              ),
              const AppSizedBox(),
              AppText(
                text: PredefinedText.aboutProjectDescription,
              ),
              const AppSizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (!getValueForScreenType<bool>(
                    context: context,
                    desktop: false,
                    mobile: true,
                    tablet: true,
                  )) ...[
                    TextImage(
                      text: AppText(
                        text: PredefinedText.newAgeHandArt,
                        fontSize: 40,
                      ),
                      imagePath: AssetPath.handArt,
                    ),
                  ],
                  Column(
                    children: [
                      if (getValueForScreenType<bool>(
                        context: context,
                        desktop: false,
                        mobile: true,
                        tablet: true,
                      )) ...[
                        TextImage(
                          text: AppText(
                            text: PredefinedText.newAgeHandArt,
                            fontSize: 40,
                          ),
                          imagePath: AssetPath.handArt,
                        ),
                      ],
                      TextImage(
                        text: AppText(
                          text: PredefinedText.justBreathe,
                          fontSize: 40,
                        ),
                        imagePath: AssetPath.justBreathe,
                      ),
                      TextImage(
                        text: AppText(
                          text: PredefinedText.shiningInTheDark,
                          fontSize: 40,
                        ),
                        imagePath: AssetPath.shiningInTheDark,
                      ),
                      TextImage(
                        text: AppText(
                          text: PredefinedText.shiningInTheDark,
                          fontSize: 40,
                        ),
                        imagePath: AssetPath.monkey,
                      ),
                    ],
                  )
                ],
              ),
              const AppSizedBox(height: 80),
              SizedBox(
                width: double.infinity,
                child: AppText(
                  text: PredefinedText.myExperience,
                  fontSize: 64,
                  isBoldText: true,
                  textAlign: TextAlign.end,
                ),
              ),
              const AppSizedBox(),
              AppText(
                text: PredefinedText.myExperienceDescription,
              ),
              const AppSizedBox(height: 80),
              Center(
                child: TextImage(
                  text: AppText(
                    text: PredefinedText.placeSoQuiet,
                    fontSize: 40,
                  ),
                  imagePath: AssetPath.quietPlace,
                ),
              ),
              const AppSizedBox(height: 80),
              Center(
                child: TextImage(
                  text: AppText(
                    text: PredefinedText.infinityPortal,
                    fontSize: 40,
                  ),
                  imagePath: AssetPath.infinityPortal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void startLoop() {
    timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % imageUrls.length;
      });
    });
  }

  void stopLoop() {
    timer?.cancel();
    currentIndex = 0;
  }
}
