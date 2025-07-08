import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQR extends StatefulWidget {
  const ScanQR({super.key});

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  String qrResult = "Scanned data will appear here";
  bool scanned = false;

  MobileScannerController controller = MobileScannerController();

  void _handleDetection(BarcodeCapture capture) {
    if (scanned) return;

    final List<Barcode> barcodes = capture.barcodes;
    for (final barcode in barcodes) {
      final String? code = barcode.rawValue;
      if (code != null) {
        setState(() {
          qrResult = code;
          scanned = true;
        });
        controller.stop(); // Stop scanning after successful read
        break;
      }
    }
  }

  void _restartScan() {
    setState(() {
      qrResult = "Scanning restarted...";
      scanned = false;
    });
    controller.start(); // Restart scanning
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code Scanner"),
        backgroundColor: Colors.blueGrey,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: MobileScanner(
              controller: controller,
              onDetect: _handleDetection,
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  qrResult,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _restartScan,
                  child: const Text("Scan Again"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
