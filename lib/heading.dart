import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 100, left: 19),
      height: 174,
      width: 430,
      color: Color(0xff2505ab6),
      child: const Text(
        'To-Do List',
        style: TextStyle(
            fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
