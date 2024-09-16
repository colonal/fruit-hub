import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/search_text_field.dart';
import 'best_selling_grid_view.dart';
import 'best_selling_header.dart';
import 'custom_home_app_bar.dart';
import 'featured_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: kTopPadding),
                CustomHomeAppBar(),
                SizedBox(height: 16),
                SearchTextField(),
                SizedBox(height: 12),
                FeaturedList(),
                SizedBox(height: 12),
                BestSellingHeader(),
                SizedBox(height: 8),
              ],
            ),
          ),
          BestSellingGridView(),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      ),
    );
  }
}
