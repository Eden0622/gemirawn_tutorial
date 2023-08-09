import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'onboarding/terms_of_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Pretendard',
        primaryColor: Color(0xff52C6D8),
        scaffoldBackgroundColor: Color(0xff52C6D8),
      ),
      debugShowCheckedModeBanner: false,
      title: "재미로운",
      home: Loading(),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( '재미로운', style: TextStyle(fontSize: 0),
        ),
        elevation: 0,
        backgroundColor: Color(0xff52C6D8),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icon/logo_1.png'),
              SizedBox(
                height: 24,
              ),
              Text(
                '재미로운 일들이\n 가득한 하루를 보내세요!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    height: 1.50),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 200,
              ),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Color(0xFFFFE812),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TermsOfService()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //icon: Image.asset('assets/icon/kakao_logo.png'),
                        SvgPicture.asset('assets/icon/kakao_logo(1).svg'),
                        Text(
                          '카카오로 시작하기',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        padding: EdgeInsets.all(11.5),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.apple),
                        Text('Apple로 시작하기'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
