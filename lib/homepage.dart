import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late PageController _pageController;
  final int _currentPage = 1;
  int nextIndex = 1;
  dynamic animator;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000))
      ..repeat(reverse: false);

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInBack,
    );
    _pageController = PageController(initialPage: _currentPage);

    // move cards every 5 seconds
    animator = Timer.periodic(const Duration(seconds: 5), (Timer t) async {
      _pageController.animateToPage(nextIndex,
          duration: const Duration(seconds: 1), curve: Curves.ease);
      nextIndex++;

      //reset view to first card after last view
      if (nextIndex == 3) {
        nextIndex = 0;
        return;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: 3,
              itemBuilder: (context, index) => AnimatedBuilder(
                animation: _animation,
                builder: ((context, child) {
                  return RotationTransition(
                    turns: _animation,
                    child: Stack(children: [
                      Center(
                        child: CircleAvatar(
                          radius: 180,
                          backgroundColor: Colors.white.withOpacity(0),
                        ),
                      ),
                      const Align(
                        alignment: Alignment(-0.6, -0.3),
                        child: CircleAvatar(radius: 60),
                      ),
                      const Align(
                        alignment: Alignment(0.6, 0.3),
                        child: CircleAvatar(radius: 60),
                      ),
                      const Align(
                        alignment: Alignment(-0.001, 0.001),
                        child: Text(
                          "Fast Cars",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontFamily: "inter"),
                        ),
                      ),
                      const Align(
                        alignment: Alignment(-0.6, 0.3),
                        child: CircleAvatar(radius: 60),
                      ),
                      const Align(
                        alignment: Alignment(0.6, -0.3),
                        child: CircleAvatar(radius: 60),
                      )
                    ]),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
