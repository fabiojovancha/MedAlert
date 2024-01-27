import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/addReminder.dart';
import 'package:flutter_application_1/screen/homePage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: AppBar().preferredSize.height,
          child: Center(
            child:
                Image.asset('assets/logo2.png', // Ganti dengan path gambar Anda
                    fit: BoxFit.contain,
                    width: 200, // Ubah sesuai keinginan Anda
                    height: 200),
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
                iconColor: Colors.white,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => profileScreen()),
                  );
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
    );
  }
}
