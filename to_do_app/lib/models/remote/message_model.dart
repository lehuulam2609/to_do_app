class MessageModel {
  int code;
  String message;

  MessageModel({
    this.code,
    this.message,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      code: int.parse((json['code'] ?? '').toString()),
      message: json["message"] ?? '',
    );
  }
}