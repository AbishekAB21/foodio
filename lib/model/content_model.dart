class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      image: "assets/onboardingScreen1.png",
      title: "International Goodness",
      description:
          "Treat yourself to great delicacies\n from around the world!"),
  OnboardingContent(
      image: "assets/onboardimgScreen2.png",
      title: "Seamless Payment",
      description: "Pay easily using our various payment methods!"),
  OnboardingContent(
      image: "assets/onboardingScreen3.png",
      title: "Lightning Quick Deliveries",
      description:
          "Get your favorite meals delivered fast and fresh to your doorstep\n with our convenient fast food delivery service!")
];
