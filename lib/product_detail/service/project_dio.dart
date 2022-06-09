import 'package:dio/dio.dart';

class ProjectDioMixin {
  final service = Dio(BaseOptions(baseUrl: "https://c1-na.altogic.com/e:629a6b6a9cf83b3805522976"));
}
