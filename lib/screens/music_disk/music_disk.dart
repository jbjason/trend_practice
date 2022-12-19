import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

// Music disk hiding through scalling
class MusicDiskScreen extends StatelessWidget {
  const MusicDiskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(pinned: true, delegate: CustomHeader()),
          const SliverToBoxAdapter(child: Placeholder()),
          const SliverToBoxAdapter(child: Placeholder()),
          const SliverToBoxAdapter(child: Placeholder()),
        ],
      ),
    );
  }
}

class CustomHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final width = MediaQuery.of(context).size.width;
    final percent = 1 - (shrinkOffset / maxExtent);
    final double boxHeight = (170 * percent).clamp(40, 170);
    final double discHeight = (140 * percent).clamp(10, 140);
    final double diskLeft = (140 * percent).clamp(0, 140);
    final double titleHeight = (22 * percent).clamp(16, 22);
    final double titleLeft = ((width / 4) * percent).clamp(60, width / 4);
    final double subHeight = (16 * percent).clamp(13, 16);
    return Container(
      padding: const EdgeInsets.only(top: 40, left: 20, bottom: 10),
      color: Colors.grey[300],
      child: Stack(
        children: [
          Positioned(
            top: 8,
            left: titleLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Dexter Gordon',
                    style: TextStyle(
                        fontSize: titleHeight, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text('Our Man in Paris',
                    style: TextStyle(fontSize: subHeight, color: Colors.grey)),
              ],
            ),
          ),
          Positioned(
              bottom: 10,
              left: diskLeft,
              height: discHeight,
              child: Transform.rotate(
                  angle: vector.radians(360 * percent),
                  child:
                      Image.asset('assets/card_/disk.png', fit: BoxFit.cover))),
          Positioned(
              bottom: 0,
              left: 0,
              height: boxHeight,
              child: Image.asset('assets/card_/18.jpg', fit: BoxFit.cover))
        ],
      ),
    );
  }

  @override
  double get maxExtent => 350;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
