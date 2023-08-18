import 'package:flutter/material.dart';
import 'package:daum_postcode_search/data_model.dart';
import 'package:daum_postcode_search/daum_postcode_search.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/svg.dart';

import 'join.dart';

class FindAddress extends StatefulWidget {
  const FindAddress({super.key});

  @override
  State<FindAddress> createState() => _FindAddressState();
}

class _FindAddressState extends State<FindAddress> {

  DataModel? _dataModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '우편번호 검색',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 1,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icon/appbar_prev_icon.svg'),
          color: Colors.black,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Join()));
          },
        ),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}

