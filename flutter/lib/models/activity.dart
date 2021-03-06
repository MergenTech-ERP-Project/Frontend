import 'dart:convert';

List<Activity> activityFromJson(String str) =>
    List<Activity>.from(json.decode(str).map((x) => Activity.fromMap(x)));

String activityToJson(List<Activity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Activity {
  final int id;
  String? name;
  String? place;
  String? datetime;
  String? organizator;

  Activity({
    required this.id,
    this.name = "",
    this.place = "",
    this.datetime = "",
    this.organizator = "",
  });

  factory Activity.fromMap(Map activityMap) {
    return Activity(
      id: activityMap['id'],
      name: activityMap['name'],
      place: activityMap['place'],
      datetime: activityMap['datetime'],
      organizator: activityMap['organizator'],
    );
  }

  Map toJson() => {
        "id": id,
        'name': name,
        'place': place,
        'datetime': datetime,
        'organizator': organizator,
      };
}
