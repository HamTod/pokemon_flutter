import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon2/app/app_api.dart';
import 'package:pokemon2/data/user_data.dart';

class UserServices {
  Future<List<UserData>> fetchData() async {
    final response = await http.get(Uri.parse(AppApi.user));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data as List).map((e) => UserData.fromJson(e)).toList();
      // process the data here
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return [];
    }
  }
}
