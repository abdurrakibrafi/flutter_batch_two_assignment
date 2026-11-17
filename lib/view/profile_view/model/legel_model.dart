class LegalModel {
  LegalModel({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  Data? data;

  factory LegalModel.fromJson(Map<String, dynamic> json) {
    return LegalModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }
}

class Data {
  Data({
    this.content,
    this.html,
    this.title,
  });

  String? content;
  String? html;
  String? title;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      content: json["content"],
      html: json["html"],
      title: json["title"],
    );
  }
}
