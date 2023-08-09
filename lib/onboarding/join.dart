import 'package:flutter/material.dart';

class Join extends StatefulWidget {
  const Join({super.key});

  @override
  State<Join> createState() => _JoinState();
}

class _JoinState extends State<Join> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          '회원가입',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color(0xffeeeeee)),
                  borderRadius: BorderRadius.circular(12),
                  //color: Colors.white,
                  boxShadow: [BoxShadow(
                    color: Color(0xffeeeeee), //.withOpacity(0.7),
                    blurRadius: 8,
                    offset: Offset(0, 4))
              ]),
              child: Column(
                children: [
                  Text('내 정보',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
