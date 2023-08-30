import 'package:flutter/material.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gemirawn_tutorial/config/constants.dart';
import 'package:gemirawn_tutorial/main.dart';

import 'join.dart';

class TermsOfService extends StatefulWidget {
  const TermsOfService({super.key});

  @override
  State<TermsOfService> createState() => _TermsOfServiceState();
}

class _TermsOfServiceState extends State<TermsOfService> {
  bool _allChecked = false; //전체 동의 체크 여부
  bool _checked2 = false;
  bool _checked3 = false;
  bool _checked4 = false;

  void _updateAllChecked() {
    // 개별 체크박스들이 모두 선택되었는지 확인하여 전체 동의 체크 여부를 업데이트합니다.
    _allChecked = _checked2 && _checked3 && _checked4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('재미로운 약관동의'),
        elevation: 0,
        leading: IconButton(
          //icon: Icon(Icons.navigate_before),
          icon: SvgPicture.asset('assets/icon/appbar_prev_icon.svg'),
          color: Colors.black,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Loading()));
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                '안녕하세요!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
              EasyRichText(
                '재미로운 이용약관에 동의해주세요',
                defaultStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
                patternList: [
                  EasyRichTextPattern(
                      targetString: '재미로운',
                      style: const TextStyle(
                          color: primaryColor
                      )
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                decoration: BoxDecoration(border: Border.all(color: color3), borderRadius: BorderRadius.circular(12), color: Colors.white, boxShadow: const [
                  BoxShadow(
                      color: color3, //.withOpacity(0.7),
                      blurRadius: 8,
                      offset: Offset(0, 4))
                ]),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            value: _allChecked,
                            onChanged: (value) {
                              setState(() {
                                _allChecked = value!;
                                _checked2 = value;
                                _checked3 = value;
                                _checked4 = value;
                              });
                            }),
                        const Text(
                          '전체 동의',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: primaryColor
                          ),
                        ),
                      ],
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Checkbox(
                            value: _checked2,
                            onChanged: (value) {
                              setState(() {
                                _checked2 = value!;
                                _updateAllChecked();
                              });
                            }),
                        EasyRichText(
                          '이용약관 동의 (필수)',
                          defaultStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          patternList: [
                            EasyRichTextPattern(
                                targetString: '(필수)',
                                style: const TextStyle(
                                    color: primaryColor
                                )
                            )
                          ],
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: SvgPicture.asset('assets/icon/terms_icon.svg'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: _checked3,
                            onChanged: (value) {
                              setState(() {
                                _checked3 = value!;
                                _updateAllChecked();
                              });
                            }),
                        EasyRichText(
                          '개인정보 수집 및 이용동의 (필수)',
                          defaultStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          patternList: [
                            EasyRichTextPattern(
                                targetString: '(필수)',
                                style: const TextStyle(
                                    color: primaryColor
                                )
                            )
                          ],
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: SvgPicture.asset('assets/icon/terms_icon.svg'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: _checked4,
                            onChanged: (value) {
                              setState(() {
                                _checked4 = value!;
                                _updateAllChecked();
                              });
                            }),
                        const Text('이메일, SMS 마케팅 수신 동의 (선택)'),
                        IconButton(
                          onPressed: (){},
                          icon: SvgPicture.asset('assets/icon/terms_icon.svg'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 186,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _allChecked ? primaryColor : color1,
                  minimumSize: const Size.fromHeight(48),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Join()));
                },
                child: const Text(
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
