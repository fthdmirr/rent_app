import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingletonAsync<SharedPreferences>(() async => await SharedPreferences.getInstance());
}