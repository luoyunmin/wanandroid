import 'dart:io';

import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';

import '../util/Log.dart';

class CookieInterceptor extends Interceptor {

  CookieInterceptor(this.cookieJar);

  final CookieJar cookieJar;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) => _setCookie(options, handler);

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    _saveCookie(response);
    super.onResponse(response, handler);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    if (err.response != null) {
      _saveCookie(err.response!);
    }
    super.onError(err, handler);
  }

  _setCookie(RequestOptions options, RequestInterceptorHandler handler) async {
    final cookies = await cookieJar.loadForRequest(options.uri);
    // 删除失效cookie
    cookies.removeWhere((cookie) {
      if (cookie.expires != null) {
        return cookie.expires!.isBefore(DateTime.now());
      }
      return false;
    });
    String cookie = cookies.map((cookie) => "${cookie.name}=${cookie.value}").join(";");
    options.headers[HttpHeaders.cookieHeader] = cookie;
    handler.next(options);
  }

  _saveCookie(Response response) async {
    List<String>? cookies = response.headers[HttpHeaders.setCookieHeader];
    if (cookies != null && cookies.isNotEmpty) {
      cookies.forEach((e) => Log.i(e));
      // 如果是登录或者注册接口， 保存cookie
      final requestUri = response.requestOptions.uri;
      if (requestUri.path == "/user/login" ||
          requestUri.path == '/user/register') {
        cookieJar.saveFromResponse(requestUri,
            cookies.map((e) => Cookie.fromSetCookieValue(e)).toList());
      }
    }
  }
}
