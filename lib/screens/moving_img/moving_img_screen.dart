import 'package:flutter/material.dart';
import 'package:trend_practice/screens/anim_list/trip.dart';
import 'package:trend_practice/screens/moving_img/travel.dart';

// Moving images animation
class MovingImgScreen extends StatefulWidget {
  const MovingImgScreen({Key? key}) : super(key: key);
  @override
  State<MovingImgScreen> createState() => _MovingImgScreenState();
}

class _MovingImgScreenState extends State<MovingImgScreen> {
  int _currentImage = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Column(
        children: [
          _topImagesList(size),
          _recommentList(size),
        ],
      ),
    );
  }

  Widget _topImagesList(Size size) => SizedBox(
        height: size.height * .6,
        child: Stack(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 700),
              child: BackImages(
                travel: travels[_currentImage],
                key: Key(travels[_currentImage].title),
                currentIndex: _currentImage,
              ),
            ),
            _pageView(size),
          ],
        ),
      );

  Widget _pageView(Size size) => Positioned(
        bottom: 0,
        left: 10,
        height: 130,
        width: size.width - 10,
        child: PageView.builder(
          padEnds: false,
          controller: PageController(viewportFraction: 0.4, initialPage: 1),
          itemBuilder: (context, index) => InkWell(
            onTap: () => setState(() => _currentImage = index),
            child: Container(
              width: 150,
              margin: const EdgeInsets.only(right: 10),
              child: Image.asset(travels[index].imageBack, fit: BoxFit.cover),
            ),
          ),
          itemCount: travels.length,
        ),
      );

  Widget _recommentList(Size size) => Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              const Text('Recommended',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              _recommentItem(),
              _recommentItem(),
              _recommentItem(),
            ],
          ),
        ),
      );

  Widget _recommentItem() {
    return Container(
      height: 120,
      color: Colors.grey[800],
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            width: 160,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(travels[3].imageBack),
                    fit: BoxFit.cover)),
          ),
          Expanded(child: Center(child: Text(trips[1].title))),
        ],
      ),
    );
  }
}

class BackImages extends StatefulWidget {
  const BackImages({Key? key, required this.currentIndex, required this.travel})
      : super(key: key);
  final int currentIndex;
  final Travel travel;
  @override
  State<BackImages> createState() => _BackImagesState();
}

class _BackImagesState extends State<BackImages>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    // reverse makes the animation smoothly repeat
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) => SizedBox(
        height: size.height * .55,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              left: -100.0 * _controller.value,
              right: -100.0 * (1 - _controller.value),
              child: Image.asset(widget.travel.imageBack, fit: BoxFit.cover),
            ),
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              height: 80,
              child: Center(
                child: Text(widget.travel.title,
                    style: const TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Positioned.fill(
              left: -100.0 * _controller.value,
              right: -100.0 * (1 - _controller.value),
              child: Image.asset(widget.travel.imageFront, fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}
