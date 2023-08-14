import 'package:flutter/material.dart';

class SecondSplashScreen extends StatelessWidget {
  const SecondSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              
              decoration: const  BoxDecoration(
                color: Colors.amber,
                // image: DecorationImage(image: AssetImage('asset/edited.jpg',),fit: BoxFit.cover)
              ),
            )
          ],
        ),
      ),
    );
  }
}