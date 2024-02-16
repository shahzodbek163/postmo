import 'package:flutter/material.dart';
import 'package:postmo/controller/service/api/app_ip.dart';
import 'package:postmo/models/image/image_result.dart';
import 'package:postmo/view/value/app_fonts.dart';

class ImageCard extends StatefulWidget {
  final ImageDatum data;

  const ImageCard({super.key, required this.data});

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  bool onMoreTap = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: onMoreTap ? 450 : 400,
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
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                "${AppIp.ip}/images/${widget.data.image}",
                fit: BoxFit.cover,
                height: 280,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.data.title,
                style: AppFonts.h2Semibold18.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
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
                    widget.data.user?.username ?? "null username",
                    style: AppFonts.h2Semibold18,
                  ),
                  const Spacer(),
                  Image.asset(
                    "assets/icons/date.png",
                    width: 18,
                    height: 18,
                  ),
                  Text(
                    "${widget.data.updatedAt.day} ${widget.data.updatedAt.month} ${widget.data.updatedAt.year}",
                    style: AppFonts.bodyNormalRegular.copyWith(
                      color: const Color(0xFF8C8C8C),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: InkWell(
                onTap: () {
                  onMoreTap = !onMoreTap;
                  setState(() {});
                },
                child: Text(
                  onMoreTap ? "Berkitish" : "Yana...",
                  style: AppFonts.bodyNormalRegular.copyWith(
                    color: const Color(0xFF0000FF),
                  ),
                ),
              ),
            ),
            onMoreTap
                ? Expanded(
                    child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      widget.data.desc * 10,
                      maxLines: 2,
                    ),
                  ))
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
