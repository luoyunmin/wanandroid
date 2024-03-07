import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wanandroid/models/FavoriteArticle.dart';
import 'package:wanandroid/models/HotKey.dart';
import 'package:wanandroid/models/RespData.dart';
import 'package:wanandroid/network/cookie_interceptor.dart';
import 'package:cookie_jar/cookie_jar.dart';

import '../models/Article.dart';
import '../models/BannerModel.dart';
import '../models/Navi.dart';
import '../models/Resp.dart';
import '../models/Tree.dart';
import '../models/User.dart';
import '../util/Log.dart';

class HttpUtil {
  const HttpUtil._();

  static late Dio dio;

  static void init() async {
    dio = Dio(BaseOptions(baseUrl: 'https://www.wanandroid.com'));
    final appDocDir = await getApplicationDocumentsDirectory();
    final appDocPath = appDocDir.path;
    final jar = PersistCookieJar(
        ignoreExpires: true, storage: FileStorage("$appDocPath/.cookies/"));
    dio.interceptors.add(CookieInterceptor(jar));
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  static Future<RespData<Article>> getArticles(int page, {int? cid}) async {
    StringBuffer url = StringBuffer("/article/list/$page/json");
    if (cid != null) {
      url.write("?cid=$cid");
    }
    var result = await dio.get(url.toString());
    Resp<RespData<Article>> resp = Resp.fromJson(result.data,
        (json) => RespData.fromJson(json, (json) => Article.fromJson(json)));
    return resp.data;
  }

  static Future<List<Article>> getTopArticle() async {
    var result = await dio.get("/article/top/json");
    Resp<List<Article>> resp = Resp.fromJson(result.data, (json) {
      return (json as List<dynamic>)
          .map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList();
    });
    return resp.data;
  }

  static Future<List<BannerModel>> getBanner() async {
    var result = await dio.get("/banner/json");
    Resp<List<BannerModel>> resp = Resp.fromJson(result.data, (json) {
      return (json as List<dynamic>)
          .map((e) => BannerModel.fromJson(e as Map<String, dynamic>))
          .toList();
    });
    return resp.data;
  }

  static Future<RespData<Article>> getDayQuestion(int page) async {
    var result = await dio.get("/wenda/list/$page/json");
    Resp<RespData<Article>> resp = Resp.fromJson(result.data,
        (json) => RespData.fromJson(json, (json) => Article.fromJson(json)));
    return resp.data;
  }

  static Future<List<Tree>> getTree() async {
    var result = await dio.get("/tree/json");
    Resp<List<Tree>> resp = Resp.fromJson(result.data, (json) {
      return (json as List<dynamic>)
          .map((e) => Tree.fromJson(e as Map<String, dynamic>))
          .toList();
    });
    return resp.data;
  }

  static Future<List<Navi>> getNavi() async {
    var result = await dio.get("/navi/json");
    Resp<List<Navi>> resp = Resp.fromJson(result.data, (json) {
      return (json as List<dynamic>)
          .map((e) => Navi.fromJson(e as Map<String, dynamic>))
          .toList();
    });
    return resp.data;
  }

  static Future<List<HotKey>> getHotSearch() async {
    var result = await dio.get("/hotkey/json");
    Resp<List<HotKey>> resp = Resp.fromJson(result.data, (json) {
      return (json as List<dynamic>)
          .map((e) => HotKey.fromJson(e as Map<String, dynamic>))
          .toList();
    });
    return resp.data;
  }

  static Future<RespData<Article>> searchArticle(
      int page, String searchText) async {
    var result = await dio.post("/article/query/$page/json",
        data: FormData.fromMap({"k": searchText}));
    Resp<RespData<Article>> resp = Resp.fromJson(result.data,
        (json) => RespData.fromJson(json, (json) => Article.fromJson(json)));
    return resp.data;
  }

  static Future<User> login(String username, String password) async {
    var data = FormData.fromMap({"username": username, "password": password});
    var result = await dio.post("/user/login", data: data);
    Log.i("login: ${result.data}");
    Resp<User> resp = Resp.fromJson(result.data, (json) => User.fromJson(json));
    return resp.data;
  }

  static Future<User> register(
      String username, String password, String rePassword) async {
    var data = FormData.fromMap(
        {"username": username, "password": password, "repassword": rePassword});
    var result = await dio.post("/user/register", data: data);
    Resp<User> resp = Resp.fromJson(result.data, (json) => User.fromJson(json));
    return resp.data;
  }

  static Future<Resp<dynamic>> logout() async {
    var result = await dio.get("/user/logout/json");
    Log.i("logout: $result");
    Resp<dynamic> resp = Resp.fromJson(result.data, (json) => dynamic);
    return resp;
  }

  static Future<RespData<FavoriteArticle>> getFavorites(int page) async {
    var result = await dio.get("/lg/collect/list/0/json");
    Log.i("getFavorites: ${result.data}");
    Resp<RespData<FavoriteArticle>> resp = Resp.fromJson(
        result.data,
        (json) =>
            RespData.fromJson(json, (json) => FavoriteArticle.fromJson(json)));
    return resp.data;
  }

  static Future<T> get<T>(String url, JsonConvert convert) async {
    var result = await dio.get(url);
    T resp = convert(result.data);
    return resp;
  }

  static Future<T> post<T>(
      String url, FormData data, JsonConvert convert) async {
    var result = await dio.post(url, data: data);
    T resp = convert(result.data);
    return resp;
  }
}

typedef JsonConvert<T> = T Function(String json);
