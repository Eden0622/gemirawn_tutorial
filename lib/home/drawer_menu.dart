import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('assets/icon/drawer_logo.svg'), IconButton(onPressed: () {}, icon: SvgPicture.asset('assets/icon/logout_icon.svg'))],
                ),
                Row(
                  children: [
                    Text('최승연', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),),
                    Text(' 님', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.only(top: 5, left: 15, right: 163),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffeeeeee)),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [BoxShadow(blurRadius: 8, offset: Offset(0, 4), color: Color(0xffeeeeee))]),
                  child: Column(
                    children: [
                      Text(
                        '최승연님의 포인트',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '32,000 P',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Color(0xff52C6D8)),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //SizedBox(height: 16),
          ListTile(
            leading: SvgPicture.asset('assets/icon/Frame 1614.svg'),
            title: Text('내 정보 수정'),
            onTap: () {},
            trailing: Icon(Icons.navigate_next),
          ),
          ListTile(
            leading: SvgPicture.asset('assets/icon/point_icon.svg'),
            title: Text('포인트 적립/사용 내역'),
            onTap: () {},
            trailing: Icon(Icons.navigate_next),
          ),
          ListTile(
            leading: SvgPicture.asset('assets/icon/notifications_active_FILL0_wght300_GRAD0_opsz24 1.svg'),
            title: Text('공지사항'),
            onTap: () {},
            trailing: Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }
}
