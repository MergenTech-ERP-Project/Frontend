package com.example.demo.etkinlik;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("activity")
public class ActivityController {

    @Autowired
    private ActivityRepository activityRepository;

    @GetMapping("activities")
    public List<Activity> getActivityList() {
        return (List<Activity>) activityRepository.findAll();
    }

    @GetMapping("activities/{id}")
    public Optional<Activity> getActivityById(@PathVariable Long id) {
        return activityRepository.findById(id);
    }

    @PostMapping("post")
    public String createActivity(@RequestBody Activity activity) {
        activityRepository.save(activity);
        return  activity.getName() + " Saved Succesfully";
    }

    @PutMapping("put/{id}")
    public String updateActivity(@PathVariable Long id, @RequestBody Activity activity) {
        activityRepository.save(activity);
        return activity.getName() + " updated!";
    }

    @DeleteMapping("delete/{id}")
    public String deleteActivity(@PathVariable() Long id) {
        activityRepository.deleteById(id);
        return id + "th Activity deleted!";
    }
}
