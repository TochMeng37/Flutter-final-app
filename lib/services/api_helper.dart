import 'dart:io';

import 'package:dio/dio.dart';
import 'package:final_app/model/card_add_model.dart';
import 'package:final_app/model/current_user_model.dart';
import 'package:final_app/model/detail_model.dart';
import 'package:final_app/model/owner_model.dart';
import 'package:final_app/model/product_model.dart';
import 'package:final_app/model/user_model.dart';

class ApiHelper {
  final Dio dio = Dio();
  Future<String> registerUser({
    required String name,
    required String email,
    required String password,
    File? profile
  }) async {
    var formData = FormData.fromMap({
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": password,
      "profile": await MultipartFile.fromFile(profile!.path),
    });

    try {
      final response = await dio.post(
        "http://10.0.2.2:8000/api/auth/register",
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
        "http://10.0.2.2:8000/api/auth/login",
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
        "http://10.0.2.2:8000/api/auth/me",
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
        "http://10.0.2.2:8000/api/auth/logout",
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
        "http://10.0.2.2:8000/api/getBuyAll",
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
        "http://10.0.2.2:8000/api/get-products",
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
        "http://10.0.2.2:8000/api/show/$productID",
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
        "http://10.0.2.2:8000/api/buy/$productID",
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

  Future<String> updateProduct({
    required String productName,
    required String description,
    required String price,
    File? photo,
    required String productID,
    required String token,
  }) async {
    try {
      var formData = FormData.fromMap({
        "productName": productName,
        "description": description,
        "price": price,
        if (photo != null)
          "photo": await MultipartFile.fromFile(
            photo.path,
            filename: photo.path.split("/").last,
          ),
      });

      final response = await Dio().post(
        "http://10.0.2.2:8000/api/update/$productID",
        data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        // Assuming response contains a success message
        return response.data["message"] ?? "Product updated successfully";
      } else {
        // Log the response for debugging
        print("Failed to update product. Status code: ${response.statusCode}");
        print("Response data: ${response.data}");
        throw Exception("Failed to update product: ${response.statusCode}");
      }
    } on DioError catch (e) {
      // DioError provides more detailed error information
      print("DioError: ${e.response?.statusCode} ${e.message}");
      print("DioError data: ${e.response?.data}");
      throw Exception("DioError: ${e.message}");
    } catch (e) {
      // General error handling
      print("General error: $e");
      throw Exception("General error: $e");
    }
  }



  Future<Resonwer> getOwner({required String token}) async {
    try {
      final response = await dio.get(
        "http://10.0.2.2:8000/api/getOwners",
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        return Resonwer.fromJson(response.data);
      } else {
        throw Exception("Failed to fetch owner: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("An error occurred: $e");
    }
  }


  Future<String> Addproduct({
    required String productName,
    required String description,
    required String price,
    File? photo,
    required String token,
  }) async {
    try {
      // Create FormData object
      var formData = FormData.fromMap({
        "productName": productName,
        "description": description,
        "price": price,
        if (photo != null) // Only add photo if it's not null
          "photo": await MultipartFile.fromFile(photo.path, filename: photo.path.split("/").last),
      });

      // Send POST request
      final response = await dio.post(
        "http://10.0.2.2:8000/api/product",
        data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      // Handle the response
      if (response.statusCode == 200) {
        return response.data["message"] ?? "Success";
      } else {
        throw Exception("Failed to add product: ${response.statusCode}");
      }
    } on DioException catch (e) {
      // Handle Dio-specific errors
      if (e.response != null) {
        return "Failed to add product: ${e.response?.data['message'] ?? 'Unknown error'}";
      } else {
        return "Dio error: ${e.message}";
      }
    } catch (e) {
      // Handle general errors
      return "General error: $e";
    }
  }

}
