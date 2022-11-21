import 'dart:async';

import 'package:car_app/data/models/car_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RotatingCarCarousel extends ConsumerStatefulWidget {
  const RotatingCarCarousel({super.key});

  @override
  ConsumerState<RotatingCarCarousel> createState() =>
      _RotatingCarCarouselState();
}

class _RotatingCarCarouselState extends ConsumerState<RotatingCarCarousel>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late PageController _pageController;
  ValueNotifier<int> activePage = ValueNotifier<int>(0);
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
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.7);

    // move cards every 5 seconds
    animator = Timer.periodic(const Duration(seconds: 5), (Timer t) async {
      _pageController.animateToPage(nextIndex,
          duration: const Duration(seconds: 1), curve: Curves.ease);
      nextIndex++;

      //reset view to first card after last view
      if (nextIndex == carList.length) {
        nextIndex = 0;
        return;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                activePage.value = value;
              });
            },
            itemCount: carList.length,
            itemBuilder: (context, index) => AnimatedBuilder(
              animation: _animation,
              builder: ((context, child) {
                return RotationTransition(
                  turns: _animation,
                  child: Stack(children: [
                    Align(
                      alignment: const Alignment(-0.65, -0.5),
                      child: Container(
                          clipBehavior: Clip.hardEdge,
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(boxShadow: const [
                            BoxShadow(color: Colors.indigo, blurRadius: 15)
                          ], borderRadius: BorderRadius.circular(100)),
                          child: Image.asset(
                            carList[index].carCompany[3].image,
                            fit: BoxFit.cover,
                          )),
                    ),
                    Align(
                      alignment: const Alignment(0.65, 0.5),
                      child: Container(
                          clipBehavior: Clip.hardEdge,
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(boxShadow: const [
                            BoxShadow(color: Colors.white, blurRadius: 15)
                          ], borderRadius: BorderRadius.circular(100)),
                          child: Image.asset(
                            carList[index].carCompany[0].image,
                            fit: BoxFit.cover,
                          )),
                    ),
                    Align(
                      alignment: const Alignment(-0.65, 0.5),
                      child: Container(
                          clipBehavior: Clip.hardEdge,
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(boxShadow: const [
                            BoxShadow(color: Colors.blue, blurRadius: 15)
                          ], borderRadius: BorderRadius.circular(100)),
                          child: Image.asset(
                            carList[index].carCompany[2].image,
                            fit: BoxFit.fill,
                          )),
                    ),
                    Align(
                      alignment: const Alignment(0.65, -0.5),
                      child: Container(
                          clipBehavior: Clip.hardEdge,
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(boxShadow: const [
                            BoxShadow(color: Colors.black, blurRadius: 15)
                          ], borderRadius: BorderRadius.circular(100)),
                          child: Image.asset(
                            carList[index].carCompany[1].image,
                            fit: BoxFit.cover,
                          )),
                    )
                  ]),
                );
              }),
            ),
          ),
        ),
        Container(
          height: 30,
          width: 60,
          decoration: BoxDecoration(
              color: carList[activePage.value].color,
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                carList[activePage.value].name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
            ),
          ),
        )
      ],
    );
  }
}
