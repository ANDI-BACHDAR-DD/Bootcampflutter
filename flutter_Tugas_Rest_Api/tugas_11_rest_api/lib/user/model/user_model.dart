class UserModel {
  final int id;
  final String email;
  final String firsname;
  final String lastname;
  final String avatar;
  UserModel(
      {required this.id,
      required this.email,
      required this.firsname,
      required this.lastname,
      required this.avatar});

  factory UserModel.fromjson(Map<String, dynamic> json) => UserModel(
      id: json['id'],
      email: json['email'],
      firsname: json['first_name'],
      lastname: json['last_name'],
      avatar: json['avatar']);
}
//  "id": 7,
//             "email": "michael.lawson@reqres.in",
//             "first_name": "Michael",
//             "last_name": "Lawson",
//             "avatar": "https://reqres.in/img/faces/7-image.jpg"