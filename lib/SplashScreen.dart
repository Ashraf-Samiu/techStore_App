import 'package:flutter/material.dart';
import 'package:techstore_app/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value){
      Navigator.push(context, MaterialPageRoute(
          builder: (context)=>LogInScreen())
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/123.jpg",
              width: 100,
              height: 100,
            ),
            Text("Tech Store",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
