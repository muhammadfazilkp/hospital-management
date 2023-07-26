class Userprofile {
  String? mobilenumber;
  String? email;
  String? username;
  String? city;
  String? pincode;
  String? registeryear;

  Userprofile(this.mobilenumber, this.email, this.username, this.city,
      this.pincode, this.registeryear);

  factory Userprofile.fromJson(Map<String, dynamic> json) {
    return Userprofile(
      json['mobilenumber'],
      json['email'],
      json['username'],
      json['city'],
      json['pincode'],
      json['regesteryear'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mobilenumber': mobilenumber,
      'email': email,
      'username': username,
      'city': city,
      'pincode': pincode,
      'regesteryear': registeryear,
    };
  }
}
