import 'dart:convert';
//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemirawn_tutorial/onboarding/character_search.dart';

//import 'package:gemirawn_tutorial/onboarding/children_info.dart';
import 'package:gemirawn_tutorial/onboarding/market_search.dart';
import 'package:gemirawn_tutorial/onboarding/terms_of_service.dart';

import 'package:http/http.dart' as http;
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:kpostal/kpostal.dart';

class Join extends StatefulWidget {
  const Join({super.key});

  @override
  State<Join> createState() => _JoinState();
}

enum Gender { man, women }

class _JoinState extends State<Join> {
  List<String> selectedCategory = [];
  String a = 'category1';
  String b = 'category2';

  int _counter = 0;
  var _isChecked = false;
  Gender _gender = Gender.man;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  List<dynamic> list = [];

  @override
  Widget build(BuildContext context) {
    bool isSelected;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '회원가입',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          //icon: Icon(Icons.navigate_before),
          icon: SvgPicture.asset('assets/icon/appbar_prev_icon.svg'),
          color: Colors.black,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TermsOfService()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffeeeeee)),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [BoxShadow(blurRadius: 8, offset: Offset(0, 4), color: Color(0xffeeeeee))]),
                  //width: ,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('내 정보', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text('이름', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                        hintText: '홍길동',
                                        hintStyle: TextStyle(color: Color(0xffbbbbbb), fontSize: 14, fontWeight: FontWeight.w400),
                                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffeeeeee)), borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffeeeeee)), borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                        filled: true,
                                        fillColor: Color(0xffeeeeee)),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            //전화번호
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('전화번호', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        hintText: '000-0000-0000',
                                        hintStyle: TextStyle(color: Color(0xffbbbbbb), fontSize: 14, fontWeight: FontWeight.w400),
                                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffeeeeee)), borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffeeeeee)), borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                        filled: true,
                                        fillColor: Color(0xffeeeeee)),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            //생년월일
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '생년월일',
                                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                                      ),
                                      Text('*', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.red)),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                      decoration: InputDecoration(
                                    hintText: '본인의 생년월일을 입력해주세요',
                                    hintStyle: TextStyle(color: Color(0xffbbbbbb), fontSize: 14, fontWeight: FontWeight.w400),
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffeeeeee)), borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffeeeeee)), borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                  ))
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            //성별
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      Text(
                                        '성별',
                                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                                      ),
                                      Text('*', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.red)),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.only(left: 78, right: 78, top: 15, bottom: 15),
                                              backgroundColor: Color(0xff52C6D8),
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12),
                                              )),
                                          onPressed: () {},
                                          child: Text(
                                            '남',
                                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                                          )),
                                      //const SizedBox(width: 8),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.only(left: 78, right: 78, top: 15, bottom: 15),
                                            backgroundColor: Colors.white,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: Color(0xffe1e1e1))),
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            '여',
                                            style: TextStyle(color: Color(0xffbbbbbb), fontWeight: FontWeight.w700),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      Text(
                                        '주소',
                                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                                      ),
                                      Text('*', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.red)),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: '주소를 검색해주세요',
                                          hintStyle: TextStyle(color: Color(0xffbbbbbb), fontSize: 14, fontWeight: FontWeight.w400),
                                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffeeeeee)), borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffeeeeee)), borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                        ),
                                        controller: controller,
                                      )),
                                      const SizedBox(width: 8),
                                      ElevatedButton(
                                        onPressed: () async {
                                          await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => KpostalView(
                                                  callback: (Kpostal result) {
                                                    print(result.address);
                                                  },
                                                ),
                                              ));
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            elevation: 0,
                                            side: const BorderSide(color: Color(0xffeeeeee)),
                                            padding: EdgeInsets.all(18),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                                        child: Text(
                                          '주소검색',
                                          style: TextStyle(color: Colors.black, fontSize: 14),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                      decoration: InputDecoration(
                                    hintText: '상세주소를 입력해주세요',
                                    hintStyle: TextStyle(color: Color(0xffbbbbbb), fontSize: 14, fontWeight: FontWeight.w400),
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffeeeeee)), borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffeeeeee)), borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                  )),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('즐겨찾는 매장', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: '매장을 검색해주세요',
                                          hintStyle: TextStyle(color: Color(0xffbbbbbb), fontSize: 14, fontWeight: FontWeight.w400),
                                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffeeeeee)), borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffeeeeee)), borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                        ),
                                        controller: controller,
                                      )),
                                      const SizedBox(width: 8),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => MarketSearch()));
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              elevation: 0,
                                              side: BorderSide(color: Color(0xffeeeeee)),
                                              padding: EdgeInsets.all(18),
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                                          child: Text(
                                            '매장검색',
                                            style: TextStyle(color: Colors.black, fontSize: 14),
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xffeeeeee)),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(blurRadius: 8, offset: Offset(0, 4), color: Color(0xffeeeeee))]),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      //key: formKey,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('자녀 정보1',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                                    IconButton(
                                        icon: SvgPicture.asset('assets/icon/cancel_icon.svg'),
                                      onPressed: (){},
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('성별', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.only(left: 78, right: 78, top: 15, bottom: 15),
                                            backgroundColor: Color(0xff52C6D8),
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12),
                                            )),
                                        onPressed: () {},
                                        child: Text(
                                          '남',
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                                        )),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.only(left: 78, right: 78, top: 15, bottom: 15),
                                          backgroundColor: Colors.white,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: Color(0xffe1e1e1))),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          '여',
                                          style: TextStyle(color: Color(0xffbbbbbb), fontWeight: FontWeight.w700),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '생년월일',
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 8),
                                TextFormField(
                                    decoration: InputDecoration(
                                  hintText: '자녀의 생년월일을 입력해주세요',
                                  hintStyle: TextStyle(color: Color(0xffbbbbbb), fontSize: 14, fontWeight: FontWeight.w400),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffeeeeee)), borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffeeeeee)), borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                ))
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('선호 캐릭터', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: '캐릭터를 검색해주세요',
                                        hintStyle: TextStyle(color: Color(0xffbbbbbb), fontSize: 14, fontWeight: FontWeight.w400),
                                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffeeeeee)), borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffeeeeee)), borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                      ),
                                      controller: controller,
                                    )),
                                    const SizedBox(width: 8),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => CharacterSearch()));
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            elevation: 0,
                                            side: BorderSide(color: Color(0xffeeeeee)),
                                            padding: EdgeInsets.all(18),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                                        child: Text(
                                          '캐릭터검색',
                                          style: TextStyle(color: Colors.black, fontSize: 14),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          /*Expanded(
                            child: ListView(
                              children: _items.map((info) => _buildItemWidget(info)).toList(),
                            ),
                        )*/
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: Colors.white),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icon/add_icon.svg'),
                        Text(
                          '자녀 정보 추가',
                          style: TextStyle(color: Color(0xff52C6D8), fontSize: 12),
                        ),
                      ],
                    )),
                const SizedBox(height: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff52C6D8),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      )),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(right: 140, left: 140, top: 16, bottom: 15),
                    child: Text(
                      '회원가입',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
