// model register
class ModelRegister {
  String? email;
  String? password;
  String? name;

  ModelRegister({required this.email,required this.password,required this.name});

  ModelRegister.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = email;
    data['password'] = password;
    data['name'] = name;
    return data;
  }
}