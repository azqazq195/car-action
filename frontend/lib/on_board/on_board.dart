class OnBoard {
  final String imagePath, title;
  final String? description;

  OnBoard({
    required this.imagePath,
    required this.title,
    this.description,
  });
}

final List<OnBoard> demo_data = [
  OnBoard(
    imagePath: "assets/lottie/phone.json",
    title: "삼쩜삼으로 쩜 쉽게.\n세금관리해요",
  ),
  OnBoard(
      imagePath: "assets/lottie/car-city.json",
      title: "종합소득세 환급신고\n2분이면 조회 완료!",
      description: "나도 몰랐던 숨은 환급액 찾아요."),
  OnBoard(
      imagePath: "assets/lottie/women.json",
      title: "일상에서 도음되는\n소득 공제 방법 추천해드려요",
      description: "나에게 딱 맞는 공제가이드 제공"),
  OnBoard(
      imagePath: "assets/lottie/man-car.json",
      title: "놓치면 아까운 세금정보\n꼼꼼히 알려드려요",
      description: "기간부터 준비서류, 꿀팁까지 한번에!"),
];
