import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF52C6D8);
const Color errorColor = Color(0xFFF54949);
const Color blackColor = Color(0xFF313131);
const Color color1 = Color(0xFFBBBBBB);
const Color color2 = Color(0xFFE1E1E1);
const Color color3 = Color(0xFFEEEEEE);
const Color color4 = Color(0xFF888888);
const Color color5 = Color(0xFF6B6B6B);

// 박스 데코레이션 클래스
class MyBoxDecoration {
  static BoxDecoration myBoxDecoration({Color? color, Color? borderColor}) {
    return BoxDecoration(
          border: Border.all(color: color3),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: const [BoxShadow(blurRadius: 8, offset: Offset(0, 4), color: color3)]
    );
  }
}
