import 'package:flutter/material.dart';
import 'package:trend_practice/screens/flow_screen/flow_delegate1.dart';
import 'package:trend_practice/screens/flow_screen/flow_delegate2.dart';

// floating Animated buttons
class FlowScreen extends StatelessWidget {
  const FlowScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: FlowWidgets(),
    );
  }
}

class FlowWidgets extends StatefulWidget {
  const FlowWidgets({Key? key}) : super(key: key);
  @override
  State<FlowWidgets> createState() => _FlowWidgetsState();
}

class _FlowWidgetsState extends State<FlowWidgets>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final List<IconData> _icons = [
    Icons.mail,
    Icons.cabin,
    Icons.notifications_active,
    Icons.offline_pin,
    Icons.menu
  ];
  final List<IconData> _icons1 = [
    Icons.qr_code,
    Icons.yard,
    Icons.wrap_text_sharp,
    Icons.tablet_mac,
    Icons.offline_share,
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Flow(
          delegate: FlowDelegate1(controller: _controller),
          children: _icons.map(_body).toList(),
        ),
        Flow(
          delegate: FlowDelegate2(controller: _controller),
          children: _icons1.map(_body).toList(),
        ),
      ],
    );
  }

  Widget _body(IconData icon_) => SizedBox(
        height: 60,
        width: 60,
        child: FloatingActionButton(
          heroTag: '$icon_',
          elevation: 0,
          splashColor: Colors.grey[850],
          child: Icon(icon_, color: Colors.red, size: 40),
          onPressed: () {
            if (_controller.status == AnimationStatus.completed) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
        ),
      );
}
