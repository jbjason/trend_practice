import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trend_practice/screens/book_screen/book.dart';

class BookItem extends StatelessWidget {
  const BookItem(
      {Key? key, required this.book, required this.percent, required this.size})
      : super(key: key);
  final Book book;
  final Size size;
  final double percent;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              height: size.height * .6,
              width: size.width * .7,
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(5.0, 5.0),
                ),
              ]),
            ),
            Transform(
              alignment: Alignment.centerLeft,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.002)
                ..rotateY(pow(percent, 0.5) * 1.5)
                ..scale(1 + percent)
                ..translate(-size.width * percent),
              child: Image.asset(
                book.image,
                fit: BoxFit.cover,
                height: size.height * .6,
                width: size.width * .7,
              ),
            ),
          ],
        ),
        SizedBox(height: size.height * .1),
        Opacity(
          opacity: 1 - percent,
          child: Column(
            children: [
              Text(book.title,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
              Text(
                book.author,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
