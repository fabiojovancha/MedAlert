import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/homePage.dart';
import 'package:flutter_application_1/screen/profilePage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
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

  late String _selectedDay;
  late String _selectedTime;
  TextEditingController _medicineController = TextEditingController();
  final List<String> _days = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
    'Minggu'
  ];
  final List<String> _times = ['Pagi', 'Siang', 'Malam'];

  @override
  void initState() {
    super.initState();
    _selectedDay = _days.first;
    _selectedTime = _times.first;
  }

  @override
  void dispose() {
    _medicineController.dispose();
    super.dispose();
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama Obat',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            TextField(
              controller: _medicineController,
              decoration: InputDecoration(
                hintText: 'Masukkan nama obat',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text('Hari',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: _selectedDay,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedDay = newValue;
                  });
                }
              },
              items: _days.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text('Jam',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: _selectedTime,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedTime = newValue;
                  });
                }
              },
              items: _times.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String medicineName = _medicineController.text;
                Medicine newMedicine = Medicine(
                  name: medicineName,
                  day: _selectedDay,
                  time: _selectedTime,
                );
                Navigator.pop(context,
                    newMedicine); // Kembali ke HomeScreen dengan membawa data obat baru
              },
              child: Text('Simpan'),
            ),
          ],
        ),
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
