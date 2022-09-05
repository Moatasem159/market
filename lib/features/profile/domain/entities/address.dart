class Address{

  int ?id;
  String ?addressName;
  String ?city;
  String ?region;
  String ?details;
  String ?notes;
  int?latitude;
  int?longitude;

  Address(
      {this.id,
      this.addressName,
      this.city,
      this.region,
      this.details,
      this.notes,
      this.latitude,
      this.longitude});
}