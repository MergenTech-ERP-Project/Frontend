import 'dart:convert';

List<ActivityEvaluation> activityEvaluationFromJson(String str) =>
    List<ActivityEvaluation>.from(json.decode(utf8.decode(utf8.encode(str))).map((x) => ActivityEvaluation.fromMap(x)));

String activityToJson(List<ActivityEvaluation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJsonWithId())));

class ActivityEvaluation {
  final int id;
  final int activityId;
  final int userId;
  final String evaluation;

  ActivityEvaluation({
    required this.id,
    required this.activityId,
    required this.userId,
    required this.evaluation
  });

  factory ActivityEvaluation.fromMap(Map activityEvaluationMap) {
    return ActivityEvaluation(
      id: activityEvaluationMap['id'],
      activityId: activityEvaluationMap['activityId'],
      userId: activityEvaluationMap['userId'],
      evaluation: activityEvaluationMap['evaluation'],
    );
  }

  Map toJson() => {
    'activityId': activityId,
    'userId': userId,
    'evaluation': evaluation,
  };
  Map toJsonWithId() => {
    "id": id,
    'activityId': activityId,
    'userId': userId,
    'evaluation': evaluation,
  };
}
