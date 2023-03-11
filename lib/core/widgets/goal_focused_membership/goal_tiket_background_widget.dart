import 'package:flutter/material.dart';

class GoalTicketBackgroundWidget extends CustomClipper<Path> {
  GoalTicketBackgroundWidget({required this.holeRadius});
  final double holeRadius;

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width - (size.width - 60), size.height)
      ..arcToPoint(
        Offset(size.width - (size.width - 60) - holeRadius, size.height),
        clockwise: false,
        radius: const Radius.circular(1),
      )
      ..lineTo(0, size.height)
      ..lineTo(0, 60)
      ..arcToPoint(
        const Offset(0, 20),
        clockwise: false,
        radius: const Radius.circular(1),
      )
      ..lineTo(0, 0);
    path.lineTo(0.0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(GoalTicketBackgroundWidget oldClipper) => true;
}
