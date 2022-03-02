import 'dart:convert';

List<ActiveToUser> activeToUserFromJson(String str) => List<ActiveToUser>.from(
    json.decode(str).map((x) => ActiveToUser.fromMap(x)));

String activeToUserToJson(List<ActiveToUser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ActiveToUser {
  final int activityId;
  final int userId;

  ActiveToUser({
    this.activityId = 0,
    this.userId = 0,
  });

  factory ActiveToUser.fromMap(Map activeToUserMap) {
    return ActiveToUser(
      userId: activeToUserMap['user_ids'],
      activityId: activeToUserMap['activity_ids'],
    );
  }

  Map toJson() => {
        'user_ids': userId,
        'activity_ids': activityId,
      };
}
