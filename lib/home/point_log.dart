import 'package:flutter/material.dart';

import '../config/constants.dart';

class PointLog extends StatelessWidget {
  const PointLog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: color3)),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                '매장이름 + 사유',
                style: TextStyle(color: blackColor, fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 4),
              Text(
                '2022.11.08 00:00',
                style: TextStyle(color: color1, fontSize: 12, fontWeight: FontWeight.w400),
              )
            ],
          ),
          Text(
            '+100p',
            style: TextStyle(color: primaryColor, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
