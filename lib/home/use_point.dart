import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemirawn_tutorial/config/constants.dart';
import 'package:gemirawn_tutorial/home/home.dart';
import 'package:gemirawn_tutorial/home/point_log.dart';

class UsePoint extends StatefulWidget {
  const UsePoint({super.key});

  @override
  State<UsePoint> createState() => _UsePointState();
}

class _UsePointState extends State<UsePoint> {
  bool get _isAll => save && use;
  bool all = false;
  bool save = false;
  bool use = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            '포인트 적립/사용 내역',
            style: TextStyle(color: blackColor),
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
            Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    //margin: const EdgeInsets.symmetric(horizontal: 16),
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border: Border.all(color: color3),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        boxShadow: [const BoxShadow(blurRadius: 8, offset: Offset(0, 4), color: color3)]),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '총 보유 포인트',
                          style: TextStyle(color: blackColor, fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        Text('32,000 P', style: TextStyle(color: primaryColor, fontSize: 22, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (save == false && use == false) {
                                    all = !all;
                                    print(_isAll);
                                  }
                                });
                              },
                              child: Text(
                                '전체',
                                style: TextStyle(fontSize: 16, fontWeight: all ? FontWeight.w700 : FontWeight.w500, color: all ? blackColor : color1),
                              ),
                            ),
                            const SizedBox(width: 12),
                            SvgPicture.asset('assets/icon/_.svg'),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (all == false && use == false) {
                                    save = !save;
                                  }
                                });
                              },
                              child: Text(
                                '적립',
                                style: TextStyle(fontSize: 16, fontWeight: save ? FontWeight.w700 : FontWeight.w500, color: save ? blackColor : color1),
                              ),
                            ),
                            const SizedBox(width: 12),
                            SvgPicture.asset('assets/icon/_.svg'),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (all == false && save == false) {
                                    use = !use;
                                  }
                                });
                              },
                              child: Text(
                                '사용',
                                style: TextStyle(fontSize: 16, fontWeight: use ? FontWeight.w700 : FontWeight.w500, color: use ? blackColor : color1),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: [
                        PointLog(),
                        PointLog(),
                        PointLog(),
                        PointLog(),
                        PointLog(),
                        PointLog(),
                        PointLog(),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
