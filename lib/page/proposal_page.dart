import 'dart:math';
import 'package:flutter/material.dart';
import 'package:b_green/page/celebration_page.dart';

class ProposalPage extends StatefulWidget {
  const ProposalPage({Key? key}) : super(key: key);

  @override
  State<ProposalPage> createState() => _ProposalPageState();
}

class _ProposalPageState extends State<ProposalPage>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _heartController;
  late Animation<double> _fadeAnimation;
  
  Offset _noButtonPosition = const Offset(0, 0);
  bool _showNoButton = true;
  int _noButtonTapCount = 0;
  
  final List<String> _noButtonTexts = [
    "No",
    "Are you sure?",
    "Really?",
    "Think again!",
    "Please? 🥺",
    "Last chance!",
  ];

  @override
  void initState() {
    super.initState();
    
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    
    _heartController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
    
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeIn),
    );
    
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _heartController.dispose();
    super.dispose();
  }

  void _moveNoButton() {
    final random = Random();
    setState(() {
      _noButtonTapCount++;
      if (_noButtonTapCount >= _noButtonTexts.length) {
        _showNoButton = false;
      } else {
        _noButtonPosition = Offset(
          random.nextDouble() * 200 - 100,
          random.nextDouble() * 200 - 100,
        );
      }
    });
  }

  void _onYesPressed() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const CelebrationPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFF6B9D),
              Color(0xFFC06C84),
              Color(0xFFF67280),
              Color(0xFFFF8E9E),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Animated floating hearts background
            AnimatedBuilder(
              animation: _heartController,
              builder: (context, child) {
                return CustomPaint(
                  painter: HeartsPainter(_heartController.value),
                  size: Size.infinite,
                );
              },
            ),
            
            // Main content
            SafeArea(
              child: Center(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Main heart icon
                        TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0.0, end: 1.0),
                          duration: const Duration(milliseconds: 800),
                          builder: (context, value, child) {
                            return Transform.scale(
                              scale: value,
                              child: Icon(
                                Icons.favorite,
                                size: 120,
                                color: Colors.white.withOpacity(0.9),
                              ),
                            );
                          },
                        ),
                        
                        const SizedBox(height: 40),
                        
                        // Proposal text
                        Text(
                          'Will You Be\nMy Girlfriend?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.3,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black.withOpacity(0.3),
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 20),
                        
                        // Sweet message
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 2,
                            ),
                          ),
                          child: Text(
                            'You make my heart skip a beat\nevery time I see you 💕',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              height: 1.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 60),
                        
                        // Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Yes button
                            ElevatedButton(
                              onPressed: _onYesPressed,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Color(0xFFFF6B9D),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 20,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 8,
                              ),
                              child: Text(
                                'Yes! 💖',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            
                            const SizedBox(width: 20),
                            
                            // No button (moves away)
                            if (_showNoButton)
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                                left: size.width / 2 + _noButtonPosition.dx,
                                top: size.height / 2 + _noButtonPosition.dy + 100,
                                child: OutlinedButton(
                                  onPressed: _moveNoButton,
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    side: BorderSide(color: Colors.white, width: 2),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 40,
                                      vertical: 20,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: Text(
                                    _noButtonTexts[min(_noButtonTapCount, _noButtonTexts.length - 1)],
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        
                        if (!_showNoButton)
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              'I knew you\'d say yes! 😊',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
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
}

class HeartsPainter extends CustomPainter {
  final double animationValue;
  
  HeartsPainter(this.animationValue);
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.fill;
    
    final random = Random(42); // Fixed seed for consistent positions
    
    for (int i = 0; i < 20; i++) {
      final x = random.nextDouble() * size.width;
      final baseY = random.nextDouble() * size.height;
      final y = (baseY + (animationValue * size.height * 0.5)) % (size.height + 100);
      final heartSize = 20 + random.nextDouble() * 30;
      
      _drawHeart(canvas, Offset(x, y), heartSize, paint);
    }
  }
  
  void _drawHeart(Canvas canvas, Offset position, double size, Paint paint) {
    final path = Path();
    
    path.moveTo(position.dx, position.dy + size * 0.3);
    
    path.cubicTo(
      position.dx - size * 0.5, position.dy - size * 0.3,
      position.dx - size, position.dy + size * 0.2,
      position.dx, position.dy + size,
    );
    
    path.cubicTo(
      position.dx + size, position.dy + size * 0.2,
      position.dx + size * 0.5, position.dy - size * 0.3,
      position.dx, position.dy + size * 0.3,
    );
    
    canvas.drawPath(path, paint);
  }
  
  @override
  bool shouldRepaint(HeartsPainter oldDelegate) {
    return animationValue != oldDelegate.animationValue;
  }
}
