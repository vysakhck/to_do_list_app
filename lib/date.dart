import 'package:flutter/material.dart';

class DateFieled extends StatefulWidget {
  const DateFieled({super.key});

  @override
  State<DateFieled> createState() => _DateFieledState();
}

class _DateFieledState extends State<DateFieled> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      // margin: const EdgeInsets.only(left: 22),
      padding: const EdgeInsets.only(top: 6, bottom: 6, left: 24),
      width: 300,
      decoration: BoxDecoration(
        // color: Colors.white,
        border: Border.all(color: const Color(0xFF8C8A8A)),
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.access_time),
          ),
        ),
      ),
    ));
  }
}
