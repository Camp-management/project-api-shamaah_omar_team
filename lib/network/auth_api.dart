import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart_notes/model/auth/auth_model.dart';
import 'package:smart_notes/model/auth_input/auth_input.dart';
import 'package:smart_notes/network/constant_api.dart';

class AuthApi {
  late final ConstantApi _constant = ConstantApi();

  Future<AuthModel> loginAccount({required AuthInput authData}) async {
    try {
      final url = Uri.parse(_constant.baseURL + _constant.signInEndPoint);
      final response = await http.post(
        url,
        headers: _constant.header,
        body: authData.toJson(),
      );

      if (response.statusCode.toString().startsWith('2')) {
        print(response.body);
        // return AuthModelMapper.fromJson(response.body);
        return AuthModelMapper.fromMap(jsonDecode(response.body));
      }

      throw FormatException("There is error with your data try send it");
    } on FormatException catch (_) {
      rethrow;
    } catch (error) {
      throw FormatException("Error:$error");
    }
  }

  Future<AuthModel> signupAccount({required AuthInput authData}) async {
    try {
      final url = Uri.parse(_constant.baseURL + _constant.signUpEndPoint);
      final response = await http.post(
        url,
        headers: _constant.header,
        body: authData.toJson(),
      );
      if (response.statusCode.toString().startsWith('2')) {
        return AuthModelMapper.fromJson(response.body);
      }

      throw FormatException("There is error with your data try send it");
    } on FormatException catch (_) {
      rethrow;
    } catch (error) {
      throw FormatException("Error:$error");
    }
  }
}
