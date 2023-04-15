import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage(this.startQuiz, {super.key});
  void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
                  padding: EdgeInsets.all(30),
                  child: Image(
                    width: 500,
                    image: AssetImage('assetImages/quiz-logo.png'),
                  ))
              .animate(
                  onPlay: (controller) => controller.repeat(), delay: 500.ms)
              .fade(duration: 5000.ms),
          Text(
            'Learn Flutter in fun Way !',
            style: GoogleFonts.aBeeZee(
                color: const Color.fromARGB(255, 250, 182, 224),
                fontSize: 30,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: OutlinedButton.icon(
                onPressed: startQuiz,
                icon: Animate(
                    effects: [
                      ShakeEffect(
                          duration: 10.minutes,
                          rotation: 0.2,
                          curve: Curves.bounceIn)
                    ],
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )),
                label: const Text(
                  'Start Quiz',
                  style: TextStyle(color: Colors.white),
                )
                    .animate(
                        onPlay: (controller) => controller.repeat(),
                        delay: 1000.ms)
                    .fadeIn(duration: 500.ms)),
          ),
        ],
      ),
    );
  }
}
