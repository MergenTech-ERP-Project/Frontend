import 'dart:convert';

List<ActiveToUser> activeToUserFromJson(String str) =>
    List<ActiveToUser>.from(json.decode(str).map((x) => ActiveToUser.fromMap(x)));

String activeToUserToJson(List<ActiveToUser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJsonWithId())));

class ActiveToUser{
  final int id;
  final int activityId;
  final int userId;

  ActiveToUser({
    this.id = 0,
    this.activityId = 0,
    this.userId = 0,
  });

  factory ActiveToUser.fromMap(Map activeToUserMap) {
    return ActiveToUser(
      id: activeToUserMap['id'],
      activityId: activeToUserMap['activityId'],
      userId: activeToUserMap['userId'],
    );
  }

  Map toJson() => {
    'activityId': activityId,
    'userId': userId,
  };

  Map toJsonWithId() => {
    "id": id,
    'activityId': activityId,
    'userId': userId,
  };
}
