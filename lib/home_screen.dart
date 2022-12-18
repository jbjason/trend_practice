import 'package:flutter/material.dart';
import 'package:trend_practice/constants/constant.dart';
import 'package:trend_practice/screens/youtube_chip_screen.dart';
import 'package:trend_practice/widgets/home_button.dart';
import 'package:trend_practice/widgets/home_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HomeTitle(title: 'Trend Designs'),
              _project(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _project() => Column(
        children: const [
          HomeButton(title: 'YouTube Chip Card', route: YoutubeChipScreen()),
        ],
      );
}
