import 'package:flutter/material.dart';
import 'package:qr_code/generate_qr.dart';
import 'package:qr_code/scan_qr.dart';

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({super.key});

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  int _selectedindex = 0;

  final List<Widget> _pages = const [
    ScanQR(),
    GenerateQR(),
    Center(
      child: Text(
        "History Page",
        style: TextStyle(color: Colors.white),
      ),
    )
  ];

  void _onitemtapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      body: _pages[_selectedindex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF2C2C2E),
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedindex,
          onTap: _onitemtapped,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_scanner), label: "Scan"),
            BottomNavigationBarItem(icon: Icon(Icons.qr_code),
            label: "Generate"
            ),
            BottomNavigationBarItem(icon: Icon(Icons.history),
            label: "History"
            )
          ]),
    );
  }
}
