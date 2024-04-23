// // ignore_for_file: avoid_print


// class ApiManager {
//   static ApiManager? _instance;
//   static ApiManager get instance {
//     _instance ??= ApiManager._init();
//     return _instance!;
//   }

//   ApiManager._init();
//   final ApiService _service = ApiService();
//   dynamic req(String path, ReqType type, {bool authRequired = false, Map<String, dynamic>? data, ContentTypes? contentType, String? endUrl}) async {
//     String p = path + (endUrl ?? "");
//     Map<String, String> header = await _service.headers(authRequired, contentType: contentType);
//     switch (type) {
//       case ReqType.create:
//         try {
//           final res = await _service.post(
//             p,
//             headers: header,
//             data: data,
//           );
//           return res;
//         } catch (e) {
//           print("DioException: $e");
//         }
//       case ReqType.put:
//         try {
//           final res = await _service.put(
//             p,
//             headers: header,
//             data: data,
//           );
//           return res;
//         } catch (e) {
//           print("DioException: $e");
//         }
//       case ReqType.read:
//         try {
//           final res = await _service.get(p, headers: header, data: data);
//           return res;
//         } catch (e) {
//           print("DioException: $e");
//         }
//         break;
//       case ReqType.delete:
//         try {
//           final res = await _service.del(p, headers: header, data: data);
//           return res;
//         } catch (e) {
//           print("DioException: $e");
//         }
//         break;
//     }
//   }
// }

// enum ReqType { create, read, put, delete }