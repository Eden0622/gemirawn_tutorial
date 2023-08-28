//포인트 데이터를 표현하기 위한 클래스
class Point {
  // 적립/사용 포인트 구분 변수 선언
  static const int typeSave = 0; //적립
  static const int typeUse = 1; //사용

  final String storeName;
  final String reason;
  final int point;
  final DateTime createDAT;
  final int type;

  Point({
    required this.storeName,
    required this.reason,
    required this.point,
    required this.createDAT,
    required this.type});
}

final List<Point> dummyPointList = List.generate(
    50,
        (index) => Point(
            storeName: '매장 이름$index',
            reason: '사유$index',
            point: (index + 1) * 100,
            createDAT: DateTime.now().subtract(Duration(days: index)),
            type: index.isOdd ? Point.typeUse : Point.typeSave)
);


//isOdd : 홀수
//isEven : 짝수