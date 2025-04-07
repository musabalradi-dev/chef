class UsersModel{
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? token;

  UsersModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.token,
  });

  UsersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['token'] = token;
    return data;
  }

}