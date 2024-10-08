import 'package:flutter/material.dart';
import 'package:tugas_11_rest_api/user/model/user_model.dart';
import 'package:tugas_11_rest_api/user/service/user_service.dart';

class UserDetailPage extends StatefulWidget {
  final int userId;

  const UserDetailPage({Key? key, required this.userId}) : super(key: key);

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  UserModel? user;

  @override
  void initState() {
    super.initState();
    getUserDetail();
  }

  getUserDetail() async {
    user = await UserService().fetchSingleUser(widget.userId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('User Detail')),
      ),
      body: user == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(user!.avatar),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '${user!.firsname} ${user!.lastname}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(user!.email, style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
    );
  }
}
