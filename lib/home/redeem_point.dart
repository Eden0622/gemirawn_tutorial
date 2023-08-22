import 'package:flutter/material.dart';
import 'package:gemirawn_tutorial/home/home.dart';

class RedeemPoint extends StatelessWidget {
  const RedeemPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('포인트 사용',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w700
        ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.clear, color: Colors.black,),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15, right: 244, top: 10, bottom: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffeeeeee)),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [BoxShadow(blurRadius: 8, offset: Offset(0, 4), color: Color(0xffeeeeee))]),
              child: Text('5,000 P 사용예정',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff52C6D8)
                ),
              ),
            ),
            SizedBox(height: 96,),
            Center(
              child: Image.asset('assets/images/QR.png'),
            )
          ],
        ),
      ),
    );
  }
}
