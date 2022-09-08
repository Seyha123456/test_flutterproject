import 'package:dio/dio.dart';



//api url
mixin URLs {
  static const String url = 'https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw';
}

var dio = Dio(BaseOptions(
  baseUrl: URLs.url,
  connectTimeout: AppLimit.REQUEST_TIME_OUT,
  receiveTimeout: AppLimit.REQUEST_TIME_OUT,
  sendTimeout: AppLimit.REQUEST_TIME_OUT,
  // headers: {'Authorization': 'Bearer'},
  contentType: 'application/json',
));

mixin AppLimit {
  static const int REQUEST_TIME_OUT = 30000;
}
