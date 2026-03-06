package com.Abenezer.characterapi;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface CharacterRepository extends JpaRepository<Character, Long> {

    // Get all characters by affiliation (e.g. "UA High", "Pro Hero")
    List<Character> findByAffiliation(String affiliation);

    // Search characters whose name contains a string
    @Query(value = "SELECT c.* FROM characters c WHERE c.name LIKE %?1%", nativeQuery = true)
    List<Character> findByName(String name);
}
