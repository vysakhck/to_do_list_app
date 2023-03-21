import 'package:flutter/material.dart';

import 'package:to_do_list_app/logIn.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
        child: Container(
          width: double.infinity,
          color: Color(0xFFA5AAD9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(height: 300, child: Image.asset('assets/logo.png')),
              SizedBox(
                height: 12,
              ),
              Text(
                'To-Do App',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF505AB6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
