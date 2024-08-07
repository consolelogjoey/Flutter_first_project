import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 60, 55),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            Text(
              "SUSHI MAN",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset("lib/images/sushi.png"),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "THE TASTE OF JAPANENSE FOOD",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 35,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "feel the taste of the most popular Japanense food from anywhere and anytime",
              style: TextStyle(
                color: Colors.grey[300],
                height: 2,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            MyButton(
              text: "Get Started",
              onTap: () {
                Navigator.pushNamed(context, '/loginpage');
              },
            )
          ],
        ),
      ),
    );
  }
}
