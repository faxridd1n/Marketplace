import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_application_1/core/constants/app_colors.dart';

class CustomThicknessIndicator extends StatefulWidget {
  @override
  _CustomThicknessIndicatorState createState() =>
      _CustomThicknessIndicatorState();
}

class _CustomThicknessIndicatorState extends State<CustomThicknessIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000), // Rotation duration
      vsync: this,
    )..repeat(); // Make it repeat indefinitely

    _rotation = Tween<double>(begin: 0, end: 2 * pi).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _rotation,
        builder: (context, child) {
          return CustomPaint(
            painter: ThicknessPainter(rotationAngle: _rotation.value),
            size: const Size(55, 55), // Size of the indicator
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class ThicknessPainter extends CustomPainter {
  final double rotationAngle;

  ThicknessPainter({required this.rotationAngle});

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = AppColors.green; // Color of the progress indicator

    // Draw the arc from 0 to 360 degrees
    for (double angle = 0; angle < 2 * pi; angle += 0.01) {
      double currentAngleDegrees =
          angle * (180 / pi); // Convert radian to degree
      double thickness = 0;
      if(currentAngleDegrees<5||currentAngleDegrees>355) thickness=2.5;
      else if(currentAngleDegrees<10 ||currentAngleDegrees >350) thickness=2.6;

      else if(currentAngleDegrees<15 || currentAngleDegrees>345) thickness=2.7;
      
      else if(currentAngleDegrees<25 || currentAngleDegrees>335) thickness=2.85;
      // Increase thickness from 0 to 15 between 0 and 170 degrees
      else if (currentAngleDegrees < 160) {
        thickness = (currentAngleDegrees / 160) * 18; // From 0 to 15
      }
      // Keep thickness constant at 15 between 170 and 190 degrees
      else if (currentAngleDegrees >= 160 && currentAngleDegrees <= 200) {
        if(currentAngleDegrees<=165) thickness=17.82;
        else if(currentAngleDegrees<=170) thickness=17.86;
        else if(currentAngleDegrees<=175) thickness=17.9;
        else if(currentAngleDegrees>175&&currentAngleDegrees<185) thickness=17.95;
        else if(currentAngleDegrees<=190) thickness=17.9;
        else if(currentAngleDegrees<=195) thickness=17.86;
        else if(currentAngleDegrees<=200) thickness=17.82;
      }

      // Decrease thickness from 15 to 0 between 190 and 360 degrees
      else {
        double progress =
            (currentAngleDegrees - 200) / 160; // Normalize progress
        thickness = 18 * (1 - progress); // Decrease thickness from 15 to 0
      }

      paint.strokeWidth = thickness;

      // Apply rotation based on the animation's current angle
      canvas.drawArc(
        Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
        angle + rotationAngle, // Rotating the arc by `rotationAngle`
        0.01, // Small segments for smoother transition
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint continuously as the rotation angle changes
  }
}

class IndicatorPage extends StatefulWidget {
  const IndicatorPage({super.key});

  @override
  State<IndicatorPage> createState() => _IndicatorPageState();
}

class _IndicatorPageState extends State<IndicatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomThicknessIndicator(),
      ),
    );
  }
}
