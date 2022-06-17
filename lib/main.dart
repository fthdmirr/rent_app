import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_app/theme/dark_theme.dart';

import 'package:rent_app/utils/constant/router_constants.dart';
import 'package:rent_app/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme/light_theme.dart';
import 'view/authentication/authentication_status.dart';
import 'view/authentication/login/view_model/login_view_model.dart';
import 'view/authentication/register/view_model/register_view_model.dart';
import 'view/authentication/user/view_model/user_view_model.dart';
import 'view/profile/profile_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'core/router/router.dart' as router;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setup();
  getIt.isReady<SharedPreferences>().then(
        (value) => runApp(
          MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => RegisterViewModel()),
              ChangeNotifierProvider(create: (_) => LoginViewModel()),
              ChangeNotifierProvider(
                  create: (_) => AuthenticationStatus()..initStatus(),
                  lazy: false),
              ChangeNotifierProvider(create: (_) => ProfileViewModel()..init()),
              ChangeNotifierProvider(create: (_) => UserViewModel()),
            ],
            child: const MyApp(),
          ),
        ),
      );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: darkThemeData,
      theme: lightThemeData,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.Router.generateRoute,
      initialRoute: _initNavigation(context)
    );
  }

  String _initNavigation(BuildContext context) {
    if (getIt<SharedPreferences>().getBool('isShowed') ?? false) {
      return context.watch<AuthenticationStatus>().status ==
              AuthenticationStatusEnum.authenticated
          ? tabViewRoute
          : registerViewRoute;
    } else {
      return splashViewRoute;
    }
  }
}
