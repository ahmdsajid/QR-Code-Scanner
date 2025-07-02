import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQR extends StatefulWidget {
  const ScanQR({super.key});

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  String qrResult = "Scanned data will appear here";

  Future<void> ScanQR()async{
    try{
      final qrCode = await FlutterBarcodeScanner.scanBarcode('#ff666', 'Cancel', true, ScanMode.QR);
      if(!mounted)return;
      setState(() {
        this.qrResult = qrResult.toString();
      });
    } on PlatformException{
      qrResult = 'Failed to read the QR';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code Scanner"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Text('$qrResult', style: TextStyle(color: Colors.black),),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: ScanQR, child: Text("Scan Code"))
          ],
        ),
      ),
    );
  }
}