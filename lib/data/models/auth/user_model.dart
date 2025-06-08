import 'package:e_commerce/domain/entities/auth/user_entity.dart';

class UserModel {
  String? fullName;
  String? email;
  String? imageUrl;

  UserModel({this.fullName, this.email, this.imageUrl});

  UserModel.fromJson(Map<String, dynamic> json) {
    fullName = json['name'];
    email = json['email'];
  }

  UserEntity toEntity() {
    return UserEntity(fullName: fullName, email: email, imageUrl: imageUrl);
  }
}
