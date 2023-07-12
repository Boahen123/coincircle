import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../data/app_config.dart';
import 'package:get_it/get_it.dart';

var console = Logger();

/// The Dio instance to use for all requests
class HttpService {
  final Dio _dio = Dio();

  AppConfig? _appConfig;
  String? _rootUrl;

  /// Get the root URL for the CoinGecko API
  HttpService() {
    // get the AppConfig singleton
    _appConfig = appConfig.get<AppConfig>();
    _rootUrl = _appConfig?.coinRootUrl;
  }

  /// Make a 'GET' request to the CoinGecko API
  Future<Response?> getData(String endpoint) async {
    try {
      String fullUrl = "$_rootUrl$endpoint";
      Response<dynamic> response = await _dio.get(fullUrl);
      return response;
    } catch (error) {
      console.d('HttpService error');
      console.d(error);
      throw Exception('HttpService error');
    }
  }
}

/// Register the HttpService singleton
void registerHttpService() {
  GetIt.instance.registerSingleton<HttpService>(HttpService());
}