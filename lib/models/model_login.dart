// model Login
class ModelLogin {
  String? email;
  String? name;

  ModelLogin({required this.email,required this.name});

  ModelLogin.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = email;
    data['name'] = name;
    return data;
  }
}