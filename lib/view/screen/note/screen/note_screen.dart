import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:postmo/view/value/app_color.dart';
import 'package:postmo/view/value/app_fonts.dart';
import 'package:postmo/view/value/app_size.dart';
import 'package:postmo/view/widget/top_logo_widget.dart';

class NoteScreen extends StatelessWidget {
  static const String routeName = "/note_screen";
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.horizontalPadding,
          vertical: AppSize.verticalPadding,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(48),
              const TopLogoWidget(),
              const Gap(50),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Eslatma!",
                  style: AppFonts.f18w600,
                  textAlign: TextAlign.start,
                ),
              ),
              const Gap(20),
              Text(
                "Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor, nisi fuga. Neque a explicabo rerum quo harum possimus suscipit, quaerat sed porro exercitationem quibusdam obcaecati, dolore voluptatibus veritatis ex maiores hic consectetur deleniti sapiente nobis! Debitis rerum quibusdam repudiandae in, delectus vel doloremque dolores laboriosam nulla distinctio fuga cumque exercitationem? Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor, nisi fuga. Neque a explicabo rerum quo harum possimus suscipit, quaerat sed porro exercitationem quibusdam obcaecati, dolore voluptatibus veritatis ex maiores hic consectetur deleniti sapiente nobis! Debitis rerum quibusdam repudiandae in, delectus vel doloremque dolores laboriosam nulla distinctio fuga cumque exercitationem?",
                style: AppFonts.f18w400.copyWith(
                  color: AppColor.txtThird,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
