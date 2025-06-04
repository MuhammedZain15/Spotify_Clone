class CreateUserRequestModel {
  final String? fullName;
  final String email;
  final String password;

  CreateUserRequestModel({
    this.fullName,
    required this.email,
    required this.password,
  });
}
