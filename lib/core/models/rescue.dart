
class Rescue {
  String title;
  int id;

  Rescue({
    this.title,
    this.id,
  });

   Rescue.fromJson(Map<String, dynamic> json) {
    title = json['rescue'];
    id = json['resId'];
  }

  Map<String, dynamic> toJson() {
    var data = Map<String, dynamic>();
    data['rescue'] = this.title;
    return data;
  }
}
