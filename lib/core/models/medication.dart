
class Medication {
  String medication;
  int id;

  Medication({
    this.medication,
    this.id,
  });

  Medication.fromJson(Map<String, dynamic> json) {
    medication = json['medication'];
    id = json['medID'];
  }

  Map<String, dynamic> toJson() {
    var data = Map<String, dynamic>();
    data['medication'] = this.medication;
    return data;
  }
}
