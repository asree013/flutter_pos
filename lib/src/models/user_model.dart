class UserLoginModel {
  late final String email;
  late final String password;

  UserLoginModel(this.email, this.password);

}

class UserModel {
  late final String id;
  late final String email;
  late final String first_name;
  late final String last_name;
  late final String image;
  late final String address;
  

  UserModel(this.id, this.first_name, this.address, this.email, this.image, this.last_name);

  factory UserModel.fromJson(Map<String, dynamic> json) {
     return UserModel(
      json['id'] as String,
      json['first_name'] as String,
      json['address'] as String,
      json['email'] as String,
      json['image'] as String,
      json['last_name'] as String,
    );
  }
}