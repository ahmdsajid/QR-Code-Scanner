import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQR extends StatefulWidget {
  const GenerateQR({super.key});

  @override
  State<GenerateQR> createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {
  TextEditingController urlcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        centerTitle: true,
        title: const Text('Generate QR Code', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        backgroundColor: Colors.blueGrey.shade900,
        ),
      
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(urlcontroller.text.isNotEmpty)
                QrImageView(data: urlcontroller.text, size: 200,),
                 const SizedBox(height: 40,),
                 Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    controller: urlcontroller,
                    decoration: InputDecoration(
                      hintText: "Enter your data",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                      labelText: "Enter your data"
                    ),
                  ),
                 ),
                 const SizedBox(height: 10,),
                 ElevatedButton(onPressed: (){setState(() {
                   
                 });}, child: const Text('Generate QR code'))
            ],),
          ),
        ),
      ),
    );
  }
}