import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gemirawn_tutorial/onboarding/terms_of_service.dart';
import 'package:http/http.dart' as http;

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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TermsOfService()));
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              '내 정보',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
            Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffeeeeee)),
                  borderRadius: BorderRadius.circular(12),
                  //color: Colors.white,
                  /*boxShadow: [
                      BoxShadow(
                          color: Color(0xffeeeeee), //.withOpacity(0.7),
                          blurRadius: 8,
                          offset: Offset(0, 4))
                    ]),*/
                ),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('이름',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffeeeeee)),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.0))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffeeeeee)),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.0))),
                              )),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('전화번호',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffeeeeee)),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.0))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffeeeeee)),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.0))),
                              )),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('생년월일*',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffeeeeee)),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.0))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffeeeeee)),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.0))),
                              )),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('성별',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('주소*',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: TextFormField(
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffeeeeee)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffeeeeee)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0))),
                                    ),
                                    controller: controller,
                                  )),
                                  ElevatedButton(
                                    onPressed: () {
                                      Map<String, String> params = {
                                        'confmKey':
                                            'devU01TX0FVVEgyMDIzMDgxMDIxNDU1NzExNDAwODE=',
                                        'returnUrl': 'join.dart',
                                      };
                                      http
                                          .post(
                                        //주소
                                        Uri.parse(
                                            'https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do'),
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
                                      side: BorderSide(
                                        color: Color(0xffeeeeee)
                                      ),
                                      padding: EdgeInsets.all(18),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12)
                                      )
                                    ),
                                    child: Text(
                                      '주소검색',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                  )
                                ],
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffeeeeee)),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.0))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffeeeeee)),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.0))),
                              )),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('즐겨찾는 매장',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: TextFormField(
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffeeeeee)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffeeeeee)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0))),
                                    ),
                                    controller: controller,
                                  )),
                                  ElevatedButton(
                                      onPressed: () {
                                        Map<String, String> params = {
                                          'confmKey':
                                              'devU01TX0FVVEgyMDIzMDgxMDIxNDU1NzExNDAwODE=',
                                          'returnUrl': 'join.dart',
                                        };
                                        http
                                            .post(
                                          //주소
                                          Uri.parse(
                                              'https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do'),
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
                                          side: BorderSide(
                                              color: Color(0xffeeeeee)
                                          ),
                                          padding: EdgeInsets.all(18),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12)
                                          )
                                      ),
                                      child: Text('매장검색',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 14),
                                      )
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            Container()
          ],
        ),
      ),
    );
  }
}
