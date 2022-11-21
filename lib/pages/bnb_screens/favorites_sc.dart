import 'package:flutter/material.dart';
import 'package:shop_app/config/variables.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/widgets/reusable/product_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);

  final double _size = p50 * 1.5;
  final double _font = 17;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        return (state is! AppLoadingFavoriteDataSuccessState) ? ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => InkWell(
            onTap: () {},
            child: Container(
              height: _size * 1.5,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Container(
                        width: _size * 1.5,
                        height: _size * 1.78,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(cubit.favoriteModel!
                                  .data!.data[index].product!.image!),
                              fit: BoxFit.cover),
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      if (cubit.favoriteModel!.data!.data[index]
                          .product!.price! !=
                          cubit.favoriteModel!.data!.data[index]
                              .product!.oldPrice!)
                        Container(
                          color: Colors.red,
                          padding: EdgeInsets.symmetric(
                              horizontal: 4, vertical: 2),
                          child: Text(
                            'DISCOUNT',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, top: 20, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cubit.favoriteModel!.data!.data[index]
                                .product!.name!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                            TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  cubit.favoriteModel!.data!.data[index]
                                      .product!.price!
                                      .toString() +
                                      '\$',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              // SizedBox(width: 10),
                              if (cubit.favoriteModel!.data!.data[index]
                                  .product!.price! !=
                                  cubit.favoriteModel!.data!.data[index]
                                      .product!.oldPrice!)
                                Expanded(
                                  child: Text(
                                      cubit
                                          .favoriteModel!
                                          .data!
                                          .data[index]
                                          .product!
                                          .oldPrice!
                                          .toString() +
                                          '\$',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: _font - 5,
                                          decoration: TextDecoration
                                              .lineThrough)),
                                ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      cubit.changeFavoriteItem(
                          cubit.homeModel!.data!.products[index].id!);
                    },
                    icon: Icon(
                      cubit.favorites[cubit
                          .homeModel!.data!.products[index].id!]!
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
          separatorBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Container(
              height: 1,
              color: Colors.black,
              width: screenWidth,
            ),
          ),
          itemCount: cubit.favoriteModel!.data!.data.length,
        ) : Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
