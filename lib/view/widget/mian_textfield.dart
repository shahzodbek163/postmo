import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postmo/view/value/app_color.dart';
import 'package:postmo/view/value/app_fonts.dart';

class MainTextfield extends StatelessWidget {
  final String hintText;
  final Widget? suffix;
  final bool redBorder;
  final bool eye;
  final TextInputType keybardType;
  const MainTextfield({
    super.key,
    this.hintText = "Hint text",
    this.suffix,
    this.redBorder = false,
    this.eye = false,
    this.keybardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1.w,
          color: redBorder ? Colors.red : Colors.transparent,
        ),
        color: AppColor.back,
      ),
      child: TextField(
        obscureText: eye,
        keyboardType: keybardType,
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            child: suffix,
          ),
          contentPadding: const EdgeInsets.only(left: 12),
          hintText: hintText,
          hintStyle: AppFonts.f16w400.copyWith(color: AppColor.txtSecond),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
