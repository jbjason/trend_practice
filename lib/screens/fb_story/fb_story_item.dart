import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:trend_practice/screens/fb_story/fb_story_screen.dart';

class FbStoryItem extends StatelessWidget {
  const FbStoryItem({Key? key, required this.offsett}) : super(key: key);
  final double offsett;
  @override
  Widget build(BuildContext context) {
    final offset = (offsett / 140).clamp(0.0, 1.0);
    return Positioned(
      left: 0,
      top: lerpDouble(0, (containerHeight / 2) - 20, offset),
      height: lerpDouble(containerHeight, 50, offset),
      width: lerpDouble(containerWidht - 10, 45, offset),
      child: Container(
        padding: const EdgeInsets.all(5),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(lerpDouble(20, 0, offset)!),
            right: Radius.circular(lerpDouble(20, 40, offset)!),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.elliptical(lerpDouble(10, 22, offset)!,
                        lerpDouble(10, 22, offset)!),
                    bottom: Radius.elliptical(lerpDouble(10, 22, offset)!,
                        lerpDouble(10, 22, offset)!),
                  ),
                  image: const DecorationImage(
                      image: AssetImage('assets/card_/jb.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            offset > 0.1
                ? Container()
                : FittedBox(
                    child: Row(children: const [
                      Text('Add Story'),
                      Icon(Icons.add_a_photo_sharp)
                    ]),
                  ),
          ],
        ),
      ),
    );
  }
}
