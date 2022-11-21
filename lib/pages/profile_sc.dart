import 'package:flutter/material.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/pages/authentication_pages/login/cubit/login_cubit.dart';
import 'package:shop_app/widgets/reusable/custom_textfield.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        // LoginCubit cubitLogin = LoginCubit.get(context);

        nameController.text = cubit.userModel!.data!.name!;
        emailController.text = cubit.userModel!.data!.email!;
        phoneController.text = cubit.userModel!.data!.phone!;

        return Scaffold(
          appBar: AppBar(
            title: Text('Edit Profile'),
          ),
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
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
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(
                          Icons.image,
                          size: 15,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  DefaultFormField(
                    controller: nameController,
                    hintText: 'Name',
                    prefix: Icons.person,
                    validate: (v) {
                      if (v.isEmpty) {
                        return 'enter name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  DefaultFormField(
                    controller: emailController,
                    hintText: 'Email Address',
                    prefix: Icons.email,
                    validate: (v) {
                      if (v.isEmpty) {
                        return 'enter email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  DefaultFormField(
                    controller: phoneController,
                    hintText: 'Phone Number',
                    prefix: Icons.phone,
                    validate: (v) {
                      if (v.isEmpty) {
                        return 'enter phone number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        cubit.updateUser(name: nameController.text, phone: phoneController.text, email: emailController.text);
                        Navigator.pop(context);
                      },
                      child: Text('SAVE'))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
