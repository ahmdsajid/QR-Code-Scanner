import 'package:flutter/material.dart';
import 'package:qr_code/widgets/bottom_nav.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQR extends StatefulWidget {
  const GenerateQR({super.key});

  @override
  State<GenerateQR> createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {
  TextEditingController urlcontroller = TextEditingController();
  String? qrData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E), // dark theme background
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'Generate QR Code',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1C1C1E),
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // QR Code Card
              if (qrData != null && qrData!.isNotEmpty) ...[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C2C2E),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.amber, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(),
                        blurRadius: 8,
                        offset: const Offset(2, 4),
                      ),
                    ],
                  ),
                  child: QrImageView(
                    data: qrData!,
                    size: 220,
                    backgroundColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),

                // Action Buttons (Save, Copy, Share)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildActionButton(Icons.save_alt, "Save"),
                    const SizedBox(width: 20),
                    _buildActionButton(Icons.copy, "Copy"),
                    const SizedBox(width: 20),
                    _buildActionButton(Icons.share, "Share"),
                  ],
                ),
                const SizedBox(height: 30),
              ],

              // Input Field
              TextField(
                controller: urlcontroller,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter your data",
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: const Color(0xFF2C2C2E),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Generate Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                ),
                onPressed: () {
                  setState(() {
                    qrData = urlcontroller.text;
                  });
                },
                child: const Text(
                  "Generate QR",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    bottomNavigationBar: BottomNav(currentIndex: 2),
    );
  }

  // Custom circular action button
  Widget _buildActionButton(IconData icon, String tooltip) {
    return CircleAvatar(
      radius: 28,
      backgroundColor: const Color(0xFF3A3A3C),
      child: IconButton(
        icon: Icon(icon, color: Colors.amber, size: 26),
        onPressed: () {
          // TODO: implement action (save/copy/share)
        },
        tooltip: tooltip,
      ),
    );
  }
}
