import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DiagonalStripePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const stripeWidth = 5.0;
    const gap = 5.0;

    final paint = Paint()
      ..color = Colors.white.withOpacity(0.05)
      ..style = PaintingStyle.fill;

    final totalHeight = size.height;
    final cutoffX = size.width / 2;

    for (double i = -totalHeight; i < cutoffX; i += stripeWidth + gap) {
      final path = Path();
      path.moveTo(i, 0);
      path.lineTo(i + stripeWidth, 0);
      path.lineTo(i + stripeWidth + totalHeight, totalHeight);
      path.lineTo(i + totalHeight, totalHeight);
      path.close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class DiagonalStripePainterReversed extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const stripeWidth = 5.0;
    const gap = 5.0;

    final paint = Paint()
      ..color = Colors.white.withOpacity(0.05)
      ..style = PaintingStyle.fill;

    final totalHeight = size.height;
    final cutoffX = size.width / 2;

    for (
      double i = size.width + totalHeight;
      i > cutoffX;
      i -= stripeWidth + gap
    ) {
      final path = Path();
      path.moveTo(i, 0);
      path.lineTo(i - stripeWidth, 0);
      path.lineTo(i - stripeWidth - totalHeight, totalHeight);
      path.lineTo(i - totalHeight, totalHeight);
      path.close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: double.infinity,

      margin: EdgeInsets.symmetric(vertical: 2.h),
      // padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFFCBC850), Color(0xFF9BA340)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          // Diagonal lines
          Positioned.fill(child: CustomPaint(painter: DiagonalStripePainter())),
          Positioned.fill(
            child: CustomPaint(painter: DiagonalStripePainterReversed()),
          ),

          // Optional center glow
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  colors: [Colors.white10, Colors.transparent],
                  radius: 0.7,
                  center: Alignment.center,
                ),
              ),
            ),
          ),

          // Content Row
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Left Text
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome,',
                      style: TextStyle(fontSize: 12.sp, color: Colors.black87),
                    ),
                    SizedBox(height: 0.5.h),
                    Row(
                      children: [
                        Text(
                          'Mr. John Doe',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text('👏'),
                      ],
                    ),
                  ],
                ),

                // Right: Dart Image aligned bottom
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    'images/dart.png', // ✅ Path must be correct
                    height: 18.h, // ✅ Not too big, not too small
                    fit: BoxFit.contain, // ✅ Prevents distortion
                    filterQuality: FilterQuality.high, // ✅ Sharp rendering
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
