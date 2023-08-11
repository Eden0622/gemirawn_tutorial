import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gemirawn_tutorial/onboarding/terms_of_service.dart';
import 'package:http/http.dart' as http;
import 'package:easy_rich_text/easy_rich_text.dart';

class Join extends StatefulWidget {
  const Join({super.key});

  @override
  State<Join> createState() => _JoinState();
}

class _JoinState extends State<Join> {
  final formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  List<dynamic> list = [];

  @override
  Widget build(BuildContext context) {
    bool isSelected;
    return Scaffold(
      backgroundColor: Colors.white,
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
          icon: Icon(Icons.navigate_before),
          color: Colors.black,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TermsOfService()));
          },
        ),
        backgroundColor: Colors.white,
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
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('내 정보', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('이름', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: '홍길동',
                                      hintStyle: TextStyle(color: Color(0xffbbbbbb), fontSize: 14, fontWeight: FontWeight.w400),
                                      //labelText: '이름',
                                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffeeeeee)), borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffeeeeee)), borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                      filled: true,
                                      fillColor: Color(0xffeeeeee)),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('전화번호', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
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
                          SizedBox(height: 20),
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
                          SizedBox(height: 20),
                          Container(
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '성별',
                                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                                    ),
                                    Text('*', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.red)),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
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
                                    ElevatedButton(
                                      onPressed: () {
                                        Map<String, String> params = {
                                          'confmKey': 'devU01TX0FVVEgyMDIzMDgxMDIxNDU1NzExNDAwODE=',
                                          'returnUrl': 'join.dart',
                                        };
                                        http
                                            .post(
                                          //주소
                                          Uri.parse('https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do'),
                                          body: params,
                                        )
                                            .then((response) {
                                          var json = jsonDecode(response.body);
                                          setState(() {
                                            list = json['results']['juso'];
                                          });
                                        }).catchError((onError) {});
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          elevation: 0,
                                          side: BorderSide(color: Color(0xffeeeeee)),
                                          padding: EdgeInsets.all(18),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                                      child: Text(
                                        '주소검색',
                                        style: TextStyle(color: Colors.black, fontSize: 14),
                                      ),
                                    )
                                  ],
                                ),
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
                          SizedBox(height: 20),
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
                                    ElevatedButton(
                                        onPressed: () {
                                          Map<String, String> params = {
                                            'confmKey': 'devU01TX0FVVEgyMDIzMDgxMDIxNDU1NzExNDAwODE=',
                                            'returnUrl': 'join.dart',
                                          };
                                          http
                                              .post(
                                            //주소
                                            Uri.parse('https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do'),
                                            body: params,
                                          )
                                              .then((response) {
                                            var json = jsonDecode(response.body);
                                            setState(() {
                                              list = json['results']['juso'];
                                            });
                                          }).catchError((onError) {});
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
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffeeeeee)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                      //key: formKey,
                      child: Column(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('자녀 정보', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('성별', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '생년월일',
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                            ),
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
                      SizedBox(height: 20),
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
                                ElevatedButton(
                                    onPressed: () {
                                      Map<String, String> params = {
                                        'confmKey': 'devU01TX0FVVEgyMDIzMDgxMDIxNDU1NzExNDAwODE=',
                                        'returnUrl': 'join.dart',
                                      };
                                      http
                                          .post(
                                        //주소
                                        Uri.parse('https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do'),
                                        body: params,
                                      )
                                          .then((response) {
                                        var json = jsonDecode(response.body);
                                        setState(() {
                                          list = json['results']['juso'];
                                        });
                                      }).catchError((onError) {});
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
                    ],
                  )),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
