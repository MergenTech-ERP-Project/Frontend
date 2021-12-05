package com.example.demo.kullanıcı;

import javax.persistence.*;

@Entity
@Table(name="user", schema = "public")
public class User {
    @Id
    @Column
    private Integer id;

    @Column
    private String name;

    @Column
    private String title;

    public User() {
    }

    public User(String name, String title) {
        this.name = name;
        this.title = title;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
