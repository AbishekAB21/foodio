import 'package:flutter/material.dart';
import 'package:foodio/functions/build_horizontal.dart';
import 'package:foodio/functions/build_vertical.dart';
import 'package:foodio/widgets/shimmer_widget.dart';
import 'package:provider/provider.dart';
import 'package:foodio/provider/home_screen_provider.dart';
import 'package:foodio/components/no_search_results.dart';

class ShowShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, provider, child) {
        if (provider.noSearchResults) {
          return NoResults();
        } else {
          return Column(
            children: [
              provider.isLoading
                  ? ShimmerWidget.rectangular(
                      width: double.infinity,
                      height: 270,
                    )
                  : Container(
                      height: 270,
                      child: HorizontalItemList(),
                    ),
              const SizedBox(height: 10.0),
              provider.isLoading
                  ? ShimmerWidget.rectangular(
                      width: double.infinity,
                      height: 300,
                    )
                  : VerticalItemList(),
            ],
          );
        }
      },
    );
  }
}
