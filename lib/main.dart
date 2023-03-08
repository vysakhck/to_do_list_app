import 'package:flutter/material.dart';
import 'logIn.dart';

import 'body.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xFFEAE7E7),
        // appBar: AppBar(
        //   backgroundColor: Color(0xF1505AB6),
        //   elevation: 0,
        //   title: Container(
        //     width: double.infinity,
        //     height: 64.0,

        //     // width: 300,
        //     child: Stack(
        //       children: [
        //         Align(
        //           alignment: Alignment.center,
        //           child: IconButton(
        //             // height: 76,
        //             // width: 76,
        //             icon: Image.asset(
        //               'assets/person2.jpg',
        //             ),

        //             iconSize: 86,
        //             onPressed: () {
        //               Navigator.of(context).push(
        //                 MaterialPageRoute(
        //                   builder: (context) => MyStatefulWidget(),
        //                 ),
        //               );
        //             },
        //           ),
        //         ),
        //         Align(
        //           alignment: Alignment.centerRight,
        //           child: IconButton(
        //             icon: Icon(Icons.more_vert_rounded),
        //             color: Colors.white,
        //             iconSize: 40,
        //             onPressed: () {
        //               Drawer(
        //                 child: ListView(
        //                   padding: EdgeInsets.zero,
        //                   children: [
        //                     DrawerHeader(
        //                       decoration: BoxDecoration(
        //                         color: Colors.blue,
        //                       ),
        //                       child: Text('Drawer Header'),
        //                     ),
        //                     ListTile(
        //                       title: Text('Item 1'),
        //                       onTap: () {},
        //                     ),
        //                     ListTile(
        //                       title: Text('Item 2'),
        //                       onTap: () {},
        //                     ),
        //                   ],
        //                 ),
        //               );
        //             },
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        // appBar: AppBar(
        //   backgroundColor: const Color(0xF1505AB6),
        //   elevation: 0,
        //   title: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: const [
        //       Icon(
        //         Icons.menu_rounded,
        //         color: Colors.white,
        //         size: 30.0,
        //       ),
        //       SizedBox(
        //         height: 26,
        //         child: CircleAvatar(
        //           backgroundImage: AssetImage(
        //             'assets/person2.jpg',
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        body: const TodoApp(),
        // body: DateFieled(),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'logIn.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   static const String _title = 'LogIn';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title)),
//         body: MyStatefulWidget(),
//       ),
//     );
//   }
// }
