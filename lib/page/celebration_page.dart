import 'dart:math';
import 'package:flutter/material.dart';

class CelebrationPage extends StatefulWidget {
  const CelebrationPage({Key? key}) : super(key: key);

  @override
  State<CelebrationPage> createState() => _CelebrationPageState();
}

class _CelebrationPageState extends State<CelebrationPage>
    with TickerProviderStateMixin {
  late AnimationController _confettiController;
  late AnimationController _textController;
  late AnimationController _heartBeatController;
  late Animation<double> _textAnimation;
  late Animation<double> _heartBeatAnimation;

  @override
  void initState() {
    super.initState();

    _confettiController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();

    _textController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _heartBeatController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _textAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _textController, curve: Curves.elasticOut),
    );

    _heartBeatAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _heartBeatController, curve: Curves.easeInOut),
    );

    _textController.forward();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _textController.dispose();
    _heartBeatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFF9A9E),
              Color(0xFFFAD0C4),
              Color(0xFFFAD0C4),
              Color(0xFFFFD1FF),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Confetti animation
            AnimatedBuilder(
              animation: _confettiController,
              builder: (context, child) {
                return CustomPaint(
                  painter: ConfettiPainter(_confettiController.value),
                  size: Size.infinite,
                );
              },
            ),

            // Main content
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Animated heart
                        ScaleTransition(
                          scale: _textAnimation,
                          child: AnimatedBuilder(
                            animation: _heartBeatAnimation,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: _heartBeatAnimation.value,
                                child: Icon(
                                  Icons.favorite,
                                  size: 150,
                                  color: Colors.red.shade400,
                                ),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 40),

                        // Success message
                        ScaleTransition(
                          scale: _textAnimation,
                          child: Text(
                            'Yay! 🎉',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 56,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black.withOpacity(0.3),
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Romantic message
                        FadeTransition(
                          opacity: _textAnimation,
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'You\'ve Made Me\nThe Happiest Person! 💕',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFF6B9D),
                                    height: 1.3,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'I promise to make you smile every day,\nto support you in everything you do,\nand to love you with all my heart.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade700,
                                    height: 1.6,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 40),

                        // Emoji hearts
                        FadeTransition(
                          opacity: _textAnimation,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildEmojiHeart('💖'),
                              const SizedBox(width: 10),
                              _buildEmojiHeart('💝'),
                              const SizedBox(width: 10),
                              _buildEmojiHeart('💗'),
                              const SizedBox(width: 10),
                              _buildEmojiHeart('💓'),
                              const SizedBox(width: 10),
                              _buildEmojiHeart('💕'),
                            ],
                          ),
                        ),

                        const SizedBox(height: 40),

                        // Special date
                        FadeTransition(
                          opacity: _textAnimation,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Color(0xFFFF6B9D),
                                width: 2,
                              ),
                            ),
                            child: Text(
                              'This is the beginning of our beautiful story 📖',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFFFF6B9D),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmojiHeart(String emoji) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 500 + Random().nextInt(500)),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Text(
            emoji,
            style: TextStyle(fontSize: 32),
          ),
        );
      },
    );
  }
}

class ConfettiPainter extends CustomPainter {
  final double animationValue;

  ConfettiPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final random = Random(123); // Fixed seed for consistent confetti

    final colors = [
      Colors.red,
      Colors.pink,
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.orange,
      Colors.green,
    ];

    for (int i = 0; i < 100; i++) {
      final x = random.nextDouble() * size.width;
      final startY = -50 - random.nextDouble() * 100;
      final endY = size.height + 100;
      final y = startY + (endY - startY) * animationValue;

      final color = colors[random.nextInt(colors.length)];
      final paint = Paint()
        ..color = color.withOpacity(0.8)
        ..style = PaintingStyle.fill;

      final rotation = animationValue * 4 * pi + random.nextDouble() * 2 * pi;
      final size = 8 + random.nextDouble() * 8;

      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(rotation);

      // Draw confetti pieces (rectangles and circles)
      if (i % 2 == 0) {
        canvas.drawRect(
          Rect.fromCenter(center: Offset.zero, width: size, height: size * 2),
          paint,
        );
      } else {
        canvas.drawCircle(Offset.zero, size / 2, paint);
      }

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(ConfettiPainter oldDelegate) {
    return animationValue != oldDelegate.animationValue;
  }
}
