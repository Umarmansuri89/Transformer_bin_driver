class Year_Model{
  int year;

  Year_Model({
    this.year = 0,
  });

  factory Year_Model.fromJson(Map<String, dynamic> json) => Year_Model(
    year: json["year"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "year": year,
  };
}
