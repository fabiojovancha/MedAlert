import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/addReminder.dart';
import 'package:flutter_application_1/screen/profilePage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Medicine {
  final String name;
  final String day;
  final String time;

  Medicine({
    required this.name,
    required this.day,
    required this.time,
  });
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Medicine> medicines = [];
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreenContent(),
    AddScreen(),
    profileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => profileScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: AppBar().preferredSize.height,
          child: Center(
            child: Image.asset(
              'assets/logo2.png',
              fit: BoxFit.contain,
              width: 200,
              height: 200,
            ),
          ),
        ),
        backgroundColor: Color(0xff3468C0),
        elevation: 0,
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Container(
          height: 80,
          decoration: const BoxDecoration(
            color: Colors.blueAccent,
          ),
          child: GNav(
            tabs: [
              GButton(
                icon: Icons.home,
                iconSize: 45,
                // onPressed: () {
                //   _onItemTapped(0);
                iconColor: Colors.white,
              ),
              GButton(
                icon: Icons.add_circle_outline,
                iconSize: 45,
                onPressed: () {
                  _onItemTapped(1);
                },
                iconColor: Colors.black,
              ),
              GButton(
                icon: Icons.account_circle,
                iconSize: 45,
                onPressed: () {
                  _onItemTapped(2); // Simulate tapping the "Profile" tab
                },
                iconColor: Colors.black,
              ),
            ],
            selectedIndex: _selectedIndex,
            backgroundColor: Colors.blueAccent,
            color: Colors.white,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 400),
          ),
        ),
      ),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Text(
              "My Reminder",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            )),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text("Vitamin",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ))),
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text("Every Monday - 15.00",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.red
                        ))),
              ],
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text("Paracetamol",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ))),
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text("Every Monday - 15.00",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.red
                        ))),
              ],
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text("Bodrex Extra",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ))),
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text("Every Monday - 15.00",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.red
                        ))),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
