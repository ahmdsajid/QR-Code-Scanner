import 'package:flutter/material.dart';
import 'package:qr_code/myhome.dart';

class Splashscreeen extends StatelessWidget {
  const Splashscreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
              top: -150,
              right: -100,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    shape: BoxShape.circle),
              )),
          Column(
            children: [
              //top qr section
              const Expanded(
                  flex: 2,
                  child: Center(
                    child: Icon(
                      Icons.qr_code_2,
                      color: Colors.white,
                      size: 160,
                    ),
                  )),
              //bottom white section
              Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Get Started",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            "Your all-in-one solution for scanning and generating qr code- easy, fast and secure",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.black87, fontSize: 14),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),

                        //circuler button
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const Myhome()));
                            },
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(18),
                                backgroundColor: Colors.amber[700],
                                elevation: 6),
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            ))
                      ],
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
