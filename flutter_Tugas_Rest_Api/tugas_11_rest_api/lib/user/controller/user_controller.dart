// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:tugas_11_rest_api/user/model/user_model.dart';
// import 'package:tugas_11_rest_api/user/service/user_service.dart';

// class UserController extends GetxController {
//   List<UserModel> users = [];

//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     fetchDataUser();
//   }

//   Future<void> fetchDataUser() async {
//     users = await UserService().fatchUser();
//     update();
//   }
// }

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tugas_11_rest_api/user/model/user_model.dart';
import 'package:tugas_11_rest_api/user/service/user_service.dart';

class UserController extends GetxController {
  List<UserModel> users = [];
  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();
    fetchDataUser();
  }

  Future<void> fetchDataUser() async {
    try {
      users = await UserService().fatchUser();
    } catch (e) {
      print("Error fetching users: $e");
    } finally {
      isLoading = false;
      update(); // Notify UI to update after data is fetched
    }
  }
}
