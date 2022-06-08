import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_app/start/authentication/authentication_status.dart';
import 'package:rent_app/start/register/view/register_view.dart';
import 'home/view/home_view.dart';
import 'start/login/view_model/login_view_model.dart';
import 'start/register/view_model/register_view_model.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RegisterViewModel()),
          ChangeNotifierProvider(create: (_) => LoginViewModel()),
          ChangeNotifierProvider(
              create: (_) => AuthenticationStatus()..initStatus(), lazy: false),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rent App',
      home: context.watch<AuthenticationStatus>().status ==
              AuthenticationStatusEnum.authenticated
          ? const HomeView()
          : const RegisterView(),
    );
  }
}


//test ömer
