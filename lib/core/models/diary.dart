class Diary {
  String dayQuestion;
  String triggerQuestion;
  String symptomsQuestion;
  String dateHappened;
  String time;
  String moreText;
  int id;

  Diary({
    this.dayQuestion,
    this.triggerQuestion,
    this.symptomsQuestion,
    this.dateHappened,
    this.moreText,
    this.time,
    this.id,
  });

  Diary.fromJson(Map<String, dynamic> json) {
    dayQuestion = json['dayQuestion'];
    triggerQuestion = json['triggerQuestion'];
    symptomsQuestion = json['symptomsQuestions'];
    dateHappened = json['dateHappened'];
    moreText = json['moreText'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    var data = Map<String, dynamic>();
    data['dayQuestion'] = this.dayQuestion;
    data['triigerQuestion'] = this.triggerQuestion;
    data['symptomsQuestion'] = this.symptomsQuestion;
    data['dateHappened'] = this.dateHappened;
    data['moreText'] = this.moreText;
    data['time'] = this.time;
    data['id'] = this.id;
    return data;
  }
}
