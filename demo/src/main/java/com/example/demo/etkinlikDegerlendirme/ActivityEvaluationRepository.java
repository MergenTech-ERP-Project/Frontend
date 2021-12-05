package com.example.demo.etkinlikDegerlendirme;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ActivityEvaluationRepository extends CrudRepository<ActivityEvaluation, Integer> {
}
