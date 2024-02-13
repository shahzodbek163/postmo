import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:postmo/controller/bloc/auth/register/cubit/register_cubit.dart';
import 'package:postmo/controller/service/dialogs/show_top_snack_bar.dart';
import 'package:postmo/model/auth/register/request/register_request.dart';
import 'package:postmo/view/screen/auth/login/screen/login_screen.dart';
import 'package:postmo/view/value/app_color.dart';
import 'package:postmo/view/value/app_fonts.dart';
import 'package:postmo/view/value/app_icons.dart';
import 'package:postmo/view/value/app_size.dart';
import 'package:postmo/view/widget/main_button.dart';
import 'package:postmo/view/widget/mian_textfield.dart';
import 'package:postmo/view/widget/top_logo_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "/register_screen";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isEmptyName = false;
  bool isEmptyUsername = false;
  bool isEmptyPassword = false;
  bool eye = true;
  bool isValidPassword = true;

  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final registerCubit = RegisterCubit();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    registerCubit.close();
  }

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
              MainTextfield(
                hintText: "ism...",
                isEmpty: isEmptyName,
                controller: nameController,
              ),
              const Gap(16),
              MainTextfield(
                hintText: "username...",
                keybardType: TextInputType.emailAddress,
                isEmpty: isEmptyUsername,
                controller: usernameController,
              ),
              const Gap(16),
              MainTextfield(
                hintText: "parol...",
                eye: eye,
                keybardType: TextInputType.visiblePassword,
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
              const Gap(24),
              BlocBuilder<RegisterCubit, RegisterState>(
                bloc: registerCubit,
                builder: (context, state) {
                  return MainButton(
                    text: "Ro’yxatdan o’tish",
                    loading: state.maybeWhen(
                      orElse: () => false,
                      sending: () => true,
                    ),
                    onTap: () {
                      setState(() {
                        isEmptyName = nameController.text.trim().isEmpty;
                        isEmptyUsername =
                            usernameController.text.trim().isEmpty;
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
                      if (!isEmptyName &&
                          !isEmptyUsername &&
                          !isEmptyPassword &&
                          isValidPassword) {
                        RegisterRequest request = RegisterRequest(
                          name: nameController.text.trim(),
                          username: usernameController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                        registerCubit.register(request).then((value) {
                          if (value) {
                            context.pushReplacement(LoginScreen.routeName);
                          }
                        });
                      }
                    },
                  );
                },
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
