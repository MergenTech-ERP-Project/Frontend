import 'dart:convert';

List<ActiveToUser> activeToUserFromJson(String str) => List<ActiveToUser>.from(
    json.decode(str).map((x) => ActiveToUser.fromMap(x)));

String activeToUserToJson(List<ActiveToUser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ActiveToUser {
  final int activity_ids;
  final int user_ids;

  ActiveToUser({
    this.activity_ids = 0,
    this.user_ids = 0,
  });

  factory ActiveToUser.fromMap(Map activeToUserMap) {
    return ActiveToUser(
      activity_ids: activeToUserMap['activity_ids'],
      user_ids: activeToUserMap['user_ids'],
    );
  }

  Map toJson() => {
        'activity_ids': activity_ids,
        'userId': user_ids,
      };
}
