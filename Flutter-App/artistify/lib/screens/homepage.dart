
import 'package:artistify/screens/uploadImages_screen.dart';
import 'package:flutter/material.dart';
import 'package:artistify/widgets/dashboard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var selectedItem = 0;

  List children = [
    DashboardPage(),
    DashboardPage(),
    DashboardPage(),
    DashboardPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF202020),
      body: children[selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF1B1B1B),
        selectedItemColor: Color(0xFFFFBD73),
        iconSize: 27.0,
        currentIndex: selectedItem,
        unselectedLabelStyle: TextStyle(color: Color(0xFF1B1B1B)),
        unselectedItemColor: Color(0xFF888888),
        onTap: (currIndex) {
          setState(() {
            selectedItem = currIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
              backgroundColor: Color(0xFF1B1B1B),
              icon: Icon(Icons.home),
              title: Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFFFBD73)),
              )),
          BottomNavigationBarItem(
              backgroundColor: Color(0xFF1B1B1B),
              icon: Icon(Icons.search),
              title: Container(
                height: 5.0,
                width: 5.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFFFBD73)),
              )),
          // BottomNavigationBarItem(
          //     backgroundColor: Color(0xFF1B1B1B),
          //     icon: Icon(Icons.camera),
          //     title: Container(
          //       height: 5.0,
          //       width: 5.0,
          //       decoration: BoxDecoration(
          //           shape: BoxShape.circle, color: Color(0xFFFFBD73)),
          //     )),
          // BottomNavigationBarItem(
          //   backgroundColor: Color(0xFF1B1B1B),
          //   icon: Icon(Icons.person_outline),
          //   title: Container(
          //     height: 5.0,
          //     width: 5.0,
          //     decoration: BoxDecoration(
          //         shape: BoxShape.circle, color: Color(0xFFFFBD73)),
          //   ),
          // ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.push(context, MaterialPageRoute(
                             builder: (context) {
                              return UploadImage();
                             },
                           ));
          
        },
        child: Icon(Icons.camera_alt_rounded),
        backgroundColor: Color(0xFFFFBD73),
        foregroundColor: Color(0xFF1B1B1B),
      ),
    );
  }
}
