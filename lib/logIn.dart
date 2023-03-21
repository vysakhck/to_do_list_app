import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/body.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Text(
                'Log in',
                style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xF1505AB6)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                    labelStyle: GoogleFonts.poppins()),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.only(bottom: 20),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    labelStyle: GoogleFonts.poppins()),
              ),
            ),
            Row(
              children: <Widget>[
                Text(
                  'Forgot your password?',
                  style: GoogleFonts.poppins(),
                ),
                TextButton(
                  child: Text(
                    'Click Here',
                    style: GoogleFonts.poppins(
                        fontSize: 16, color: Color(0xF1505AB6)),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: Text(
                  'Login',
                  style: GoogleFonts.poppins(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TodoApp(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xF1505AB6), elevation: 0),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              height: 50,
              width: 292,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton.icon(
                icon: Image.asset(
                  'assets/Google.png',
                  width: 26,
                ),
                label: Text(
                  'Sign In with Google',
                  style: GoogleFonts.poppins(
                      fontSize: 16, color: Color(0xFF27363B)),
                ),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 292,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.facebook_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                label: Text(
                  'Sign In with Facebook',
                  style: GoogleFonts.poppins(fontSize: 16),
                ),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1877F2),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Does not have account?',
                  style: GoogleFonts.poppins(),
                ),
                TextButton(
                  child: Text(
                    'Sign in',
                    style: GoogleFonts.poppins(
                        fontSize: 16, color: Color(0xF1505AB6)),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
