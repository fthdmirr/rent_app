import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_app/home/view/tab_view.dart';
import 'authentication/register/view_model/register_view_model.dart';
void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.black))
      ),
      debugShowCheckedModeBanner: false,
      title: 'Rent App',
      home: const TabView(),
    );
  }
}
