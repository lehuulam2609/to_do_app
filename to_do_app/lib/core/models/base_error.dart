class BaseError extends Error implements Exception {
  int code;
  String message;

  BaseError({
    this.code,
    this.message,
  });

  factory BaseError.fromJson(Map<String, dynamic> json) => BaseError(
        code: json["errorCode"],
        message: json["errorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "errorCode": code,
        "errorMessage": message,
      };
}
