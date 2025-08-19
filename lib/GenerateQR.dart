import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQR extends StatefulWidget {
  const GenerateQR({super.key});

  @override
  State<GenerateQR> createState() => _GenerateQRState();
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

class _GenerateQRState extends State<GenerateQR> {
  TextEditingController urlcontroller = TextEditingController();
  String? qrdata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF1C1C1E),
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
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //qr code card
                if (qrdata != null && qrdata!.isNotEmpty) ...[
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Color(0xFF2C2C2E),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.amber, width: 2),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 8,
                              offset: Offset(2, 4))
                        ]),
                    child: QrImageView(
                      data: qrdata!,
                      size: 200,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 24,),

                  //action buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    _buildActionButton(Icons.save_alt, "SAVE"),
                    SizedBox(width: 20,),
                    _buildActionButton(Icons.copy, "COPY"),
                    SizedBox(width: 20,),
                    _buildActionButton(Icons.share, "SHARE")
                  ],)
                ]
              ],
            ),
          ),
        ));
  }
}
