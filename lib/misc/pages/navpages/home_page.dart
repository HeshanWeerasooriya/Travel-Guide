import 'package:flutter/material.dart';
import 'package:flutter_cubit/misc/colors.dart';

import 'package:flutter_cubit/misc/widgets/app_largr_text.dart';
import 'package:flutter_cubit/misc/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png": "balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling",
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu, size: 30, color: Colors.black54),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 0),
              AppLargeText(text: 'Discover'),
              const SizedBox(height: 0),
              TabBar(
                labelPadding: const EdgeInsets.only(left: 0, right: 40),
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator:
                    CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                tabs: [
                  const Tab(text: 'Places'),
                  const Tab(text: 'Inspiration'),
                  const Tab(text: 'Emotions'),
                ],
              ),
              SizedBox(
                height: 290,
                width: double.maxFinite,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 20, top: 10),
                            child: Container(
                              width: 180,
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                    image: AssetImage(
                                      'img/mountain.jpeg',
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          );
                        }),
                    const Text('There'),
                    const Text('Bye'),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(text: 'Explore more', size: 22),
                  AppText(text: 'See all', color: AppColors.textColor1)
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 110,
                width: double.maxFinite,
                child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 20, top: 0),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(
                                    'img/' + images.keys.elementAt(index),
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(right: 20, top: 5),
                              child: AppText(
                                text: images.values.elementAt(index),
                                color: AppColors.textColor2,
                              ))
                        ],
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 8 - radius / 1,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
