import 'package:flutter/material.dart';

class AnimacionCerveza extends StatefulWidget {
  @override
  _AnimacionCervezaPageState createState() => _AnimacionCervezaPageState();
}

class _AnimacionCervezaPageState extends State<AnimacionCerveza> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);
    
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return CustomPaint(
              size: Size(200, 300),
              painter: BeerPainter(_animation.value),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class BeerPainter extends CustomPainter {
  final double fillLevel;

  BeerPainter(this.fillLevel);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.brown;
    final beerPaint = Paint()..color = Colors.yellow[700]!..style = PaintingStyle.fill;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final roundedRect = RRect.fromRectAndRadius(rect, Radius.circular(20));
    canvas.drawRRect(roundedRect, paint);

    final beerRect = Rect.fromLTWH(0, size.height * (1 - fillLevel), size.width, size.height * fillLevel);
    final beerRoundedRect = RRect.fromRectAndRadius(beerRect, Radius.circular(20));
    canvas.drawRRect(beerRoundedRect, beerPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}