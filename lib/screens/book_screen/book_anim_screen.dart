import 'package:flutter/material.dart';
import 'package:trend_practice/screens/book_screen/book.dart';
import 'package:trend_practice/screens/book_screen/book_item.dart';

// ! book Transform Animation
class BookAnimScreen extends StatefulWidget {
  const BookAnimScreen({Key? key}) : super(key: key);
  @override
  State<BookAnimScreen> createState() => _BookAnimScreenState();
}

class _BookAnimScreenState extends State<BookAnimScreen> {
  final _controller = PageController();
  final _notifier = ValueNotifier(0.0);
  @override
  void initState() {
    super.initState();
    _controller.addListener(_listener);
  }

  void _listener() {
    _notifier.value = _controller.page!;
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset('assets/card_/background.png',
                  fit: BoxFit.cover)),
          Positioned(
            height: kToolbarHeight + 20,
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.grey[800],
              leading: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back_ios_new)),
              title: const Text('Book Concept'),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: size.height,
            child: ValueListenableBuilder<double>(
              valueListenable: _notifier,
              builder: (context, double value, _) {
                return PageView.builder(
                  controller: _controller,
                  itemBuilder: (ctx, index) {
                    // 0.9 ,o.8 to 0.1, 0.0
                    final percent = (index - value).clamp(0.0, 1.0);
                    return BookItem(
                        book: books[index], percent: percent, size: size);
                  },
                  itemCount: books.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
