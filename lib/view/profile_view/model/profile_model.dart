class ProfileModel {
  ProfileModel({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  ProfileData? data;

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null ? null : ProfileData.fromJson(json["data"]),
    );
  }
}

class ProfileData {
  ProfileData({
    this.uuid,
    this.firstName,
    this.lastName,
    this.address,
    this.base64Image,
    this.gmail,
    this.isVerified,
    this.createAt,
    this.updateAt,
  });

  String? uuid;
  String? firstName;
  String? lastName;
  String? address;
  String? base64Image;
  String? gmail;
  bool? isVerified;
  DateTime? createAt;
  DateTime? updateAt;

  /// first name + last name
  String get fullName => "${firstName ?? ''} ${lastName ?? ''}".trim();

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      uuid: json["uuid"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      address: json["address"],
      base64Image: json["base64Image"],
      gmail: json["gmail"],
      isVerified: json["is_verified"],
      createAt: DateTime.tryParse(json["create_At"] ?? ""),
      updateAt: DateTime.tryParse(json["update_At"] ?? ""),
    );
  }
}
