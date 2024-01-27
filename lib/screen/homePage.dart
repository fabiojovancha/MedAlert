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
    HomeScreen(),
    AddScreen(),
    profileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
            bottom: Radius.circular(
                20), // Ganti dengan nilai radius yang diinginkan
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: medicines.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(medicines[index].name),
            subtitle:
                Text('${medicines[index].day} - ${medicines[index].time}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  medicines.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff3468C0),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
