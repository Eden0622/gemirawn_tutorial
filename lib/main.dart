import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gemirawn_tutorial/config/constants.dart';
import 'package:gemirawn_tutorial/home/home.dart';

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
          //scaffoldBackgroundColor: Color(0xff52C6D8),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            shadowColor: Color(0xffeeeeee),
          ),
        cardTheme: CardTheme(
          color: Colors.white,
          
        )
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
      extendBodyBehindAppBar: true,
      backgroundColor: primaryColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icon/logo_1.png'),
              const SizedBox(
                height: 24,
              ),
              Text(
                '재미로운 일들이\n 가득한 하루를 보내세요!',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500, height: 1.50),
                textAlign: TextAlign.center,
              ),
              /*SizedBox(
                height: 200,
              ),*/
              Column(
                children: [
                  IconButton(
                    style: IconButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 48, vertical: 24)
                    ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TermsOfService()));
                      },
                      icon: SvgPicture.asset('assets/icon/kakao_login_btn.svg',
                      width: 500, height: 100,),
                  ),
                  /*const SizedBox(height: 8),*/
                  IconButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                      },
                      icon: SvgPicture.asset('assets/icon/apple_login_btn.svg',
                      width: 328,),
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
