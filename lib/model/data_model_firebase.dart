class DataModelFirebase {
  String name;
  String time;
  String date;

  DataModelFirebase.fromFirebase(Map<String, dynamic> map) {
    this.name = map['name'];
    this.time = map['time'];
    this.date = map['date'];
  }
}
