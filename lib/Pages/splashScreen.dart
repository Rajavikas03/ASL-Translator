import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:translator_2/Pages/trans.dart';

class splash_Screen extends StatefulWidget {
  const splash_Screen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _splash_ScreenState createState() => _splash_ScreenState();
}

class _splash_ScreenState extends State<splash_Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 1,
      end: 2.5,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInExpo,
      ),
    );
    _controller.forward();
    Future.delayed(
      const Duration(seconds: 5),
      () => Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const transs(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: Tween<double>(
                  begin: 0.5,
                  end: 1.0,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.bounceIn,
                  ),
                ),
                child: child,
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: child,
            );
          },
          child: Image.asset(
            "assets/splashScreen/TransLogo.png",
            // height: 400,
          ),
        ),
      ),
    );
  }
}
