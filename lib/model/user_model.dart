class UserResponse {
  User? user;
  String? accessToken;
  String? tokenType;

  UserResponse({this.user, this.accessToken, this.tokenType});

  UserResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['access_token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? profileUrl;

  User({this.id, this.name, this.email, this.profileUrl});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profileUrl = json['profile_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['profile_url'] = this.profileUrl;
    return data;
  }
}
