import 'package:flutter/material.dart';
import 'package:gemirawn_tutorial/board/board_view.dart';
import 'package:gemirawn_tutorial/config/constants.dart';
import 'package:intl/intl.dart';

import '../data/models/notice.dart';

class BoardList extends StatelessWidget {
  const BoardList({super.key, required this.notice});

  final Notice notice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const BoardView()));
        },
        child: Container(
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            shadows: [
              BoxShadow(
                color: const Color(0x26121212).withOpacity(0.2),
                blurRadius: 5,
                offset: const Offset(0, 2),
                spreadRadius: 1,
              )
            ],
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8)
                  )
                ),
                child: Text('${notice.notice_title}',
                  style: const TextStyle( fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),),
                //decoration: ,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: Text('${notice.notice_content}',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
              ),
              const Divider(height: 2, indent: 16, endIndent: 16, color: Color(0xFFefefef),thickness: 1,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8)
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${notice.store}',
                      style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500, color: color1
                    ),),
                    Text(
                        DateFormat('yyyy.MM.dd').format(notice.date),
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w500, color: color1)
                    )
                  ],
                ),
              ),
              //SizedBox(height: 16,),
            ],
          ),
        ),
      ),
    );
  }
}