package com.example.demo.etkinlik;

import javax.persistence.*;

@Entity
@Table(name= "activity", schema="public")
public class Activity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private String name;

    @Column
    private String place;

    @Column
    private String datetime;

    @Column
    private String organizator;

    public Activity() {

    }

    public Activity(String name, String place, String datetime, String organizator) {
        this.name = name;
        this.place = place;
        this.datetime = datetime;
        this.organizator = organizator;
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

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public String getOrganizator() {
        return organizator;
    }

    public void setOrganizator(String organizator) {
        this.organizator = organizator;
    }
}
