package com.example.demo.etkinlik;

import javax.persistence.*;

@Entity
@Table(name= "activity", schema="public")
public class Activity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column
    private String name;

    @Column
    private String place;

    @Column
    private String time;

    @Column
    private String date;

    @Column
    private String personOrganization;

    public Activity() {

    }

    public Activity(String name, String place, String time, String date, String personOrganization) {
        this.name = name;
        this.place = place;
        this.time = time;
        this.date = date;
        this.personOrganization = personOrganization;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getPersonOrganization() {
        return personOrganization;
    }

    public void setPersonOrganization(String personOrganization) {
        this.personOrganization = personOrganization;
    }
}
