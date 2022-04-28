class UserModel {
  late String user_id;
  late String user_name;
  late String email;
  late String password;
  late String lat;
  late String lon;

  UserModel(this.user_id, this.user_name, this.email, this.password, this.lat, this.lon);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'user_id': user_id,
      'user_name': user_name,
      'email': email,
      'password': password,
      'lat':lat,
      'lon':lon,
    };
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    user_id = map['user_id'];
    user_name = map['user_name'];
    email = map['email'];
    password = map['password'];
    lat = map['lat'];
    lon = map['lon'];
  }
}