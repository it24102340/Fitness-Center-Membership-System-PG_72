package com.fitness.repository;

import com.fitness.model.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Repository
public interface MemberRepository extends JpaRepository<Member, Long> {
    List<Member> findByMembershipEndDateBeforeAndStatus(LocalDate date, String status);
    Optional<Member> findByEmail(String email);
    boolean existsByEmail(String email);
    List<Member> findByStatus(String status);
} 