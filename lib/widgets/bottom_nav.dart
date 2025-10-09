import 'package:flutter/material.dart';
import 'package:qr_code/generate_qr.dart';
import 'package:qr_code/myhome.dart';
import 'package:qr_code/scan_qr.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  const BottomNav({super.key, required this.currentIndex});

  void _onItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return; //this is for avoid reloading same page

    Widget targetPage;
    switch (index) {
      case 0:
        targetPage = const Myhome();
        break;
      case 1:
        targetPage = const ScanQR();
        break;
      case 2:
        targetPage = const GenerateQR();
        break;
      default:
        targetPage = const Myhome();
    }

    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => targetPage,
          transitionDuration: const Duration(milliseconds: 250),
          transitionsBuilder: (_, animation, __, child) =>
              FadeTransition(opacity: animation, child: child),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF2C2C2E),
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.white54,
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) => _onItemTapped(context, index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code_scanner),
          label: "Scan",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code),
          label: "Generate",
        ),
      ],
    );
  }
}
