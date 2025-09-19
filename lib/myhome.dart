import 'package:flutter/material.dart';
import 'package:qr_code/scan_qr.dart';
import 'package:qr_code/generate_qr.dart';

class Myhome extends StatelessWidget {
  const Myhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E), // dark theme background
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'QR Scanner & Generator',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1C1C1E),
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildHomeButton(
              context,
              icon: Icons.qr_code_scanner,
              label: "Scan QR",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ScanQR()),
              ),
            ),
            const SizedBox(height: 24),
            _buildHomeButton(
              context,
              icon: Icons.qr_code,
              label: "Generate QR",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const GenerateQR()),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation (consistent with other pages)
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF2C2C2E),
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white54,
        currentIndex: 1, // highlight "Home"
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: "Generate"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
        ],
      ),
    );
  }

  // Reusable button widget
  Widget _buildHomeButton(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF2C2C2E),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 8,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.amber, size: 28),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
