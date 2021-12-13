import 'dart:convert';

List<Activity> activityFromJson(String str) =>
    List<Activity>.from(json.decode(utf8.decode(utf8.encode(str))).map((x) => Activity.fromMap(x)));

String activityToJson(List<Activity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJsonWithId())));

class Activity {
  final int id;
  final String name;
  final String place;
  final String datetime;
  final String organizator;

  Activity({
    required this.id,
    required this.name,
    required this.place,
    required this.datetime,
    required this.organizator,
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
        'name': name,
        'place': place,
        'datetime': datetime,
        'organizator': organizator,
      };

  Map toJsonWithId() => {
        "id": id,
        'name': name,
        'place': place,
        'datetime': datetime,
        'organizator': organizator,
      };
}
