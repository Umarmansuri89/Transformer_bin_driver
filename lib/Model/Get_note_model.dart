class Get_node_model{
  String id;
  String note;
  String job_id;
  String driver_id;
  String date;

  Get_node_model({
    this.id = "",
    this.note = "",
    this.job_id = "",
    this.driver_id = "",
    this.date = "",

  });

  factory Get_node_model.fromJson(Map<String, dynamic> json) => Get_node_model(
    id: json["id"] ?? "",
    note: json["note"] ?? "",
    job_id: json["job_id"] ?? "",
    driver_id: json["driver_id"] ?? "",
    date: json["date"] ?? "",

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "note": note,
    "job_id": job_id,
    "driver_id": driver_id,
    "date": date,

  };
}
