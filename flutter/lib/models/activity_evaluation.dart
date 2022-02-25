import 'dart:convert';

List<ActivityEvaluation> activityEvaluationFromJson(String str) =>
    List<ActivityEvaluation>.from(
        json.decode(str).map((x) => ActivityEvaluation.fromMap(x)));

String activityToJson(List<ActivityEvaluation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJsonWithId())));

class ActivityEvaluation {
  final int id;
  final int activityId;
  final int userId;
  final String evaluation;

  ActivityEvaluation(
      {required this.id,
      required this.activityId,
      required this.userId,
      required this.evaluation});

  factory ActivityEvaluation.fromMap(Map activityEvaluationMap) {
    return ActivityEvaluation(
      id: activityEvaluationMap['id'],
      activityId: activityEvaluationMap['activities_id'],
      userId: activityEvaluationMap['users_id'],
      evaluation: activityEvaluationMap['evaluation'],
    );
  }

  Map toJson() => {
        'activities_id': activityId,
        'users_id': userId,
        'evaluation': evaluation,
      };
  Map toJsonWithId() => {
        "id": id,
        'activities_id': activityId,
        'users_id': userId,
        'evaluation': evaluation,
      };
}
