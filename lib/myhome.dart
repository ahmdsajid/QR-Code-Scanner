import 'package:flutter/material.dart';

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ElevatedButton(onPressed: () {}, child: Text('Scan QR Code',style: TextStyle(fontSize: 20,color: Colors.blue),)),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){}, child: Text('Build QR', style: TextStyle(fontSize: 20, color: Colors.blue),))
          ],
        ),
        
      ),
    );
  }
}
