// import 'content_types.dart';

// class ApiService {
//   Future<Map<String, String>> headers(bool authRequired, {Map<String, String>? headers, ContentTypes? contentType}) async {
//     Map<String, String> h = contentType != null ? {'content-type': contentType.type.toString()} : {};
//     if (authRequired) {
//       String? token;
//       token = await CacheManeger.getToken();
//       if (token != null) {
//         h.addAll({"Authorization": "Bearer $token"});
//       } else {
//         h.addAll({"Authorization": "Bearer " + ""});
//       }
//     }
//     if (headers != null) h.addAll(headers);
//     return h;
//   }

//   Map<String, String> params(Map<String, dynamic>? queryParameters) {
//     Map<String, String> p = {};
//     if (queryParameters != null) p = queryParameters.map((key, value) => MapEntry(key, value.toString()));
//     return p;
//   }

//   Future<dynamic> get(String path, {Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
//     return await Dio().get(path, data: data, options: Options(headers: headers));
//   }

//   Future<dynamic> del(String path, {Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
//     return await Dio().delete(path, data: data, options: Options(headers: headers));
//   }

//   Future<dynamic> post(String path, {Map<String, dynamic>? data, Map<String, String>? headers}) async {
//     return await Dio().post(path, data: data, options: Options(headers: headers));
//   }

//   Future<dynamic> put(String path, {Map<String, dynamic>? data, Map<String, String>? headers}) async {
//     return await Dio().put(path, data: data, options: Options(headers: headers));
//   }
// }