import 'package:flutter/material.dart';
import 'home_page.dart';
import 'second_page.dart';
import 'third_page.dart';
import 'product_page.dart';
import 'categories_page.dart';
import 'user_info_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    setState(() => _selectedIndex = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Widget _bottomItem(IconData icon, String label, int index) {
    final bool active = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onTabTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: active ? Colors.pink : Colors.grey,
            size: active ? 26 : 22,
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: active ? Colors.pink : Colors.grey,
              fontWeight: active ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(title: "Home"),
          ProductPage(),
          UserInfoPage(),
          CategoriesPage(),
          SecondPage(),
          ThirdPage(),
        ],
      ),

      bottomNavigationBar: SizedBox(
        height: 90,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // CURVED BACKGROUND BAR WITH NOTCH
            CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 90),
              painter: BottomNavPainter(),
            ),

            // ITEMS INSIDE BAR
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _bottomItem(Icons.home, "Home", 0),
                  _bottomItem(Icons.production_quantity_limits, "Products", 1),

                  const SizedBox(width: 70),

                  _bottomItem(Icons.category, "categories", 3),
                  _bottomItem(Icons.more_horiz, "More", 4),
                ],
              ),
            ),

            // FLOATING BUTTON IN NOTCH
            Positioned(
              top: -20,
              left: MediaQuery.of(context).size.width / 2 - 33,
              child: GestureDetector(
                onTap: () => _onTabTapped(2),
                child: CircleAvatar(
                  radius: 33,
                  backgroundColor: _selectedIndex == 2
                      ? Colors.pink
                      : Colors.grey.shade300,
                  child: const Icon(
                    Icons.person,
                    size: 32,
                    color: Colors.white,
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

// ---------------------------------------------------
// CUSTOM PAINTER TO DRAW CURVED NOTCH
// ---------------------------------------------------
class BottomNavPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    double notchRadius = 40;
    double centerX = size.width / 2;

    path.moveTo(0, 20);
    path.lineTo(centerX - notchRadius - 10, 20);

    // Concave curve
    path.quadraticBezierTo(
      centerX - notchRadius,
      20,
      centerX - notchRadius + 10,
      5,
    );

    path.arcToPoint(
      Offset(centerX + notchRadius - 10, 5),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );

    path.quadraticBezierTo(
      centerX + notchRadius,
      20,
      centerX + notchRadius + 10,
      20,
    );

    path.lineTo(size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    // Background fill
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Draw shadow under curve
    canvas.drawShadow(path, Colors.black26, 8, true);

    // Draw shape
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
