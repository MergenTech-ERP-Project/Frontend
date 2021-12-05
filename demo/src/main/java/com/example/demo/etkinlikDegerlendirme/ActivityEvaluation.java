package com.example.demo.etkinlikDegerlendirme;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="activityevaluation", schema="public")
public class ActivityEvaluation {
    @Id
    @Column
    private Integer id;

    @Column
    private Integer activityId;

    @Column
    private Integer userId;

    @Column
    private String evaluation;

    public ActivityEvaluation() {

    }

    public ActivityEvaluation(Integer activityId, Integer userId, String evaluation) {
        this.activityId = activityId;
        this.userId = userId;
        this.evaluation = evaluation;
    }

    public Integer getActivityId() {
        return activityId;
    }

    public void setActivityId(Integer activityId) {
        this.activityId = activityId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getEvaluation() {
        return evaluation;
    }

    public void setEvaluation(String evaluation) {
        this.evaluation = evaluation;
    }
}
