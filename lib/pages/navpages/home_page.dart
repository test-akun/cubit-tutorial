import 'package:flutter/material.dart';
import 'package:flutter_cubit/misc/colors.dart';

import 'package:flutter_cubit/widgets/app_large_text.dart';
import 'package:flutter_cubit/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    'Balloning': 'balloning.png',
    'Hiking': 'hiking.png',
    'Kayaking': 'kayaking.png',
    'Snorkling': 'snorkling.png',
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //? menu text
          Container(
            margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Row(
              children: [
                const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black54,
                ),
                const Expanded(child: SizedBox()),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          //? discover text
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: const AppLargeText(text: 'Discover'),
          ),
          const SizedBox(height: 20),
          //? tabbar
          TabBar(
            labelPadding: const EdgeInsets.only(left: 20, right: 20),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            controller: _tabController,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            indicator:
                const CircleTabIndicator(color: AppColors.mainColor, radius: 4),
            tabs: const [
              Tab(text: 'Place'),
              Tab(text: 'Inspiration'),
              Tab(text: 'Emotions'),
            ],
          ),
          // ? tabbar view
          Container(
            margin: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 15, top: 10),
                      width: 180,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: const DecorationImage(
                            image: AssetImage('img/mountain.jpeg'),
                            fit: BoxFit.cover),
                      ),
                    );
                  },
                ),
                Text('Second'),
                Text('Third'),
              ],
            ),
          ),
          const SizedBox(height: 30),
          // ? Explore text
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppLargeText(text: 'Explore more', size: 22),
                // Expanded(child: SizedBox()), == MainAxisAlignment.spaceBetween
                AppText(text: 'See all', color: AppColors.textColor1),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            height: 120,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 30),
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage(
                                    'img/' + images.values.elementAt(index)),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(height: 10),
                      AppText(
                        text: images.keys.elementAt(index),
                        color: AppColors.textColor1,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;
  const CircleTabIndicator({
    required this.color,
    required this.radius,
  });
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;
  _CirclePainter({
    required this.color,
    required this.radius,
  });
  @override
  void paint(
    Canvas canvas,
    Offset offset,
    ImageConfiguration configuration,
  ) {
    Paint _paint = Paint()
      ..color = color
      ..isAntiAlias = true;
    final xOffsett = configuration.size!.width / 2 - radius / 2;
    final yOffset = configuration.size!.height - radius;
    // print('xOffset: $xOffsett, yOffset: $yOffset');
    final Offset circleOffset = Offset(xOffsett, yOffset);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
