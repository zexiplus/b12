import 'package:flutter/material.dart';
import 'play_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          scaffoldBackgroundColor: Colors.black),
      title: 'b12',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/playlist': (context) => PlayListPage(),
      },
    );
  }
}

class B12Shape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromARGB(255, 244, 210, 49)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, 0);
    path.lineTo(size.width - 100, 0);
    path.lineTo(size.width - 100, 60);
    path.lineTo(size.width, 60);
    path.lineTo(size.width - 100, 180);
    path.lineTo(size.width - 100, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          CustomPaint(
            painter: B12Shape(),
            size: MediaQuery.of(context).size,
          ),
          AnimateWidget(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.width * 0.6,
              child: GestureDetector(
                child: Image.asset(
                  'assets/image/loading.jpeg',
                  colorBlendMode: BlendMode.dstATop,
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/playlist');
                },
              ),
            ),
          )
        ],
      )),
    );
  }
}

class AnimateWidget extends StatefulWidget {
  @override
  _AnimateWidgetState createState() => _AnimateWidgetState();

  final Widget child;
  AnimateWidget({required this.child});
}

class _AnimateWidgetState extends State<AnimateWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
        child: widget.child);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
