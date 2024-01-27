import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/addReminder.dart';
import 'package:flutter_application_1/screen/homePage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({Key? key}) : super(key: key);

  @override
  _profileScreenState createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  static List<Widget> _widgetOptions = <Widget>[
    profileScreenContent(),
  ];

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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                iconColor: Colors.black,
              ),
              GButton(
                icon: Icons.add_circle_outline,
                iconSize: 45,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddScreen()),
                  );
                },
                iconColor: Colors.black,
              ),
              GButton(
                icon: Icons.account_circle,
                iconSize: 45,
                onPressed: () {
                  // Uncomment the lines below if you want to navigate to profileScreenContent
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => profileScreenContent()),
                  // );
                },
                iconColor: Colors.white,
              ),
            ],
            backgroundColor: Colors.blueAccent,
            color: Colors.white,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 400),
          ),
        ),
      ),
      body: _widgetOptions.elementAt(0),
    );
  }
}

class profileScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(30, 20, 0, 20),
            child: Text(
              "Profile",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )),
          Center(
            child: CircleAvatar(
              radius: 75,
              backgroundColor: Colors.grey,
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text("Johndoe",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400
            ),
            ),
          ),
          Center(
            child: Text("johndoe@gmail.com",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400
            ),
            ),
          ),
          SizedBox(height: 40),
          Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Edit Profile',
                  suffixIcon: Icon(Icons.person),
                  border: UnderlineInputBorder(),
                  contentPadding: EdgeInsets.fromLTRB(20,0,20,0)
                ),
              ),
            ],
          ),
          ),
      ],
    );
  }
}

