class EmergencyContactsModel {
  String emergencyName;
  String emergencyNumber;
  String emergencyRelation;


  EmergencyContactsModel({
    this.emergencyName,
    this.emergencyNumber,
    this.emergencyRelation,

  });

  EmergencyContactsModel.fromJson(Map<String, dynamic> json) {
    emergencyName = json['emergencyName'];
    emergencyNumber = json['emergencyNumber'];
    emergencyRelation = json['emergencyRelation'];

  }

  Map<String, dynamic> toJson() {
    var data = Map<String, dynamic>();
    data['emergencyName'] = this.emergencyName;
    data['emergencyNumber'] = this.emergencyNumber;
    data['emergencyRelation'] = this.emergencyRelation;

    return data;
  }
}
