import 'package:flutter/material.dart';
import 'package:gemirawn_tutorial/data/models/point.dart';
import 'package:intl/intl.dart';

import '../config/constants.dart';

class PointLog extends StatelessWidget {
  PointLog({super.key, required this.point});

  final Point point;

  @override
  Widget build(BuildContext context) {
    final bool isSave = point.type == Point.typeSave;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: color3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                '${point.storeName} (${point.reason})',
                style: const TextStyle(color: blackColor, fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 4),
              Text(
                DateFormat('yyyy.MM.dd HH:mm').format(point.createDAT),
                style: const TextStyle(color: color1, fontSize: 12, fontWeight: FontWeight.w400),
              )
            ],
          ),
          Text(
            '${isSave ? '+' : '-'}${point.point}',
            style: TextStyle(
                color:  isSave ? primaryColor : errorColor,
                fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
