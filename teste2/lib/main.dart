import 'package:flutter/material.dart';

void main() => runApp(MuscleAnimationApp());

class MuscleAnimationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MuscleAnimationScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MuscleAnimationScreen extends StatefulWidget {
  @override
  _MuscleAnimationScreenState createState() => _MuscleAnimationScreenState();
}

class _MuscleAnimationScreenState extends State<MuscleAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: -200).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xf340f0),
      body: Stack(
        children: [
          // Animação central
          Center(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (_, child) {
                return Transform.translate(
                  offset: Offset(0, _animation.value),
                  child: child,
                );
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFF133549),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.4),
                      blurRadius: 20,
                      spreadRadius: 5,
                    )
                  ],
                ),
              ),
            ),
          ),

          // Logo no canto superior esquerdo
          Positioned(
            top: 20,
            left: 20,
            child: Image.asset(
              'logo.png', // Substitua pelo seu caminho
              width: 150,
            ),
          ),
        ],
      ),
    );
  }
}
