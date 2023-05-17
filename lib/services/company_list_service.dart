import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../models/company_model.dart';
import '../tokens.dart';

final apiProvider = Provider<CompanyListService>((ref) => CompanyListService());

class CompanyListService {
  Future<List<CompanyModel>> getApi() async {
    String url = Tokens.getUrl;

    Uri uri = Uri.parse(url);

    final response = await http.get(
      uri,
    );

    try {
      if (response.statusCode == 200) {
        final resp = '[${response.body}]';

        List service = (jsonDecode(resp) as List<dynamic>);

        return service.map((json) => CompanyModel.fromJson(json)).toList();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    throw Exception('${response.statusCode}');
  }
}
