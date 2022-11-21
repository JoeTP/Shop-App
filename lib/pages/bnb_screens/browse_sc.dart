import 'package:flutter/material.dart';
import 'package:shop_app/config/text_styles/text_styles.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:shop_app/widgets/cat_section.dart';
import 'package:shop_app/widgets/gridview_product_item.dart';
import 'package:shop_app/widgets/slider_widget.dart';

class BrowseScreen extends StatelessWidget {
  BrowseScreen({Key? key}) : super(key: key);

  PageController pageController = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Conditional.single(
          context: context,
          conditionBuilder: (context) =>
              cubit.homeModel != null && cubit.catModelData != null,
          widgetBuilder: (context) => SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SliderOffers(model: cubit.homeModel!),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TitleText(text: 'Categories', fontSize: 24,color: Colors.white,),
                ),
                SizedBox(height: 10),
                CategorySection(model: cubit.catModelData!),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TitleText(text: 'New Items', fontSize: 24,color: Colors.white,),
                ),
                SizedBox(height: 10),
                 GridViewProductItem(),
              ],
            ),
          ),
          fallbackBuilder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
