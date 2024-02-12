import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postmo/view/value/app_fonts.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  const MainButton({
    super.key,
    this.text = "Text",
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.2)),
          minimumSize: MaterialStateProperty.all(Size(double.infinity, 56.h)),
          backgroundColor: MaterialStateProperty.all(Colors.black),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: AppFonts.f16w500.copyWith(color: Colors.white),
        ));
  }
}
