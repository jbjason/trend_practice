import 'package:flutter/material.dart';
import 'package:trend_practice/screens/book_screen/book.dart';
import 'package:trend_practice/screens/fb_story/fb_story_item.dart';

// ! Fb add-story animation
class FbStoryScreen extends StatefulWidget {
  const FbStoryScreen({Key? key}) : super(key: key);
  @override
  State<FbStoryScreen> createState() => _FbStoryScreenState();
}

const containerHeight = 150.0;
const containerWidht = 150.0;

class _FbStoryScreenState extends State<FbStoryScreen> {
  late ScrollController _controller;
  double _offset = 0;

  void _listen() {
    _offset = _controller.offset;
    setState(() {});
  }

  @override
  void initState() {
    _controller = ScrollController()..addListener(_listen);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_listen);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              SizedBox(
                height: containerHeight,
                child: ListView.builder(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return index == 0
                        ? Container(width: containerWidht)
                        : Container(
                            width: containerWidht,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(books[index].image),
                                  fit: BoxFit.cover),
                            ),
                          );
                  },
                  itemCount: books.length,
                ),
              ),
              FbStoryItem(offsett: _offset),
            ],
          ),
        ],
      ),
    );
  }
}
