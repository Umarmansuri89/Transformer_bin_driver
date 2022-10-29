class Contect_us_model{
  String location;
  String company_name;
  String email;
  String contact_number;
  String address;



  Contect_us_model({
    this.location = "",
    this.company_name = "",
    this.contact_number = "",
    this.address = "",
    this.email = "",
  });

  factory Contect_us_model.fromJson(Map<String, dynamic> json) => Contect_us_model(
    location: json["location"] ?? "",
    company_name: json["company_name"] ?? "",
    contact_number: json["contact_number"] ?? "",
    address: json["address"] ?? "",
    email: json["email"] ?? "",

  );

  Map<String, dynamic> toJson() => {
    "location": location,
    "company_name": company_name,
    "contact_number": contact_number,
    "address": address,
    "email": email,
  };
}
