class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      image: "animations/food.json",
      title: "International Goodness",
      description:
          "Treat yourself to great delicacies from around the world!"),
  OnboardingContent(
      image: "animations/payment.json",
      title: "Seamless Payment",
      description: "Pay easily using our various payment methods!"),
  OnboardingContent(
      image: "animations/Fast-Delivery.json",
      title: "Lightning Quick Deliveries",
      description:
          "Your favorite meals delivered fast and fresh to your doorstep!")
];
