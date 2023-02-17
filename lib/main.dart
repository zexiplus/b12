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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  AnimateWidget(
                    child: SizedBox(
                      width: 300,
                      height: 300,
                      child: Image.asset(
                        'assets/image/gray_gear.png',
                        colorBlendMode: BlendMode.dstATop,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 100,
                height: 300,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AnimateWidget(
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: GestureDetector(
                        child: Image.asset(
                          'assets/image/gray_gear.png',
                          colorBlendMode: BlendMode.dstATop,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/playlist');
                        },
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
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
      duration: Duration(seconds: 10),
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