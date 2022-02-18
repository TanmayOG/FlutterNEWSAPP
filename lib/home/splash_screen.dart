import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:newmo/home/Home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: Lottie.asset("assets/yoga.json"),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("News",
                    style: GoogleFonts.lato(
                        color: Colors.orange[700],
                        fontWeight: FontWeight.bold,
                        fontSize: 30)),
                Text("Mo",
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 30))
              ],
            ),
            SizedBox(
              height: 100,
              child: Lottie.asset("assets/loader.json"),
            ),
          ],
        ),
      ),
    );
  }
}
