import 'dart:async';

import 'package:car_app/widgets/car_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BackWardCarousel extends ConsumerStatefulWidget {
  const BackWardCarousel({super.key});

  @override
  ConsumerState<BackWardCarousel> createState() => _BackWardCarouselState();
}

class _BackWardCarouselState extends ConsumerState<BackWardCarousel> {
  ValueNotifier<int> activePage = ValueNotifier<int>(0);
  int nextIndex = 0;
  int previousIndex = 0;

  late PageController _controller;

  dynamic animator;
  @override
  void initState() {
    super.initState();
    //controller for page view
    _controller = PageController(
      viewportFraction: 0.5,
      initialPage: 0,
    );

    // move cards every 5 seconds
    animator =
        Timer.periodic(const Duration(milliseconds: 1500), (Timer t) async {
      _controller.animateToPage(nextIndex,
          duration: const Duration(seconds: 1), curve: Curves.ease);
      nextIndex++;

      //reset view to first card after last view
      if (nextIndex == 6) {
        nextIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: PageView.builder(
          physics: const ClampingScrollPhysics(),
          reverse: true,
          controller: _controller,
          clipBehavior: Clip.hardEdge,
          itemCount: 6,
          itemBuilder: ((context, index) {
            return const CarCard(
              image: "lib/assets/images/car1.png",
            );
          })),
    );
  }
}
