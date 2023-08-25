import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../point/use_point.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset('assets/icon/drawer_logo.svg'),
              IconButton(onPressed: () {},
                  icon: SvgPicture.asset('assets/icon/logout_icon.svg'))
            ],
          ),
          const Row(
            children: [
              Text('최승연', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),),
              Text(' 님', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffeeeeee)),
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [const BoxShadow(blurRadius: 8, offset: Offset(0, 4), color: Color(0xffeeeeee))]),
            child: const Column(
              children: [
                Text(
                  '최승연님의 포인트',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  '32,000 P',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Color(0xff52C6D8)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Divider(color: Colors.grey.withOpacity(0.6), height: 1,),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icon/Frame 1614.svg'),
                  const SizedBox(width: 8),
                  const Expanded(child: Text('내 정보 수정')),
                  const Icon(Icons.navigate_next, color: Colors.grey),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UsePoint()));
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icon/point_icon.svg'),
                  const SizedBox(width: 8),
                  const Expanded(child: Text('포인트 적립/사용 내역')),
                  const Icon(Icons.navigate_next, color: Colors.grey),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icon/notifications_active_FILL0_wght300_GRAD0_opsz24 1.svg'),
                  const SizedBox(width: 8),
                  const Expanded(child: Text('공지사항')),
                  const Icon(Icons.navigate_next, color: Colors.grey),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
