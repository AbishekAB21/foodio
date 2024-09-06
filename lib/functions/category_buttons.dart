import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodio/provider/home_screen_provider.dart';
import 'package:foodio/widgets/category_selector.dart';
import 'package:foodio/widgets/shimmer_widget.dart';

class CategoryButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, provider, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => provider.getFoodItems("Ice-cream"),
              child: provider.isLoading
                  ? ShimmerWidget.rectangular(
                      width: 60,
                      height: 60,
                    )
                  : CategorySelector(imageUrl: "assets/icecream2.png"),
            ),
            GestureDetector(
              onTap: () => provider.getFoodItems("Pizza"),
              child: provider.isLoading
                  ? ShimmerWidget.rectangular(
                      width: 60,
                      height: 60,
                    )
                  : CategorySelector(imageUrl: "assets/pizza2.png"),
            ),
            GestureDetector(
              onTap: () => provider.getFoodItems("Burger"),
              child: provider.isLoading
                  ? ShimmerWidget.rectangular(
                      width: 60,
                      height: 60,
                    )
                  : CategorySelector(imageUrl: "assets/burger2.png"),
            ),
            GestureDetector(
              onTap: () => provider.getFoodItems("Salad"),
              child: provider.isLoading
                  ? ShimmerWidget.rectangular(
                      width: 60,
                      height: 60,
                    )
                  : CategorySelector(imageUrl: "assets/vegan.png"),
            ),
          ],
        );
      },
    );
  }
}
