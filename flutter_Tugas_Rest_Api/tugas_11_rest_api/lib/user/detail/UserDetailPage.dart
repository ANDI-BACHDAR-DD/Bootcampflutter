// import 'package:flutter/material.dart';
// import 'package:tugas_11_rest_api/user/model/user_model.dart';
// import 'package:tugas_11_rest_api/user/service/user_service.dart';

// class UserDetailPage extends StatefulWidget {
//   final int userId;

//   const UserDetailPage({Key? key, required this.userId}) : super(key: key);

//   @override
//   State<UserDetailPage> createState() => _UserDetailPageState();
// }

// class _UserDetailPageState extends State<UserDetailPage> {
//   UserModel? user;

//   @override
//   void initState() {
//     super.initState();
//     getUserDetail();
//   }

//   getUserDetail() async {
//     user = await UserService().fetchUser(widget.userId);
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text('User Detail')),
//       ),
//       body: user == null
//           ? Center(child: CircularProgressIndicator())
//           : Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 //mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   CircleAvatar(
//                     radius: 50,
//                     backgroundImage: NetworkImage(user!.avatar),
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     '${user!.firsname} ${user!.lastname}',
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 8),
//                   Text(user!.email, style: TextStyle(fontSize: 16)),
//                 ],
//               ),
//             ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart'; // Import tambahan untuk firstWhereOrNull
import 'package:tugas_11_rest_api/user/controller/user_controller.dart';
import 'package:tugas_11_rest_api/user/model/user_model.dart';

class UserDetailPage extends StatelessWidget {
  final int userId;

  UserDetailPage({required this.userId});

  @override
  Widget build(BuildContext context) {
    final UserController controller = Get.find<UserController>();

    // Gunakan firstWhereOrNull untuk menghindari error
    UserModel? user = controller.users.firstWhereOrNull((u) => u.id == userId);

    if (user == null) {
      return Scaffold(
        appBar: AppBar(title: Text('User Detail')),
        body: Center(child: Text('User not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('User Detail')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user.avatar),
            ),
            SizedBox(height: 16),
            Text(
              '${user.firsname} ${user.lastname}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(user.email, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
