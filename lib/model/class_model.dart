class BookClass {
  int id;
  String date;
  String time;
  String availability;

  BookClass({this.id, this.date, this.time, this.availability});

  BookClass.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    time = json['time'];
    availability = json['availability'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['time'] = this.time;
    data['availability'] = this.availability;
    return data;
  }
}
