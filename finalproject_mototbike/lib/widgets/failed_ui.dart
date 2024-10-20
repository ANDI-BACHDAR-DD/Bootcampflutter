import 'package:flutter/material.dart';

class FailedUi extends StatelessWidget {
  const FailedUi({super.key, required this.massage});
  final String massage;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(16),
        ),
        alignment: Alignment.center,
        child: Text(
          massage,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.grey[400]),
        ),
      ),
    );
  }
}
