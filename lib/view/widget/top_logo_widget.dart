import 'package:flutter/material.dart';
import 'package:postmo/view/value/app_image.dart';

class TopLogoWidget extends StatelessWidget {
  const TopLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImage.postmoLogo,
      scale: 3,
    );
  }
}
