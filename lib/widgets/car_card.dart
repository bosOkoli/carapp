import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CarCard extends ConsumerStatefulWidget {
  const CarCard({super.key, this.image = ""});

  @override
  ConsumerState<CarCard> createState() => _CarCardState();

  final String image;
}

class _CarCardState extends ConsumerState<CarCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      clipBehavior: Clip.hardEdge,
      child: Image.asset(
        widget.image,
        width: 150,
        height: 170,
        fit: BoxFit.cover,
      ),
    );
  }
}
