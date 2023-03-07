import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/Partner_Model.dart';

class PostApi{
  PostsApi? data;

  Future<PostsApi?> postData() async {
    String api = "https://coupinos-app.azurewebsites.net/post/get";
    Map postBody = {
      "radius": 10,
      "pageSize": 10,
      "page": 0,
      "longitude": 72.57136166666666,
      "latitude": 23.022503333333333};
    var body = jsonEncode(postBody);
    var result = await http.post(
        Uri.parse(api),
        body: body,
        headers: {'Content-type': 'application/json',
          'x-access-token' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjMxYWQxNDhlMGEyNjkwMDIzMWJiNTc5IiwiZW1haWwiOiJsZWFybnRlc3Q0MysxQGdtYWlsLmNvbSIsInJvbGUiOlsiUmVndWxhclVzZXIiXSwiZmlyc3ROYW1lIjoiSGFycnkiLCJsYXN0TmFtZSI6IlBvdHRlciIsImlzRGVmYXVsdEltYWdlIjp0cnVlLCJkZWZhdWx0SW1hZ2VQYXRoIjoiL3VzZXIvZGVmYXVsdEltYWdlcy80IiwiaWF0IjoxNjc3MTQ0MTY1LCJleHAiOjE2Nzk3MzYxNjV9.1MwdGCrU6rnkCCbMtWvBB4IssYue3P1moNS1wsb44jU'});
    if (result.statusCode == 200) {
      final response = result.body;
      print("data ${response}");
      Map<String, dynamic> map = jsonDecode(response);
      final local = PostsApi.fromJson(map);
      data = local;
      return data;
    } else {
      throw Exception("not found");
    }
  }
}