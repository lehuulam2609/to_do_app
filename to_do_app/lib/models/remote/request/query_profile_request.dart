class QueryProfileRequest {
  String username;
  String limit;
  String offset;

  QueryProfileRequest({
    this.limit,
    this.offset,
    this.username,
  });

  Map<String, dynamic> toJson() {
    return {
      "query": [
        {"LoginName": "==${username ?? ''}"}
      ],
      "limit": "100",
      "offset": "1"
    };
  }
}