import 'dart:convert';
import 'package:data_on_test_case/view/model/university_model.dart';
import 'package:http/http.dart' as http;

class UniversityListService {
  Future<List<UniversityModel>> getUniversityList(
      String name, int page, int count) async {
    String url = 'universities.hipolabs.com';
    Uri uri = Uri.http(url, '/search', {
      'country': 'Indonesia',
      'name': name,
      'start': '$page',
      'limit': '$count'
    });
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      final dataList = jsonDecode(response.body) as List;
      List<UniversityModel> productList = dataList.map((e) {
        UniversityModel product = UniversityModel.fromJson(e);
        return product;
      }).toList();
      return productList;
    }
    return [];
  }
}
