import 'package:flutter/material.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/pages/authentication_pages/login/login_screen.dart';
import 'package:shop_app/pages/profile_sc.dart';
import 'package:shop_app/widgets/reusable/custom_textfield.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Drawer(
          child: cubit.userModel != null ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(360),
                  child: CircleAvatar(
                    child: Image(
                      image: NetworkImage(
                        cubit.userModel!.data!.image!,
                      ),
                      fit: BoxFit.cover,
                    ),
                    radius: 30,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.person,
                          size: 15, color: Colors.black.withOpacity(0.4)),
                      SizedBox(width: 5),
                      Text(cubit.userModel!.data!.name!,
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.phone,
                          size: 15, color: Colors.black.withOpacity(0.4)),
                      SizedBox(width: 5),
                      Text(cubit.userModel!.data!.phone!,
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.email,
                          size: 15, color: Colors.black.withOpacity(0.4)),
                      SizedBox(width: 5),
                      Text(cubit.userModel!.data!.email!,
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                SizedBox(height: 10),
                ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Edit Profile'),
                      trailing: Icon(Icons.keyboard_arrow_right_outlined),
                      onTap: () {
                        cubit.navigate(context, ProfileScreen());
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.brightness_4_outlined),
                      title: Text('Switch Light Mode'),
                      trailing: Switch(
                          value: cubit.darkModeSwitch,
                          onChanged: (v) {
                            cubit.changeDarkModeSwitch(
                                v: cubit.darkModeSwitch);
                          }),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red),
                  onPressed: () {
                    cubit.signOut(context, LoginScreen());
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.output_outlined),
                      SizedBox(width: 5),
                      Text('LOGOUT')
                    ],
                  ),
                )
              ],
            ),
          ) : Center(child: CircleAvatar()),
        );
      },
    );
  }
}
