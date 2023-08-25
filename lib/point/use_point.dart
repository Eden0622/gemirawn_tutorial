import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemirawn_tutorial/config/constants.dart';
import 'package:gemirawn_tutorial/home/home.dart';
import 'package:gemirawn_tutorial/point/point_log.dart';

class UsePoint extends StatefulWidget {
  const UsePoint({super.key});

  @override
  State<UsePoint> createState() => _UsePointState();
}

class _UsePointState extends State<UsePoint> {
  final List<String> tapList = ['전체', '적립', '사용'];
  int _selectMenuIndex = 0;

  void _selectMenu(int menuIndex) {
    setState(() {
      _selectMenuIndex = menuIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '포인트 적립/사용 내역',
          style: TextStyle(color: blackColor, fontSize: 18, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icon/appbar_prev_icon.svg'),
          color: blackColor,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.all(16),
            decoration: MyBoxDecoration.myBoxDecoration(color: Colors.white, borderColor: color3),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '총 보유 포인트',
                  style: TextStyle(color: blackColor, fontSize: 16, fontWeight: FontWeight.w700),
                ),
                Text(
                  '32,000 P',
                  style: TextStyle(color: primaryColor, fontSize: 22, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _menuStyle(String text, bool isSelected) {
  return Text(
    text,
    style: TextStyle(fontSize: 16, fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500, color: isSelected ? blackColor : color1),
  );
}
