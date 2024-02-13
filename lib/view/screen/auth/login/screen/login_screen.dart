import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:postmo/controller/bloc/auth/login/cubit/login_cubit.dart';
import 'package:postmo/controller/service/dialogs/show_top_snack_bar.dart';
import 'package:postmo/controller/service/transition/transitions.dart';
import 'package:postmo/model/auth/login/request/login_request.dart';
import 'package:postmo/view/screen/auth/register/screen/register_screen.dart';
import 'package:postmo/view/screen/home/screen/home_screen.dart';
import 'package:postmo/view/test_screen.dart';
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
  bool eye = true;
  final emilController = TextEditingController();
  final passwordController = TextEditingController();
  bool isEmptyUsername = false;
  bool isEmptyPassword = false;
  bool isValidPassword = true;
  final loginCubit = LoginCubit();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emilController.dispose();
    passwordController.dispose();
    loginCubit.close();
  }

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
              MainTextfield(
                hintText: "username...",
                keybardType: TextInputType.emailAddress,
                controller: emilController,
                isEmpty: isEmptyUsername,
              ),
              const Gap(16),
              MainTextfield(
                hintText: "parolingiz...",
                keybardType: TextInputType.visiblePassword,
                eye: eye,
                controller: passwordController,
                isEmpty: isEmptyPassword,
                isValid: isValidPassword,
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
              const Gap(26),
              BlocBuilder<LoginCubit, LoginState>(
                bloc: loginCubit,
                builder: (context, state) {
                  return MainButton(
                    text: "Kirish",
                    loading: state.maybeWhen(
                      orElse: () => false,
                      sending: () => true,
                    ),
                    onTap: () {
                      setState(() {
                        isEmptyUsername = emilController.text.trim().isEmpty;
                        isEmptyPassword =
                            passwordController.text.trim().isEmpty;
                      });
                      if (passwordController.text.trim().length >= 6 &&
                          passwordController.text.trim().length <= 12) {
                        setState(() {
                          isValidPassword = true;
                        });
                      } else if (passwordController.text.trim().isNotEmpty) {
                        setState(() {
                          isValidPassword = false;
                        });
                        showErrorSnackBar(
                          "Kamida 8 ta belgi (12 tadan oshmasligi lozim)",
                        );
                      }
                      if (!isEmptyUsername &&
                          !isEmptyPassword &&
                          isValidPassword) {
                        LoginRequest loginRequest = LoginRequest(
                          username: emilController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                        loginCubit.login(loginRequest).then((value) {
                          if (value) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                                (route) => true);
                          }
                        });
                      }
                    },
                  );
                },
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
