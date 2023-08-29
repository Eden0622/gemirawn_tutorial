//공지사항 클래스 정의
import 'package:flutter/material.dart';

class Notice {
  static const int typeEven = 0;
  static const int typeOdd = 1;

  final String notice_title;
  final String notice_content;
  final String store;
  final DateTime date;
  final int notice_type;
  final String? imageUrl;
  final String? fileUrl;

  Notice({
    required this.notice_title,
    required this.notice_content,
    required this.store,
    required this.date,
    required this.notice_type,
    this.imageUrl,
    this.fileUrl,
  });
}

final List<Notice> noticeList = List.generate(
  30,
  (index) => Notice(
    notice_title: '포인트 적립 혜택 더블!$index',
    notice_content: '2023년 4월 부터 한달간 적립 혜택 더블 이벤트를 진행할 예정입니다. 일부 매장은 적용되지 않으므로 사용시 주의 하시기 바랍니다.\n'
        '적용 매장\n'
        '- 재미로운 강남지점\n'
        '- 재미로운 영등포지점\n'
        '- 재미로운 인천 트리플 지점\n'
        '- 재미로운 인천 트리플 지점\n'
        '- 재미로운 인천 트리플 지점\n'
        '- 재미로운 인천 트리플 지점\n'
        '- 재미로운 인천 트리플 지점\n'
        '- 재미로운 인천 트리플 지점\n'
        '- 재미로운 인천 트리플 지점\n'
        '- 재미로운 인천 트리플 지점\n'
        '- 재미로운 인천 트리플 지점',
    store: '잼팩토리',
    date: DateTime.now().subtract(Duration(days: index)),
    notice_type: index.isEven ? Notice.typeEven : Notice.typeOdd,
    imageUrl: index.isEven ? 'https://source.unsplash.com/random' : null,
    fileUrl: index.isEven ? '공지사항 관련 자료.jpg' : null,
  ),
);

//isOdd : 홀수
//isEven : 짝수
