class RegisterReqParams {
  final String firstName;
  final String secondName;
  final String email;
  final String phoneNumber;
  final String password;
  final String confirmPassword;
  final double longitude;
  final double latitude;

  RegisterReqParams({
    required this.firstName,
    required this.secondName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
    required this.longitude,
    required this.latitude,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'secondName': secondName,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'confirmPassword': confirmPassword,
      'longitude': longitude,
      'latitude': latitude,
    };
  }

  factory RegisterReqParams.fromJson(Map<String, dynamic> json) {
    return RegisterReqParams(
      firstName: json['first_name'],
      secondName: json['second_name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      password: json['password'],
      confirmPassword: json['confirm_password'],
      longitude: json['longitude'],
      latitude: json['latitude'],
    );
  }
}
