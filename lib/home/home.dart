import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gemirawn_tutorial/home/drawer_menu.dart';
import 'package:gemirawn_tutorial/home/redeem_point.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSavePoint = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: SvgPicture.asset('assets/icon/home_logo.svg'),
            iconTheme: IconThemeData(color: Color(0xff888888)),
            centerTitle: true,
          ),
          drawer: DrawerMenu(),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffeeeeee)),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [BoxShadow(blurRadius: 8, offset: Offset(0, 4), color: Color(0xffeeeeee))]),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '최승연님의 포인트',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                          ),
                          IconButton(onPressed: () {}, icon: Icon(Icons.refresh))
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '32,000P',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Color(0xff52C6D8)),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.navigate_next),
                            style: IconButton.styleFrom(backgroundColor: Colors.red),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSavePoint = false;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '포인트 적립',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: !isSavePoint ? Colors.black : Color(0xffbbbbbb)),
                              ),
                              //if(!isSavePoint)
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        SvgPicture.asset('assets/icon/_.svg'),
                        SizedBox(width: 12),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSavePoint = true;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '포인트 사용',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: isSavePoint ? Colors.black : Color(0xffbbbbbb)),
                              ),
                              //if(isSavePoint)
                              //SizedBox(height: 16,),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    if (!isSavePoint)
                      Container(
                        padding: EdgeInsets.only(left: 85, right: 88, top: 20, bottom: 20),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffeeeeee)),
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            boxShadow: [BoxShadow(blurRadius: 8, offset: Offset(0, 4), color: Color(0xffeeeeee))]),
                        child: Image.asset('assets/images/QR.png'),
                      ),
                    if (isSavePoint)
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffeeeeee)),
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            boxShadow: [BoxShadow(blurRadius: 8, offset: Offset(0, 4), color: Color(0xffeeeeee))]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('사용 포인트',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),),
                                //IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/icon/Group 77.svg'), iconSize: 50,)
                                ElevatedButton(
                                    onPressed: (){},
                                    child: Text('전액사용',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Color(0xffeeeeee),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      )
                                  ),
                                )
                              ],
                            ),

                            TextField(
                                decoration: InputDecoration(
                              hintText: '사용할 포인트를 입력해 주세요',
                              hintStyle: TextStyle(color: Color(0xffbbbbbb), fontSize: 14, fontWeight: FontWeight.w400),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffeeeeee)), borderRadius: BorderRadius.all(Radius.circular(12.0))),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffeeeeee)), borderRadius: BorderRadius.all(Radius.circular(12.0))),
                            )),
                            SizedBox(height: 12,),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => RedeemPoint()));
                                },
                                child: Text(
                                  '사용하기',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                                ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.only(left: 142, right: 142, top: 10, bottom: 10),
                                  elevation: 0,
                                  backgroundColor: Color(0xff52C6D8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  )
                              ),
                            ),
                            SizedBox(height: 24,),
                            Text('사용방법',),
                            Row(
                              children: [
                                Icon(Icons.circle_rounded,
                                color: Color(0xff888888),
                                size: 3,),
                                Text(
                                  ' 포인트는 1,000단위로 사용 가능합니다.',
                                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Color(0xff888888), letterSpacing: 0.5),
                                )
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.circle_rounded,color: Color(0xff888888),
                                  size: 3,),
                                Text(
                                  ' 포인트 사용 후, 새로고침을 누르면 차감된 포인트가 적용됩니다.',
                                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Color(0xff888888), letterSpacing: 0.5),
                                )
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.circle_rounded, color: Color(0xff888888),
                                  size: 3,),
                                Text(
                                  ' 포인트는 타인에게 양도될 수 없으며, 본인 외에는 사용할 수 없습니다.',
                                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Color(0xff888888), letterSpacing: 0.5),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
