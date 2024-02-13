import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmo/controller/bloc/image/image_get_all_cubit.dart';
import 'package:postmo/controller/service/api/app_ip.dart';
import 'package:postmo/view/screen/home/widget/image_card.dart';
import 'package:postmo/view/value/app_fonts.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home_screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                    "MOdevco",
                    style: AppFonts.h2Semibold18,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/postmo_logo.jpg",
                      width: 218,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Barcha photo suratlar",
                    style: AppFonts.h2Semibold18,
                  ),
                  const SizedBox(height: 30),
                  BlocBuilder<ImageGetAllCubit, ImageGetAllState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => const SizedBox(),
                        loading: () => const CircularProgressIndicator(),
                        get: (response) {
                          return response.data.isEmpty
                              ? const Text("Ma'lumot yo'q")
                              : ListView.builder(
                                  itemCount: response.data.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => ImageCard(
                                    imageUrl:
                                        "${AppIp.ip}/image/${response.data[index].image}",
                                  ),
                                );
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
