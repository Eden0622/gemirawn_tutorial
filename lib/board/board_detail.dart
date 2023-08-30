import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemirawn_tutorial/board/board.dart';
import 'package:gemirawn_tutorial/data/models/notice.dart';
import 'package:intl/intl.dart';

import '../config/constants.dart';
import '../data/models/notice.dart';

class BoardView extends StatelessWidget {
  const BoardView({super.key, required this.notice});

  final Notice notice;

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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      notice.store,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: color1),
                    ),
                    Text(DateFormat('yyyy.MM.dd').format(notice.date), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: color1))
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  notice.notice_title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: blackColor),
                ),
                const SizedBox(height: 16),
                Text(notice.notice_content),
                if (notice.imageUrl != null && noticeList.indexOf(notice) % 2 == 0)
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 24),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(notice.imageUrl!),
                          ),
                          const SizedBox(height: 24),
                          const Divider(
                            thickness: 1,
                            height: 1,
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                elevation: 0,
                                side: const BorderSide(color: primaryColor),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                              ),
                              minimumSize: const Size(double.infinity, 48),
                              alignment: Alignment.centerLeft
                            ),
                            child: const Text(
                              '공지사항 관련 자료.JPG',
                              style: TextStyle(color: primaryColor, fontSize: 14, fontWeight: FontWeight.w500),
                            ),

                          )
                        ],
                      ))
              ],
            ),
          ),
        ));
  }
}
