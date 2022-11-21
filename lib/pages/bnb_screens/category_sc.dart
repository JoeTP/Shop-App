import 'package:flutter/material.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);

  final double imageSize = 100;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Conditional.single(
          context: context,
          conditionBuilder: (context) => cubit.catModelData != null,
          widgetBuilder: (context) => ListView(
            // shrinkWrap: true,
            children: List.generate(
                cubit.catModelData!.data!.data.length,
                (index) => InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Container(
                                height: imageSize,
                                width: imageSize,
                                color: Colors.white,
                                child: Image(
                                    image: NetworkImage(cubit.catModelData!
                                        .data!.data[index].image!),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                cubit.catModelData!.data!.data[index].name!,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.keyboard_arrow_right_rounded,
                                color: Colors.white)
                          ],
                        ),
                      ),
                    )),
          ),
          fallbackBuilder: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
