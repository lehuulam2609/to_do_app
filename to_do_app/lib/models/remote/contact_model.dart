class ContactModel {
  int id;
  String name;
  String number;

  ContactModel({
    this.id,
    this.name,
    this.number,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: int.tryParse((json['id'] ?? '').toString()),
      name: (json["name"] ?? '').toString(),
      number: (json["number"] ?? '').toString(),
    );
  }
}