class My_jobs_model {
  String id;
  String delivery_date;
  String pickup_date;
  String customer_name;
  String customer_email;
  String customer_mobile;
  String customer_address;
  String delivery_status;
  String order_number;
  String order_amount;
  String order_status;
  String payment_status;
  String payment_mode;
  String driver_name;
  String driver_id;
  String driver_mobile;
  String driver_email;
  String created_at;
  String created_by;
  String job_status;
  String updated_at;
  String updated_by;
  String latitude;
  String longitude;
  String bin_id;
  String bin_name;
  String bin_size;




  My_jobs_model({

    this.id = "",
    this.bin_id = "",
    this.bin_name = "",
    this.bin_size = "",
    this.created_at = "",
    this.created_by = "",
    this.customer_address = "",
    this.customer_email = "",
    this.customer_mobile = "",
    this.customer_name = "",
    this.delivery_date = "",
    this.delivery_status = "",
    this.driver_email = "",
    this.driver_id = "",
    this.driver_mobile = "",
    this.driver_name = "",
    this.job_status = "",
    this.latitude = "",
    this.longitude = "",
    this.order_amount = "",
    this.order_number = "",
    this.order_status = "",
    this.payment_mode = "",
    this.payment_status = "",
    this.pickup_date = "",
    this.updated_at = "",
    this.updated_by = "",
  });

  factory My_jobs_model.fromJson(Map<String, dynamic> json) => My_jobs_model(

    bin_id: json["bin_id"] ?? "",
    bin_name: json["bin_name"] ?? "",
    bin_size: json["bin_size"] ?? "",
    id: json["id"] ?? "",
    created_at: json["created_at"] ?? "",
    created_by: json["created_by"] ?? "",
    customer_address: json["customer_address"] ?? "",
    customer_email: json["customer_email"] ?? "",
    customer_mobile: json["customer_mobile"] ?? "",
    customer_name: json["customer_name"] ?? "",
    delivery_date: json["delivery_date"] ?? "",
    delivery_status: json["delivery_status"] ?? "",
    driver_email: json["driver_email"] ?? "",
    driver_id: json["driver_id"] ?? "",
    driver_mobile: json["driver_mobile"] ?? "",
    driver_name: json["driver_name"] ?? "",
    job_status: json["job_status"] ?? "",
    latitude: json["latitude"] ?? "",
    longitude: json["longitude"] ?? "",
    order_amount: json["order_amount"] ?? "",
    order_number: json["order_number"] ?? "",
    order_status: json["order_status"] ?? "",
    payment_mode: json["payment_mode"] ?? "",
    payment_status: json["payment_status"] ?? "",
    pickup_date: json["pickup_date"] ?? "",
    updated_at: json["updated_at"] ?? "",
    updated_by: json["updated_by"] ?? "",

  );

  Map<String, dynamic> toJson() => {

    "bin_id": bin_id,
    "bin_name": bin_name,
    "bin_size": bin_size,
    "id": id,
    "delivery_date": delivery_date,
    "pickup_date": pickup_date,
    "customer_name": customer_name,
    "customer_email": customer_email,
    "customer_mobile": customer_mobile,
    "customer_address": customer_address,
    "delivery_status": delivery_status,
    "order_number": order_number,
    "order_amount": order_amount,
    "order_status": order_status,
    "payment_status": payment_status,
    "payment_mode": payment_mode,
    "driver_name": driver_name,
    "driver_id": driver_id,
    "driver_mobile": driver_mobile,
    "driver_email": driver_email,
    "created_at": created_at,
    "created_by": created_by,
    "updated_at": updated_at,
    "updated_by": updated_by,
    "job_status": job_status,
    "latitude": latitude,
    "longitude": longitude

  };
}
