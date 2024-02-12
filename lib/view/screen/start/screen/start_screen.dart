import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:postmo/view/screen/auth/login/screen/login_screen.dart';
import 'package:postmo/view/value/app_color.dart';
import 'package:postmo/view/value/app_fonts.dart';
import 'package:postmo/view/value/app_image.dart';
import 'package:postmo/view/value/app_size.dart';
import 'package:postmo/view/widget/main_button.dart';
import 'package:postmo/view/widget/top_logo_widget.dart';

class StartScreen extends StatelessWidget {
  static const String routeName = "/start_screen";
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.horizontalPadding,
          vertical: AppSize.verticalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  const TopLogoWidget(),
                  Text("Photo platforma", style: AppFonts.f30w700),
                  const Gap(19),
                  Image.asset(
                    AppImage.camera,
                  ),
                  const Gap(18),
                  Text("O’z suratlaringizni joylang", style: AppFonts.f20w600),
                  const Gap(10),
                ],
              ),
            ),
            Text(
              "DataSpin & MOdevco bilan hamkorlikda",
              style: AppFonts.f16w400.copyWith(color: AppColor.txtSecond),
            ),
            const Gap(16),
            MainButton(
              text: "Boshlash",
              onTap: () => context.push(LoginScreen.routeName),
            ),
          ],
        ),
      )),
    );
  }
}
