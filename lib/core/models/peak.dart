class Peak {
  String day;
  int value;
  int id;

  Peak({
    this.day,
    this.value,
    this.id,
  });

  Peak.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    value = json['value'];
    
  }

  Map<String, dynamic> toJson() {
    var data = Map<String, dynamic>();
    data['day'] = this.day;
    data['value'] = this.value;
    data['id'] = this.id;
    return data;
  }
}
