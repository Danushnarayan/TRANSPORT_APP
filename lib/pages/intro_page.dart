import 'dart:math';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with SingleTickerProviderStateMixin {
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
                  const SizedBox(height: 10),
                  _buildAppTitle(),
                  const SizedBox(height: 30),
                  _buildLogo(screenSize),
                  const SizedBox(height: 20),
                  _buildTagline(),
                  const SizedBox(height: 30),
                  _buildRoleSelection(),
                  const SizedBox(height: 30),
                  _buildGetStartedButton(screenSize),
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
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      decoration: _boxDecoration(),
      child: const Text(
        "Rajalakshmi Engineering College",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
    );
  }

  Widget _buildAppTitle() {
    return const Text(
      "REC TRANSPORT 2.0",
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        shadows: [
          Shadow(blurRadius: 10, color: Colors.black54, offset: Offset(3, 3)),
        ],
      ),
    );
  }

  Widget _buildLogo(Size screenSize) {
    return Hero(
      tag: 'app_logo',
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 15,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'lib/images/img1.jpg',
            width: screenSize.width * 0.5,
            height: screenSize.height * 0.3,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: screenSize.width * 0.5,
                height: screenSize.height * 0.3,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.directions_bus,
                  size: 80,
                  color: Colors.white,
                ),
              );
            },
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
        fontSize: 22,
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
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepPurple : Colors.white,
          border: Border.all(color: Colors.deepPurple),
          borderRadius: BorderRadius.circular(10),
          boxShadow: isSelected ? [
            BoxShadow(
              color: Colors.deepPurple.withOpacity(0.4),
              blurRadius: 8,
              spreadRadius: 1,
              offset: Offset(0, 3),
            )
          ] : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              role,
              style: TextStyle(
                fontSize: 18,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Colors.white : Colors.deepPurple,
              ),
            ),
            if (isSelected) 
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(Icons.check_circle, color: Colors.white, size: 20),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildGetStartedButton(Size screenSize) {
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: screenSize.width * 0.6,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: _boxDecoration(
          color: selectedRole != null ? Colors.white : Colors.grey.shade400,
          borderRadius: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Get Started",
              style: TextStyle(
                color: selectedRole != null ? Colors.deepPurple : Colors.white70,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            Icon(
              Icons.arrow_forward_rounded,
              color: selectedRole != null ? Colors.deepPurple : Colors.white70,
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration({Color color = Colors.white, double borderRadius = 20}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(borderRadius),
      boxShadow: const [
        BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4)),
      ],
    );
  }
}

// SpacePainter optimized
class SpacePainter extends CustomPainter {
  final Random _random = Random(42); // Fixed seed for consistent pattern

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    
    // Draw stars
    paint.color = Colors.white.withOpacity(0.8);
    for (int i = 0; i < 50; i++) {
      final offset = Offset(_random.nextDouble() * size.width, _random.nextDouble() * size.height);
      canvas.drawCircle(offset, _random.nextDouble() * 2 + 1, paint);
    }

    // Define planets
    final planets = [
      _Planet(0.2, 0.2, 40, Colors.blue),
      _Planet(0.7, 0.2, 35, Colors.red),
      _Planet(0.1, 0.6, 45, Colors.green),
      _Planet(0.8, 0.7, 50, Colors.orange),
      _Planet(0.3, 0.8, 40, Colors.yellow),
    ];

    for (var planet in planets) {
      _drawPlanet(canvas, size, paint, planet);
    }

    // Draw a Saturn-style planet
    _drawPlanetWithRings(
      canvas, size, paint,
      _Planet(0.5, 0.5, 60, Colors.blue),
      ringThickness: 8,
      ringColor: Colors.white.withOpacity(0.6),
    );
  }

  void _drawPlanet(Canvas canvas, Size size, Paint paint, _Planet planet) {
    paint.color = planet.color;
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(planet.toOffset(size), planet.radius, paint);
  }

  void _drawPlanetWithRings(Canvas canvas, Size size, Paint paint, _Planet planet,
      {double ringThickness = 5, Color ringColor = Colors.white}) {
    _drawPlanet(canvas, size, paint, planet);
    paint
      ..color = ringColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = ringThickness;
    canvas.drawOval(
      Rect.fromCenter(
        center: planet.toOffset(size),
        width: planet.radius * 2.5,
        height: planet.radius * 0.5,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _Planet {
  final double x, y, radius;
  final Color color;

  _Planet(this.x, this.y, this.radius, this.color);

  Offset toOffset(Size size) => Offset(size.width * x, size.height * y);
}
