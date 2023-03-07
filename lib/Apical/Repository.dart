import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/Partner_Model.dart';


class PartnerApi {
  Partner? data;

  Future<Partner?> postApi() async {
    String api = "https://coupinos-app.azurewebsites.net/partners/list";
    Map postBody = {
      "radius": 10,
      "pageSize": 25,
      "page": 0,
      "longitude": "",
      "latitude": ""
    };
    var body = json.encode(postBody);
    var result = await http.post(Uri.parse(api), body: body, headers: {
      'Content-type': 'application/json',
      'x-access-token':
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjMxYWQxNDhlMGEyNjkwMDIzMWJiNTc5IiwiZW1haWwiOiJsZWFybnRlc3Q0MysxQGdtYWlsLmNvbSIsInJvbGUiOlsiUmVndWxhclVzZXIiXSwiZmlyc3ROYW1lIjoiSGFycnkiLCJsYXN0TmFtZSI6IlBvdHRlciIsImlzRGVmYXVsdEltYWdlIjp0cnVlLCJkZWZhdWx0SW1hZ2VQYXRoIjoiL3VzZXIvZGVmYXVsdEltYWdlcy80IiwiaWF0IjoxNjc3NjQ1OTQzLCJleHAiOjE2ODAyMzc5NDN9.MaiFy7_nbQT5TsNG2Kc49fKrAFSpjxzg8fJapffSXoo'
    });
    print(result);
    if (result.statusCode == 200) {
      final response = result.body;
      Map<String, dynamic> temp = jsonDecode(response);
      print(temp);
      final apicall = Partner.fromJson(temp);
      data = apicall;
      return data;
    } else {
      throw Exception(result.reasonPhrase);
    }
  }
}