import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:postmo/view/screen/auth/login/screen/login_screen.dart';
import 'package:postmo/view/value/app_color.dart';
import 'package:postmo/view/value/app_fonts.dart';
import 'package:postmo/view/value/app_icons.dart';
import 'package:postmo/view/value/app_size.dart';
import 'package:postmo/view/widget/main_button.dart';
import 'package:postmo/view/widget/mian_textfield.dart';
import 'package:postmo/view/widget/top_logo_widget.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "/register_screen";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool eye = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    "Ro’yxatdan o’tish",
                    style: AppFonts.f27w700,
                  ),
                ],
              ),
              const Gap(11),
              const MainTextfield(
                hintText: "ism...",
              ),
              const Gap(16),
              const MainTextfield(
                hintText: "email...",
                keybardType: TextInputType.emailAddress,
              ),
              const Gap(16),
              MainTextfield(
                hintText: "parol...",
                eye: eye,
                keybardType: TextInputType.visiblePassword,
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
                text: "Ro’yxatdan o’tish",
              ),
              const Gap(11),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Akkountingiz bormi? ",
                    style: AppFonts.f16w400,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () => context.pop(LoginScreen.routeName),
                    child: Text(
                      "Kirish",
                      style: AppFonts.f16w400.copyWith(
                        color: AppColor.txtBlue,
                      ),
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
