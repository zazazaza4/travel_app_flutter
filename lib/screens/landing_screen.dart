import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/screens/home_screen.dart';
import 'package:travel_app/widget/app_large_text.dart';
import 'package:travel_app/widget/app_text.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/home-bg.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black,
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeInLeft(
                delay: const Duration(milliseconds: 300),
                child: const DiscoverText(),
              ),
              FadeInRight(
                delay: const Duration(milliseconds: 400),
                child: const TravelInfoText(),
              ),
              const SizedBox(height: 12),
              SlideInUp(
                delay: const Duration(milliseconds: 500),
                child: const GoButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DiscoverText extends StatelessWidget {
  const DiscoverText({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppLargeText(
      text: "Discover world",
      size: 32,
    );
  }
}

class TravelInfoText extends StatelessWidget {
  const TravelInfoText({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppText(
      text:
          "Travel apps help users to research destinations, find good flight and accommodation deals, and book services.",
    );
  }
}

class GoButton extends StatelessWidget {
  const GoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        ),
        child: Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(30),
            ),
            border: Border(
              right: BorderSide(width: 2, color: Color(0xFF00BCC9)),
              left: BorderSide(width: 2, color: Color(0xFF00BCC9)),
              top: BorderSide(width: 4, color: Color(0xFF00BCC9)),
            ),
            color: Color(0xFF00BCC9),
          ),
          child: const Center(
            child: AppLargeText(
              text: "Go",
            ),
          ),
        ),
      ),
    );
  }
}
