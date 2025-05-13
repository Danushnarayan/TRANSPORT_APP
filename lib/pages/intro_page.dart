import 'dart:math';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with SingleTickerProviderStateMixin {
  String? selectedRole;
  final Logger logger = Logger();
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<double>(begin: 50.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.2, 0.8, curve: Curves.easeOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                colors: [Colors.deepPurple, Colors.indigo],
                radius: 1.5,
                center: Alignment(0.3, -0.2),
              ),
            ),
          ),

          // Celestial elements
          Positioned.fill(
            child: CustomPaint(
              painter: SpacePainter(),
            ),
          ),

          // Main Content
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Opacity(
                opacity: _fadeAnimation.value,
                child: Transform.translate(
                  offset: Offset(0, _slideAnimation.value),
                  child: child,
                ),
              );
            },
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildCollegeName(),
                  const SizedBox(height: 5),
                  _buildAppTitle(),
                  const SizedBox(height: 10),
                  _buildLogo(screenWidth, screenHeight),
                  const SizedBox(height: 8),
                  _buildTagline(),
                  const SizedBox(height: 16),
                  _buildRoleSelection(),
                  const SizedBox(height: 16),
                  _buildGetStartedButton(screenWidth),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCollegeName() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      decoration: _boxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'lib/images/rec.png',
            width: 16,
            height: 16,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.image_not_supported,
                color: Colors.red,
                size: 16,
              );
            },
          ),
          const SizedBox(width: 8),
          const Text(
            "Rajalakshmi Engineering College",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppTitle() {
    return const Text(
      "REC TRANSPORT 2.0",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        shadows: [
          Shadow(blurRadius: 10, color: Colors.black54, offset: Offset(3, 3)),
        ],
      ),
    );
  }

  Widget _buildLogo(double screenWidth, double screenHeight) {
    return Hero(
      tag: 'app_logo',
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            'lib/images/img1.jpg',
            width: screenWidth * 0.45,
            height: screenHeight * 0.25,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildTagline() {
    return const Text(
      "Hard Work and Discipline",
      style: TextStyle(
        color: Colors.white70,
        fontSize: 14,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildRoleSelection() {
    return Column(
      children: ["Student", "Admin", "Driver"]
          .map((role) => _roleButton(role))
          .toList(),
    );
  }

  Widget _roleButton(String role) {
    final isSelected = selectedRole == role;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRole = role;
          logger.d("Selected Role: $selectedRole");
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepPurple : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          role,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.white : Colors.deepPurple,
          ),
        ),
      ),
    );
  }

  Widget _buildGetStartedButton(double screenWidth) {
    return GestureDetector(
      onTap: selectedRole != null
          ? () {
              logger.d("Navigating with Role: $selectedRole");
              Navigator.pushNamed(
                context,
                '/login',
                arguments: selectedRole,
              );
            }
          : null,
      child: Container(
        width: screenWidth * 0.55,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: _boxDecoration(
          color: selectedRole != null ? Colors.white : Colors.grey.shade400,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Get Started",
              style: TextStyle(
                color:
                    selectedRole != null ? Colors.deepPurple : Colors.white70,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.arrow_forward_rounded,
              color: selectedRole != null ? Colors.deepPurple : Colors.white70,
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration(
      {Color color = Colors.white, double borderRadius = 16}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(borderRadius),
      boxShadow: const [
        BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 4)),
      ],
    );
  }
}

class SpacePainter extends CustomPainter {
  final Random _random = Random();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.8);
    for (int i = 0; i < 50; i++) {
      final offset = Offset(_random.nextDouble() * size.width,
          _random.nextDouble() * size.height);
      canvas.drawCircle(offset, _random.nextDouble() * 2 + 1, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
