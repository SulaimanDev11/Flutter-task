import 'dart:io';
import 'package:check_in_app/data/params/params.dart';
import 'package:http/http.dart' as http;

import '../../errors/api_error.dart';
import 'remote_datasource.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<bool> saveUserData({required SaveUserParams params}) async {
    final data = {
      "checkinDateTime": params.checkInDateTime,
      "checkoutDateTime": params.checkOutDateTime,
      "name": params.name,
      "breakTime": params.breakTime,
    };
    try {
      final response = await http.post(
        Uri.parse('http://65.109.103.32:6580/api/v1/tracking/checkin-checkout'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer TOKKEN IS HERE',
        },
        body: data,
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to update check-in/check-out');
      }
      return true;
    } on SocketException {
      throw NetworkException();
    } catch (e) {
      throw ServerException();
    }
  }
}
