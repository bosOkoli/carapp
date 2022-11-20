import 'package:car_app/widgets/backward_carousel.dart';
import 'package:car_app/widgets/forward_carousel.dart';
import 'package:car_app/widgets/rotating_carousel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
        child: Column(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Welcome Bosokoli 👋",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "Let's go for a drive!",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 50,
                    width: 50,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      Icons.person,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
            const ForwardCarousel(),
            const SizedBox(
              height: 5,
            ),
            const BackWardCarousel(),
            const Expanded(child: RotatingCarCarousel()),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              label: "home",
              icon: Icon(
                Icons.home_rounded,
              ),
            ),
            BottomNavigationBarItem(
              label: "Compass",
              icon: Icon(
                Icons.compass_calibration,
              ),
            ),
            BottomNavigationBarItem(
              label: "Car Repair",
              icon: Icon(
                Icons.car_repair,
              ),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(
                Icons.person,
              ),
            )
          ]),
    );
  }
}
