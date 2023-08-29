import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemirawn_tutorial/board/board_list.dart';
import 'package:gemirawn_tutorial/data/models/notice.dart';

import '../config/constants.dart';
import '../home/home.dart';

class Board extends StatelessWidget {
  const Board({super.key});

  List<Notice> get boardList => noticeList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('공지사항', style: TextStyle(color: blackColor, fontSize: 18, fontWeight: FontWeight.w700)),
          centerTitle: true,
          leading: IconButton(
            icon: SvgPicture.asset('assets/icon/appbar_prev_icon.svg'),
            color: blackColor,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
            },
          ),
        ),
        body: ListView.builder(
            itemCount: noticeList.length,
            itemBuilder: (context, index) {
              return BoardList(
                notice: noticeList[index],
              );
            }));
  }
}
