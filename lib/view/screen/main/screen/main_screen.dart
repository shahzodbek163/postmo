import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:postmo/view/screen/home/screen/home_screen.dart';
import 'package:postmo/view/screen/note/screen/note_screen.dart';
import 'package:postmo/view/screen/only_photo/screen/only_photo_screen.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = "/main_screen";
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int onTapValue = 0;
  final pageView = PageController(keepPage: true);
  List<Widget> screens = [
    const HomeScreen(),
    const OnlyPhotoScreen(),
    const NoteScreen(),
  ];
  List<String> icons = [
    "assets/icons/home.svg",
    "assets/icons/only_photo.svg",
    "assets/icons/notif.svg",
    "assets/icons/profile.svg",
  ];
  List<String> iconsb = [
    "assets/icons/home_b.svg",
    "assets/icons/only_photo_b.svg",
    "assets/icons/notif_b.svg",
    "assets/icons/profile_b.svg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: screens.length,
              pageSnapping: true,
              controller: pageView,
              onPageChanged: (value) {
                onTapValue = value;
                setState(() {});
              },
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return screens[index];
              },
            ),
          ),
        ],
      ),
      bottomSheet: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: icons.length,
          itemExtent: 100,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 5),
                  InkWell(
                    onTap: () {
                      onTapValue = index;
                      pageView.animateToPage(
                        onTapValue,
                        duration: Durations.medium3,
                        curve: Curves.easeIn,
                      );
                      setState(() {});
                    },
                    child: SvgPicture.asset(
                      index == onTapValue ? iconsb[index] : icons[index],
                    ),
                  ),
                  index == 0
                      ? Container(
                          width: 14,
                          height: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: onTapValue == index
                                ? Colors.black
                                : const Color(0xFFC7C9D9),
                          ),
                        )
                      : const SizedBox(height: 5),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
