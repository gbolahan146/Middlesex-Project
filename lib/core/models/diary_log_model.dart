class DiaryLog {
  String title;
  String time;
  String date;
  String trigger;
  String symptoms;
  String description;
  DiaryLog({
    this.title,
    this.time,
    this.date,
    this.trigger,
    this.symptoms,
    this.description,
  });

  DiaryLog.fromJson(Map<String, dynamic> json) {
    title = json['logtitle'];
    date = json['logDate'];
    time = json['logTime'];
    symptoms = json['logSymptoms'];
    trigger = json['logTriggers'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    var data = Map<String, dynamic>();
    data['title'] = this.title;
    data['logTime'] = this.time;
    data['description'] = this.description;
    data['logDate'] = this.date;
    data['logSymptoms'] = this.symptoms;
    data['logTriggers'] = this.trigger;
    return data;
  }
}
