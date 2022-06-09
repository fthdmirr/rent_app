import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_app/product_detail/view/product_detail_view.dart';
import 'package:rent_app/profile/view_model/profile_view_model.dart';
import 'package:rent_app/start/authentication/authentication_status.dart';
import 'package:rent_app/start/user/view/user_view.dart';
import 'package:rent_app/start/user/view_model/user_view_model.dart';
import 'start/login/view_model/login_view_model.dart';
import 'start/register/view_model/register_view_model.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RegisterViewModel()),
          ChangeNotifierProvider(create: (_) => LoginViewModel()),
          ChangeNotifierProvider(create: (_) => AuthenticationStatus()..initStatus(), lazy: false),
          ChangeNotifierProvider(create: (_) => ProfileViewModel()),
          ChangeNotifierProvider(create: (_) => UserViewModel()),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rent App',
      home: ProductDetailView(),
    );
  }
}


/*
context.watch<AuthenticationStatus>().status ==
              AuthenticationStatusEnum.authenticated
          ? const HomeView()
          : const RegisterView(),
 */
