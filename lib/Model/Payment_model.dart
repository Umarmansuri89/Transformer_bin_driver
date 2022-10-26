class Payment_Model{
  int id;
  String name;

  Payment_Model({
    this.id = 0,
    this.name = "",
  });

  factory Payment_Model.fromJson(Map<String, dynamic> json) => Payment_Model(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
