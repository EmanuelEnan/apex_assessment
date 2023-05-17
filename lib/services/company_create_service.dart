import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../models/company_post_mode.dart';
import '../tokens.dart';

final apiPostProvider =
    Provider<CompanyCreateService>((ref) => CompanyCreateService());

class CompanyCreateService {
  Future<CompanyPostModel> postApi() async {
    String url = Tokens.postUrl;

    Map<String, String> param = {
      "company_name": "test",
      "email": "test@gmail.com",
      "password": "12345678",
      "phone": "123456789"
    };

    Uri uri = Uri.parse(url);

    final response = await http.post(
      uri,
      body: param,
    );

    try {
      if (response.statusCode == 201) {
        final resp = response.body;
        print(resp);

        return CompanyPostModel.fromJson(jsonDecode(resp));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    throw Exception('${response.statusCode}');
  }
}
