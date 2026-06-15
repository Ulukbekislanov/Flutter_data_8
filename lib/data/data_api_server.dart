import 'package:dio/dio.dart';
import 'package:flutter_application_21/data/models/data_model.dart';

class DataApiServer {
  final Dio _dio = Dio();

  Future<List<DataModel>> getData() async {
    final response = await _dio.get('https://api.coinlore.net/api/assets/');

    final List data = response.data['data'];

    return data.map((e) => DataModel.fromJson(e)).toList();
  }
}