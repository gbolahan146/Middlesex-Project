class Reminder {
  String takeMeds;
  String timeRem;
  String repeat;
  String notes;
  int remId;

  Reminder({
    this.takeMeds,
    this.timeRem,
    this.repeat,
    this.notes,
    this.remId
  });

  Reminder.fromJson(Map<String, dynamic> json) {
    takeMeds = json['takeMeds'];
    timeRem = json['timeRem'];
    notes = json['notes'];
    repeat = json['repeat'];
    remId = json['remId'];
  }

  Map<String, dynamic> toJson() {
    var data = Map<String, dynamic>();
    data['takeMeds'] = this.takeMeds;
    data['notes'] = this.notes;
    data['repeat'] = this.repeat;
    data['timeRem'] = this.timeRem;
    return data;
  }
}
