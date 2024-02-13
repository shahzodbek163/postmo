import 'package:flutter/material.dart';
import 'package:postmo/controller/service/api/app_ip.dart';
import 'package:postmo/models/image/image_response.dart';
import 'package:postmo/view/value/app_fonts.dart';

class ImageCard extends StatelessWidget {
  final String imageUrl;

  const ImageCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1.5,
          color: const Color(0xFF999999),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              "${AppIp.ip}/image/$imageUrl",
              fit: BoxFit.cover,
              height: 280,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ishlayotgan vaqtim",
                    style: AppFonts.h2Semibold18.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/camera.jpg"),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "MOdevco",
                        style: AppFonts.h2Semibold18,
                      ),
                      const Spacer(),
                      Image.asset(
                        "assets/icons/date.png",
                        width: 18,
                        height: 18,
                      ),
                      Text(
                        "01/01/2024",
                        style: AppFonts.bodyNormalRegular.copyWith(
                          color: const Color(0xFF8C8C8C),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Yana...",
                    style: AppFonts.bodyNormalRegular.copyWith(
                      color: const Color(0xFF0000FF),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
