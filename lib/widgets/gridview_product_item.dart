import 'package:flutter/material.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/models/change_favorite_model.dart';
import 'package:shop_app/widgets/reusable/product_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GridViewProductItem extends StatelessWidget {
   GridViewProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if(state is AppChangeFavoriteSuccessState){
          if(!state.model.status!){
            Fluttertoast.showToast(
              msg: state.model.message!,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
            );
          }
        }
      },
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding:  EdgeInsets.symmetric(horizontal: 7),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5 / 2.4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) => ProductItem(
            photoUrl: cubit.homeModel!.data!.products[index].image!,
            title: cubit.homeModel!.data!.products[index].name!,
            price: cubit.homeModel!.data!.products[index].price.toDouble(),
            oldPrice:
                cubit.homeModel!.data!.products[index].oldPrice.toDouble(),
            button: IconButton(
              onPressed: () {
                cubit.changeFavoriteItem(cubit.homeModel!.data!.products[index].id!);
              },
              icon: Icon(
                 cubit.favorites[cubit.homeModel!.data!.products[index].id!]! ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              padding: EdgeInsets.zero,
              constraints:  BoxConstraints(),
              splashRadius: 20,
            ),
          ),
          itemCount: cubit.homeModel!.data!.products.length,
        );
      },
    );
  }
}
