import 'package:flutter/material.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:gemirawn_tutorial/main.dart';

import 'join.dart';

class TermsOfService extends StatefulWidget {
  const TermsOfService({super.key});

  @override
  State<TermsOfService> createState() => _TermsOfServiceState();
}

class _TermsOfServiceState extends State<TermsOfService> {
  bool _isChecked = false;

  List<String> checkList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('재미로운 약관동의'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          color: Colors.black,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Loading()));
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                '안녕하세요!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
              EasyRichText(
                '재미로운 이용약관에 동의해주세요',
                defaultStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
                patternList: [
                  EasyRichTextPattern(
                      targetString: '재미로운',
                      style: TextStyle(
                          color: Color(0xff52C6D8)
                      )
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            }),
                        Text(
                          '전체 동의',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff52C6D8)
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            }),
                        EasyRichText(
                          '이용약관 동의 (필수)',
                          defaultStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          patternList: [
                            EasyRichTextPattern(
                                targetString: '(필수)',
                                style: TextStyle(
                                    color: Color(0xff52C6D8)
                                )
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            }),
                        EasyRichText(
                          '개인정보 수집 및 이용동의 (필수)',
                          defaultStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          patternList: [
                            EasyRichTextPattern(
                                targetString: '(필수)',
                                style: TextStyle(
                                    color: Color(0xff52C6D8)
                                )
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            }),
                        Text('이메일, SMS 마케팅 수신 동의 (선택)')
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(border: Border.all(color: Color(0xffeeeeee)), borderRadius: BorderRadius.circular(12), color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Color(0xffeeeeee), //.withOpacity(0.7),
                      blurRadius: 8,
                      offset: Offset(0, 4))
                ]),
              ),
              SizedBox(
                height: 186,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffbbbbbb),
                  minimumSize: Size.fromHeight(48),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Join()));
                },
                child: Text(
                  '다음',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
