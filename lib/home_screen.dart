import 'package:flutter/material.dart';
import 'package:trend_practice/constants/constant.dart';
import 'package:trend_practice/screens/anim_list/anim_list_screen.dart';
import 'package:trend_practice/screens/bkash_counter/bkash_counter_screen.dart';
import 'package:trend_practice/screens/book_screen/book_anim_screen.dart';
import 'package:trend_practice/screens/circular_indicator/circular_indicator_screen.dart';
import 'package:trend_practice/screens/draggable_anim/draggable_anim_screen.dart';
import 'package:trend_practice/screens/fb_story/fb_story_screen.dart';
import 'package:trend_practice/screens/flip_card/flip_card_screen.dart';
import 'package:trend_practice/screens/flow_screen/flow_screen.dart';
import 'package:trend_practice/screens/grid_disk/disk_chlng_screen.dart';
import 'package:trend_practice/screens/insta_story/insta_story_screen.dart';
import 'package:trend_practice/screens/moving_img/moving_img_screen.dart';
import 'package:trend_practice/screens/music_disk/music_disk.dart';
import 'package:trend_practice/screens/youtube_chip/youtube_chip_screen.dart';
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
          HomeButton(title: 'Animated List', route: AnimListScreen()),
          HomeButton(
              title: 'Bkash anim & Counter', route: BkashCounterScreen()),
          HomeButton(title: 'Book Animation', route: BookAnimScreen()),
          HomeButton(
              title: 'Circular Progress Indicator', route: CircularIndicator()),
          HomeButton(title: 'Draggable Anim', route: DraggableAnimScreen()),
          HomeButton(title: 'Fb Story', route: FbStoryScreen()),
          HomeButton(title: 'Flip Card', route: FlipCardScreen()),
          HomeButton(title: 'Flow Sample', route: FlowScreen()),
          HomeButton(title: 'Grid Disk Challenge', route: GridDiskScreen()),
          HomeButton(title: 'Insta Story', route: InstaStoryScreen()),
          HomeButton(title: 'Moving Ima', route: MovingImgScreen()),
          HomeButton(title: 'Music Disk', route: MusicDiskScreen()),
          HomeButton(title: 'YouTube Chip Card', route: YoutubeChipScreen()),
        ],
      );
}
