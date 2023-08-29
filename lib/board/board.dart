import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemirawn_tutorial/board/board_list.dart';
import 'package:gemirawn_tutorial/data/models/notice.dart';

import '../config/constants.dart';
import '../home/home.dart';

class Board extends StatefulWidget {
  const Board({super.key});

  List<Notice> get boardList => noticeList;

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < noticeList.length; i++) {
      final Notice notice = noticeList[i];
      const SizedBox(height: 16);
      /*if(i % 2 == 0) {

      } else if(i % 2 == 1) {

      }*/
    }
  }

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
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: noticeList.length,
                  itemBuilder: (context, index) {
                    return BoardList(
                      notice: noticeList[index],
                    );
                  }),
            ),
          ],
        ));
  }
}
