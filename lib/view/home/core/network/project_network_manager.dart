import 'package:dio/dio.dart';

import '../base_model.dart';

class ProjectNetworkManager {
  static ProjectNetworkManager? _instace; 
  static ProjectNetworkManager get instance {
    if (_instace != null) return _instace!;
    _instace = ProjectNetworkManager._init();
    return _instace!;
  }

  final String _baseUrl = 'https://c1-na.altogic.com/e:629a6b6a9cf83b3805522976'; 
  late final Dio dio; //Dio paketini kullanııyoruz

  ProjectNetworkManager._init() { //_init fonksiyonu private olarak tanımladık
    dio = Dio(BaseOptions(baseUrl: _baseUrl));

    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (e, handler) {
        final data = e.data;

        if (data is Map<String, dynamic>) {
          final model = BaseResponseModel.fromJson(data);
          if (model.countInfo?.count == 0) {
            handler.reject(DioError( //reject fonksiyonu dio error olarak döndürür
              requestOptions: RequestOptions(path: e.realUri.path),
            ));
            return;
          }
          e.data = data['result'];
        }
        handler.next(e); //next fonksiyonu dio error olarak döndürür
      },
    ));
  }
}