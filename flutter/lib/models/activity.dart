import 'dart:convert';

List<Activity> activityFromJson(String str) =>
    List<Activity>.from(json.decode(str).map((x) => Activity.fromMap(x)));

String activityToJson(List<Activity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJsonWithId())));

class Activity {
  final int id;
  final String name;
  final String place;
  final DateTime dateTime;
  final String organizator;

  Activity({
    required this.id,
    required this.name,
    required this.place,
    required this.dateTime,
    required this.organizator,
  });

  factory Activity.fromMap(Map activityMap) {
    return Activity(
      id: activityMap['id'],
      name: activityMap['name'],
      place: activityMap['place'],
      dateTime: activityMap['dateTime'],
      organizator: activityMap['organizator'],
    );
  }

  Map toJson() => {
        'name': name,
        'place': place,
        'dateTime': dateTime,
        'organizator': organizator,
      };

  Map toJsonWithId() => {
        "id": id,
        'name': name,
        'place': place,
        'dateTime': dateTime,
        'organizator': organizator,
      };
}
