import 'package:flutter/material.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/network/local/cache_helper.dart';
import 'package:shop_app/pages/authentication_pages/login/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/widgets/my_drawer.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Color(0xFFFFEECE),
          endDrawer: MyDrawer(),
          appBar: AppBar(
            title: Text('Shop'),
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.search)),
              Builder(builder: (context) {
                return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    icon: CircleAvatar(child: Icon(Icons.person)));
              }),
            ],
          ),
          body: cubit.screens[cubit.bnbCurrentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bnbItems,
            type: BottomNavigationBarType.fixed,
            currentIndex: cubit.bnbCurrentIndex,
            onTap: (index) {
              cubit.changeBNBIndex(index);
            },
          ),
        );
      },
    );
  }
}
