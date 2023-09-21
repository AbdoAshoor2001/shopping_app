class OnBoardingModel {
  final String title;
  final String subtitle;
  final String image;
  final String salary;
  final bool changeButton;

  OnBoardingModel({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.salary,
    required this.changeButton,
  });
}

List<OnBoardingModel> onBoardingModel = [
  OnBoardingModel(
    title: 'Gülçehre İbrik \n Limited Edition',
    image: 'assets/images/Gulcehre.png',
    salary: '€5650',
    subtitle: 'history Culture glass',
    changeButton: true,
  ),
  OnBoardingModel(
    title: 'Hagia Sophia \n Deesis Mosaic Vase',
    image: 'assets/images/SoteriaVazo.png',
    salary: '€3450',
    subtitle: 'history Culture glass',
    changeButton: true,
  ),
  OnBoardingModel(
    title: 'Mystical Vase\nLimited Edition',
    image: 'assets/images/KavukVase.png',
    salary: '€3150',
    subtitle: 'history Culture glass',
    changeButton: false,
  )
];
