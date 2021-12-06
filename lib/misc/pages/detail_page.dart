import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubits.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/misc/widgets/app_buttons.dart';
import 'package:flutter_cubit/misc/widgets/app_largr_text.dart';
import 'package:flutter_cubit/misc/widgets/app_text.dart';
import 'package:flutter_cubit/misc/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottrnStatrs = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 500,
                  decoration: const BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('img/mountain.jpeg'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned(
                left: 5,
                top: 5,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<AppCubits>(context).goHome();
                      },
                      icon: const Icon(Icons.menu),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 250,
                child: Container(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                              text: 'Yomite',
                              color: Colors.black.withOpacity(0.8)),
                          AppLargeText(
                              text: '\$ 250', color: AppColors.mainColor),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: AppColors.mainColor),
                          const SizedBox(width: 10),
                          AppText(
                              text: 'USA, California',
                              color: AppColors.textColor1),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(Icons.star,
                                  color: gottrnStatrs > index
                                      ? AppColors.starColor
                                      : AppColors.textColor2);
                            }),
                          ),
                          const SizedBox(width: 10),
                          AppText(
                            text: '(4.0)',
                            color: AppColors.textColor2,
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      AppLargeText(
                        text: 'People',
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      const SizedBox(height: 5),
                      AppText(
                        text: 'Number of people in your group',
                        color: AppColors.mainTextColor,
                      ),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10, top: 10),
                              child: AppButtons(
                                bgColor: selectedIndex == index
                                    ? Colors.black
                                    : AppColors.buttonBackground,
                                borderColor: selectedIndex == index
                                    ? Colors.black
                                    : AppColors.buttonBackground,
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                size: 50,
                                text: (index + 1).toString(),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20),
                      AppLargeText(
                        text: 'Description',
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      const SizedBox(height: 5),
                      AppText(
                        text:
                            'movement of people between distant geographical locations.Travel can be done by foot, bicycle, automobile, train, boat, bus,.',
                        color: AppColors.mainTextColor,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    AppButtons(
                      color: AppColors.textColor1,
                      bgColor: Colors.white,
                      borderColor: AppColors.textColor1,
                      size: 60,
                      isIcon: true,
                      icon: Icons.favorite_border_outlined,
                    ),
                    const SizedBox(width: 20),
                    ResponsiveButton(
                      isResponsive: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
