import 'package:flutter/material.dart';
import 'dart:async';

import 'package:trend_practice/constants/constant.dart';
import 'package:trend_practice/screens/bkash_counter/bkash_bottom_paint.dart';
import 'package:trend_practice/screens/bkash_counter/bkash_top_paint.dart';
import 'package:trend_practice/screens/bkash_counter/counter_button.dart';

class BkashCounterScreen extends StatefulWidget {
  const BkashCounterScreen({Key? key}) : super(key: key);
  @override
  State<BkashCounterScreen> createState() => _BkashCounterScreenState();
}

class _BkashCounterScreenState extends State<BkashCounterScreen> {
  late Timer _timer;
  double _val = 0;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            // counter button
            Positioned(
              top: size.height * .4,
              left: 0,
              right: 0,
              child: const CounterButton(),
            ),
            Positioned(
              bottom: -110,
              left: -5,
              right: -5,
              child: SizedBox(
                height: 240,
                width: size.width,
                child: CustomPaint(
                  painter: BkashTopPaint(color: Colors.red, val: _val / 1000),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              width: size.width,
              child: GestureDetector(
                onLongPressStart: (details) {
                  if (mounted) {
                    _timer =
                        Timer.periodic(const Duration(milliseconds: 30), (_) {
                      setState(() => _val += 50);
                    });
                  }
                },
                onLongPressEnd: (_) {
                  if (mounted) {
                    if (_val >= 1000) _timer.cancel();
                    if (_val < 1000) {
                      _timer.cancel();
                      _val = 0;
                    }
                    setState(() {});
                  }
                },
                child: const SizedBox(
                  height: 150,
                  child: CustomPaint(
                      painter: BkashBottomPaint(color: Colors.deepPurple)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
