class AppointmentModel {
  int? id;
  String? name;
  String? type;
  String? fromTime;
  String? toTime;

  AppointmentModel({this.id, this.name, this.type, this.fromTime, this.toTime});

  AppointmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
  }

}