import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:postmo/view/screen/auth/register/screen/register_screen.dart';
import 'package:postmo/view/value/app_color.dart';
import 'package:postmo/view/value/app_fonts.dart';
import 'package:postmo/view/value/app_icons.dart';
import 'package:postmo/view/value/app_size.dart';
import 'package:postmo/view/widget/main_button.dart';
import 'package:postmo/view/widget/mian_textfield.dart';
import 'package:postmo/view/widget/top_logo_widget.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/login_screen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool eye = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.horizontalPadding,
          vertical: AppSize.verticalPadding,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TopLogoWidget(),
              const Gap(57),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Kirish",
                    style: AppFonts.f27w700,
                  ),
                ],
              ),
              const Gap(11),
              const MainTextfield(
                hintText: "emailingiz...",
                keybardType: TextInputType.emailAddress,
              ),
              const Gap(16),
              MainTextfield(
                hintText: "parolingiz...",
                keybardType: TextInputType.visiblePassword,
                eye: eye,
                suffix: InkWell(
                  onTap: () {
                    setState(() {
                      eye = !eye;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset(
                      !eye ? AppIcons.eyeShow : AppIcons.eyeHide,
                      color: AppColor.txtSecond,
                    ),
                  ),
                ),
              ),
              const Gap(24),
              const MainButton(
                text: "Kirish",
              ),
              const Gap(18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Akkauntingiz yo’qmi? ",
                    style: AppFonts.f16w400,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () => context.push(RegisterScreen.routeName),
                    child: Text(
                      "Ro’xatdan o’tish",
                      style: AppFonts.f16w400.copyWith(color: AppColor.txtBlue),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
