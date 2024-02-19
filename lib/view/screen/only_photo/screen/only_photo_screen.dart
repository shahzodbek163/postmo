import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:postmo/view/value/app_color.dart';
import 'package:postmo/view/value/app_fonts.dart';
import 'package:postmo/view/value/app_image.dart';
import 'package:postmo/view/value/app_size.dart';
import 'package:postmo/view/widget/top_logo_widget.dart';

class OnlyPhotoScreen extends StatelessWidget {
  static const String routeName = "/only_photo_screen";
  const OnlyPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.horizontalPadding,
          vertical: AppSize.verticalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(3),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TopLogoWidget(),
              ],
            ),
            const Gap(45),
            Text(
              "Yuklab oling",
              style: AppFonts.f18w600,
            ),
            const Gap(42),
            Expanded(
              child: AlignedGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                itemCount: 15,
                itemBuilder: (context, index) => Stack(
                  children: [
                    Container(
                      color: Colors.red,
                      child: Image.asset(
                        AppImage.camera,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: 3,
                      top: 3,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_downward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
