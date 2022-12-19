import 'package:flutter/material.dart';
import 'package:trend_practice/screens/anim_list/trip.dart';
import 'package:trend_practice/screens/disk_chlng/disk_item2.dart';

class DiskChlngScreen extends StatefulWidget {
  const DiskChlngScreen({Key? key}) : super(key: key);
  @override
  State<DiskChlngScreen> createState() => _DiskChlngScreenState();
}

class _DiskChlngScreenState extends State<DiskChlngScreen> {
  int _count = 2;
  bool _isFirst = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Disk Challenge2'),
          actions: [
            IconButton(
              onPressed: () => setState(() {
                _count = _count != 2 ? 2 : 1;
                _isFirst = false;
              }),
              icon: _count == 2
                  ? const Icon(Icons.grid_4x4_sharp, color: Colors.white)
                  : const Icon(Icons.stacked_line_chart, color: Colors.white),
            ),
            const SizedBox(width: 20),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _count,
                mainAxisSpacing: _count == 2 ? 5 : 25,
                mainAxisExtent:
                    _count == 2 ? size.height * .16 : size.height * .18,
                crossAxisSpacing: 10),
            itemBuilder: (context, index) =>
                DiskItem(trip: trips[index], count: _count, isFirst: _isFirst),
            itemCount: trips.length,
          ),
        ),
      ),
    );
  }
}
