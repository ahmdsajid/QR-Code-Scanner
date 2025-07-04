import 'package:flutter/material.dart';
import 'package:qr_code/GenerateQR.dart';
import 'package:qr_code/ScanQR.dart';

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
        centerTitle: true,
        title: const Text('QR Scanner & Generator', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Colors.blueGrey.shade900,
    Colors.blue.shade400,
    Colors.cyan.shade300,
  ],
)

        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ScanQR()));
                });
              }, 
                child: const Text('Scan QR',style: TextStyle(fontSize: 20,color: Colors.blue),)),
            const SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const GenerateQR()));
                });
              }, 
                child: const Text('Generate QR', style: TextStyle(fontSize: 20, color: Colors.blue),))
            ],
          ),
          
        ),
      ),
    );
  }
}
