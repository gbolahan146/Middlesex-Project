class User {
  String gender;
  String height;
  String peakflow;
  String image;
  String birthdate;
  String country;
  String ageDiagnosed;
  String triggers;
  String contacts;
  String symptoms;
  String age;
  String fullname;
  String username;
  int id;

  User({
    this.ageDiagnosed,
    this.birthdate,
    this.peakflow,
    this.height,
    this.contacts,
    this.country,
    this.gender,
    this.image,
    this.symptoms,
    this.triggers,
    this.fullname,
    this.username,
    this.age,
    this.id,
  });

  User.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    height = json['height'];
    peakflow = json['peakflow'];
    image = json['image'];
    birthdate = json['birthdate'];
    country = json['country'];
    ageDiagnosed = json['ageDiagnosed'];
    triggers = json['triggers'];
    contacts = json['contacts'];
    fullname = json['fullname'];
    username = json['username'];
    symptoms = json['symptoms'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    var data = Map<String, dynamic>();
    data['gender'] = this.gender;
    data['birthdate'] = this.birthdate;
    data['peakflow'] = this.peakflow;
    data['height'] = this.height;
    data['country'] = this.country;
    data['ageDiagnosed'] = this.ageDiagnosed;
    data['triggers'] = this.triggers;
    data['contacts'] = this.contacts;
    data['image'] = this.image;
    data['symptoms'] = this.symptoms;
    data['image'] = this.image;
    data['username'] = this.username;
    data['fullname'] = this.fullname;
    data['age'] = this.age;
    data['id'] = this.id;
    return data;
  }
}
