//import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:tugas_11_rest_api/user/model/user_model.dart';

// class UserService {
//   Dio dio = Dio();
//   static const url = 'https://reqres.in/api/users?page=2';

//   Future<List<UserModel>> fatchUser() async {
//     try {
//       final response = await dio.get(url);
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final data = response.data['data'];
//         List<UserModel> users =
//             List.from(data.map((user) => UserModel.fromjson(user)));
//         return users;
//       }
//       throw Exception();
//     } catch (e) {
//       rethrow;
//     }
//   }
// }

class UserService {
  Dio dio = Dio();
  static const baseUrl = 'https://reqres.in/api/users';

  // Fetch multiple users
  Future<List<UserModel>> fatchUser() async {
    try {
      final response = await dio.get('$baseUrl?page=2');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data['data'];
        List<UserModel> users =
            List.from(data.map((user) => UserModel.fromjson(user)));
        return users;
      }
      throw Exception();
    } catch (e) {
      rethrow;
    }
  }

  // Fetch single user by ID
  Future<UserModel> fetchSingleUser(int id) async {
    try {
      final response = await dio.get('$baseUrl/$id');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data['data'];
        return UserModel.fromjson(data);
      }
      throw Exception();
    } catch (e) {
      rethrow;
    }
  }
}
