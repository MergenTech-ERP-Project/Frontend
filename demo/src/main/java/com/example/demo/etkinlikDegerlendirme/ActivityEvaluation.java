package com.example.demo.etkinlikDegerlendirme;


import javax.persistence.*;

@Entity
@Table(name="activityevaluation", schema="public")
public class ActivityEvaluation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private Long activityId;

    @Column
    private Long userId;

    @Column
    private String evaluation;

    public ActivityEvaluation() {

    }

    public ActivityEvaluation(Long activityId, Long userId, String evaluation) {
        this.activityId = activityId;
        this.userId = userId;
        this.evaluation = evaluation;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getActivityId() {
        return activityId;
    }

    public void setActivityId(Long activityId) {
        this.activityId = activityId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getEvaluation() {
        return evaluation;
    }

    public void setEvaluation(String evaluation) {
        this.evaluation = evaluation;
    }
}
