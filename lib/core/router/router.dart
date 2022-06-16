import 'package:flutter/material.dart';
import 'package:rent_app/utils/constant/router_constants.dart';
import 'package:rent_app/view/authentication/user/view/user_view.dart';
import 'package:rent_app/view/home/view/home/home.dart';
import 'package:rent_app/view/product/new_product/product.dart';
import 'package:rent_app/view/profile/profile_view.dart';

import '../../view/authentication/login/view/login_view.dart';
import '../../view/authentication/register/view/register_view.dart';
import '../../view/home/view/tab_view.dart';
import '../../view/product/product_detail/view/product_detail.dart';
import '../../view/splash/splash_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name) {
      case homeViewRoute:
        return MaterialPageRoute(builder: (_) => Home()); 
      case profileViewRoute: 
        return MaterialPageRoute(builder: (_) => const ProfileView()); 
      case tabViewRoute: 
        return MaterialPageRoute(builder: (_) => const TabView());
      case splashViewRoute: 
        return MaterialPageRoute(builder: (_) => const SplashView());
      case loginViewRoute: 
        return MaterialPageRoute(builder: (_) => const LoginView());
      case registerViewRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case productDetailViewRoute:
        return MaterialPageRoute(builder: (_) =>  ProductDetail());
      case addProductViewRoute:
        return MaterialPageRoute(builder: (_) =>  Product());   
      case userViewRoute:
        return MaterialPageRoute(builder: (_) =>  const UserView());   
               
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('${settings.name} is not a route'),
            ),
          ),
        );
    }
  }
}