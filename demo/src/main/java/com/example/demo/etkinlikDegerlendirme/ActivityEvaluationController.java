package com.example.demo.etkinlikDegerlendirme;

import com.example.demo.kullanıcı.User;
import com.example.demo.kullanıcı.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;


//ae -> activity evaluation
@RestController
@RequestMapping("ae")
public class ActivityEvaluationController {

    @Autowired
    private ActivityEvaluationRepository activityEvaluationRepository;

    @GetMapping("aes")
    public List<ActivityEvaluation> getActivityEvaluationList(){
        return (List<ActivityEvaluation>) activityEvaluationRepository.findAll();
    }

    @GetMapping("aes/{id}")
    public Optional<ActivityEvaluation> getActivityEvaluationById(@PathVariable Long id){

        return activityEvaluationRepository.findById(id);
    }

    @PostMapping("post")
    public String createActivityEvaluation(@RequestBody ActivityEvaluation activityEvaluation){
        activityEvaluationRepository.save(activityEvaluation);
        return activityEvaluation.getEvaluation() + " Saved Successfully";
    }

    @PutMapping("put/{id}")
    public String updateActivityEvaluation(@PathVariable Long id, @RequestBody ActivityEvaluation activityEvaluation){
        activityEvaluationRepository.save(activityEvaluation);
        return activityEvaluation.getEvaluation() + " updated!";
    }

    @DeleteMapping("delete/{id}")
    public String deleteActivityEvaluation(@PathVariable() Long id){
        activityEvaluationRepository.deleteById(id);
        return id + "th Activity Evaluation deleted!";
    }
}

