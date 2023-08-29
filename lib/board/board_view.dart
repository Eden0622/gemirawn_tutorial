import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemirawn_tutorial/board/board.dart';
import 'package:gemirawn_tutorial/data/models/notice.dart';
import 'package:intl/intl.dart';

import '../config/constants.dart';
//import '../data/models/notice.dart';
import 'board_list.dart';

class BoardView extends StatefulWidget {
  const BoardView({super.key, required this.notice});

 //final BoardList boardList;
  final Notice notice;

  @override
  State<BoardView> createState() => _BoardViewState();
}

class _BoardViewState extends State<BoardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset('assets/icon/appbar_prev_icon.svg'),
          color: blackColor,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Board()));
          },
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'store',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: color1),
                ),
                Text(
                    //DateFormat('yyyy.MM.dd').format(notice.date),
                  'date',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: color1))
              ],
            ),
            SizedBox(height: 16),
            Text(
              //'${notice.notice_title}',
              'title',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: blackColor),
            ),
            SizedBox(height: 16),
            Text(
                //'${notice.notice_content}'
              'content',
            ),
          ],
        ),
      ),
    );
  }
}
