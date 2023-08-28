import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemirawn_tutorial/config/constants.dart';
import 'package:gemirawn_tutorial/data/models/point.dart';
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

  List<Point> savePointList = []; //적립 포인트 리스트
  List<Point> userPointList = []; //사용 포인트 리스트

  // _selectMenuIndex가 0일 때 전체 포인트 리스트를 가져오고 1일때는 적립 포인트 리스트, 둘 다 아니라면 사용포인트리스트를 가져온다
  List<Point> get pointList => _selectMenuIndex == 0
      ? dummyPointList
      : _selectMenuIndex == 1
          ? savePointList
          : userPointList;

  void _selectMenu(int menuIndex) {
    setState(() {
      _selectMenuIndex = menuIndex;
    });
  }

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < dummyPointList.length; i++) {
      final Point point = dummyPointList[i];

      if (point.type == Point.typeSave) {
        savePointList.add(point);
      } else if (point.type == Point.typeUse) {
        userPointList.add(point);
      }
    }
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: List.generate(
                      tapList.length, //tapList 길이만큼 
                      (index) => tabItem( // tapItem을 반환, 밑에는 tapItem안의 내용들
                            text: tapList[index], //[전체, 적립, 사용]
                            isSelect: _selectMenuIndex == index, // 선택된 인덱스 변수
                            isLast: tapList.length - 1 == index, // 인덱스 마지막의 전 인덱스
                            onTab: () => _selectMenu(index),
                          )),
                ),
              ],
            ),
          ),
          Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: ListView.builder(
                  itemCount: pointList.length, //포인트 리스트의 길이만큼
                    itemBuilder: (context, index) {
                      return PointLog(
                        point: pointList[index],
                      );
                    }
                ),
              )
          )
        ],
      ),
    );
  }
}

Row tabItem({required String text, required bool isSelect, required bool isLast, required GestureTapCallback onTab}) {
  Widget menuStyle(String text, bool isSelect) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, fontWeight: isSelect ? FontWeight.w700 : FontWeight.w500,
          color: isSelect ? blackColor : color1),
    );
  }
  return Row(
    children: [
      GestureDetector(
        onTap: onTab,
        child: menuStyle(text, isSelect),
      ),
      if (!isLast) ...[ // 파이프 아이콘을 마지막 아이템 전까지만 출력
        SizedBox(width: 12),
        SvgPicture.asset('assets/icon/_.svg'),
        SizedBox(width: 12),
      ],
    ],
  );
}
