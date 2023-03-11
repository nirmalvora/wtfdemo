import 'package:http/http.dart' as http;
import 'package:wtfdemo/core/services/service_constant.dart';

class BaseApiService {
  static final BaseApiService instance = BaseApiService._internal();

  factory BaseApiService({bool stripeAuth = false}) {
    return instance;
  }

  BaseApiService._internal();

  Future<http.Response> post(
    String endUrl, {
    dynamic data,
  }) async {
    return await http.post(
      Uri.parse('${ServiceConstant.baseUrl}$endUrl'),
      body: data,
      headers: {
        "authentication":
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiJWTWRSeFpwQjdlSEw4IiwibmFtZSI6Ik5hcmVzaCBLdWtyZXRpIiwiaWF0IjoxNjUzNTYxMzQ3LCJleHAiOjE2NTYxNTMzNDd9.ft4yHKVsWHA_LTTSmLi8EHCAEb359nXRoxr43ZJ6Whs"
      },
    );
  }
}
