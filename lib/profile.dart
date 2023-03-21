import 'dart:io';

import 'package:flutter/foundation.dart' show Uint8List;
import 'package:flutter/material.dart';
import 'package:to_do_list_app/body.dart';

class UserInfromationScreen extends StatefulWidget {
  const UserInfromationScreen({super.key});

  @override
  State<UserInfromationScreen> createState() => _UserInfromationScreenState();
}

class _UserInfromationScreenState extends State<UserInfromationScreen> {
  File? image;
  Uint8List? webImage;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final bioController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    bioController.dispose();
  }

  // for selecting image
  // void selectImage() async {
  //   _file = await pickImage(context);
  //   image = File(_file!.path);
  //   webImage = await _file?.readAsBytes();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    // final isLoading =
    //     Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
        ),
        backgroundColor: Color(0xEF505BC1),
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(vertical: 25.0, horizontal: 5.0),
            child: Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundColor: Color(0xEF505BC1),
                    radius: 50,
                    backgroundImage: ExactAssetImage('assets/person.jpg'),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    margin: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        // name field
                        textFeld(
                          hintText: "John Smith",
                          icon: Icons.account_circle,
                          inputType: TextInputType.name,
                          maxLines: 1,
                          controller: nameController,
                        ),

                        // email
                        textFeld(
                          hintText: "abc@example.com",
                          icon: Icons.email,
                          inputType: TextInputType.emailAddress,
                          maxLines: 1,
                          controller: emailController,
                        ),

                        // bio
                        textFeld(
                          hintText: "Enter your bio here...",
                          icon: Icons.edit,
                          inputType: TextInputType.name,
                          maxLines: 2,
                          controller: bioController,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.90,
                    child: TextButton(
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            color: Color(0xF1505AB6),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(
                            MaterialPageRoute(
                              builder: (context) => TodoApp(),
                            ),
                          );
                        }
                        // => storeData(), child: null,
                        ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget textFeld({
  required String hintText,
  required IconData icon,
  required TextInputType inputType,
  required int maxLines,
  required TextEditingController controller,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: TextFormField(
      cursorColor: Color(0xF1505AB6),
      controller: controller,
      keyboardType: inputType,
      maxLines: maxLines,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          size: 20,
          color: Color(0xF1505AB6),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xF1505AB6),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xF1505AB6),
          ),
        ),
        hintText: hintText,
        alignLabelWithHint: true,
        border: InputBorder.none,
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}
