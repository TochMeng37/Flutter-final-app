import 'package:dio/dio.dart';
import 'package:final_app/model/card_add_model.dart';
import 'package:final_app/model/current_user_model.dart';
import 'package:final_app/model/detail_model.dart';
import 'package:final_app/model/product_model.dart';
import 'package:final_app/model/user_model.dart';

class ApiHelper {
  final Dio dio = Dio();
  Future<String> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    var formData = FormData.fromMap({
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": password,
    });

    try {
      final response = await dio.post(
        "http://192.168.100.39:8000/api/auth/register",
        data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 200) {
        return response.data["message"] ?? "Success";
      } else {
        throw Exception("Failed to register: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Dio error: ${e.message}");
    } catch (e) {
      throw Exception("General error: $e");
    }
  }

  Future<UserResponse> login({
    required String email,
    required String password,
  }) async {
    var formData = FormData.fromMap({
      "email": email,
      "password": password,
      "password_confirmation": password,
    });

    try {
      final response = await dio.post(
        "http://192.168.100.39:8000/api/auth/login",
        data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 200) {
        return UserResponse.fromJson(response.data);
      } else {
        throw Exception("Failed to login: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Dio error: ${e.message}");
    } catch (e) {
      throw Exception("General error: $e");
    }
  }

  Future<CurrentUserResponse> getUserAccount({required String token}) async {
    try {
      final response = await dio.get(
        "http://192.168.100.39:8000/api/auth/me",
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
      );
      if (response.statusCode == 200) {
        return CurrentUserResponse.fromJson(response.data);
      } else {
        throw Exception("Failed to get Users: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("General error: $e");
    }
  }

  Future<String> logout({required String token}) async {
    try {
      final response = await dio.post(
        "http://192.168.100.39:8000/api/auth/logout",
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return "Logged out successfully";
      } else {
        throw Exception("Failed to login: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("General error: $e");
    }
  }

  Future<AddCardResponse> getBuy({required String token}) async {
    try {
      final response = await dio.get(
        "http://192.168.100.39:8000/api/getBuyAll",
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return AddCardResponse.fromJson(response.data);
      } else {
        throw Exception("Failed to get by one: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("General error: $e");
    }
  }

  Future<ProductResponse> getallProducts({required String token}) async {
    try {
      final response = await dio.get(
        "http://192.168.100.39:8000/api/get-products",
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return ProductResponse.fromJson(response.data);
      } else {
        throw Exception("Failed to get by one: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("General error: $e");
    }
  }

  Future<DetailDataModel> showOne(
      {required String token, required String productID}) async {
    try {
      final response = await dio.get(
        "http://192.168.100.39:8000/api/show/$productID",
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return DetailDataModel.fromJson(response.data);
      } else {
        throw Exception("Failed to get by one: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("General error: $e");
    }
  }

  Future<DetailDataModel> addToCard(
      {required String token, required String productID}) async {
    try {
      final response = await dio.post(
        "http://192.168.100.39:8000/api/buy/$productID",
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return DetailDataModel.fromJson(response.data);
      } else {
        throw Exception("Failed to get by one: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("General error: $e");
    }
  }
}
