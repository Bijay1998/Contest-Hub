import 'package:contest_hub/view/HomePage/photo.dart';
import 'package:contest_hub/view/OrganizePage/organizerDetailsPage.dart';
import 'package:contest_hub/view/OrganizePage/homePage.dart';
import 'package:contest_hub/view/winnerPage.dart';
import 'package:flutter/material.dart';

class BottomNavigationPage extends StatefulWidget {
  BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int selecteditem = 0;
  List<Widget> pagename = [OrganizePage(), OrganizeEventPage(), WinnerPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selecteditem,
          onTap: (int index) {
            setState(() {
              selecteditem = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
                label: "Home",
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_circle,
                  color: Colors.red,
                ),
                label: "Organize"),
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: "Winners"),
          ]),
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Contest Hub"),
      ),
      body: pagename.elementAt(selecteditem),
    );
  }
}
