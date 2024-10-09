// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tugas_11_rest_api/user/controller/user_controller.dart';
// import 'package:tugas_11_rest_api/user/detail/UserDetailPage.dart';
// import 'package:tugas_11_rest_api/user/model/user_model.dart';
// import 'package:tugas_11_rest_api/user/service/user_service.dart';

// class UserPage extends StatefulWidget {
//   const UserPage({super.key});

//   @override
//   State<UserPage> createState() => _UserPageState();
// }

// class _UserPageState extends State<UserPage> {
//   List<UserModel> users = [];

//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }

//   getData() async {
//     users = await UserService().fatchUser();
//     print("ini data user ${users.length}");
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     var counterC = Get.put(UserController());
//     //Get.put(UserController());
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text('User Page')),
//       ),
//       body: ListView.builder(
//         itemCount: users.length,
//         itemBuilder: (context, index) => Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ListTile(
//             title: Text('${users[index].firsname} ${users[index].lastname}'),
//             leading: Image.network(users[index].avatar),
//             subtitle: Text(users[index].email),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => UserDetailPage(userId: users[index].id),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_11_rest_api/user/controller/user_controller.dart';
import 'package:tugas_11_rest_api/user/detail/UserDetailPage.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('User Page')),
      ),
      body: GetBuilder<UserController>(
        init: UserController(),
        builder: (controller) {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: controller.users.length,
            itemBuilder: (context, index) {
              final user = controller.users[index];
              return ListTile(
                title: Text('${user.firsname} ${user.lastname}'),
                leading: Image.network(user.avatar),
                subtitle: Text(user.email),
                onTap: () {
                  Get.to(() => UserDetailPage(userId: user.id));
                },
              );
            },
          );
        },
      ),
    );
  }
}
