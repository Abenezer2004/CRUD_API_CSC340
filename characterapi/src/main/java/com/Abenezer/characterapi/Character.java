package com.Abenezer.characterapi;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "characters")
public class Character {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long characterId;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String description;

    private String quirk;
    private String heroRank;
    private String affiliation;
    private int powerLevel;

    public Character() {}

    public Character(String name, String description, String quirk, String heroRank, String affiliation, int powerLevel) {
        this.name = name;
        this.description = description;
        this.quirk = quirk;
        this.heroRank = heroRank;
        this.affiliation = affiliation;
        this.powerLevel = powerLevel;
    }

    public Long getCharacterId() {
         return characterId; 
    }
    public void setCharacterId(Long characterId) {
         this.characterId = characterId;
    }

    public String getName() {
         return name; 
    }
    public void setName(String name) 
    { this.name = name; 
        
    }

    public String getDescription() {
         return description; 
    }
    public void setDescription(String description) {
         this.description = description; 
    }

    public String getQuirk() {
         return quirk; 
    }
    public void setQuirk(String quirk) {
         this.quirk = quirk;
    }

    public String getHeroRank() {
         return heroRank; 
    }
    public void setHeroRank(String heroRank) {
         this.heroRank = heroRank; 
    }

    public String getAffiliation() {
         return affiliation;
    }
    public void setAffiliation(String affiliation) {
         this.affiliation = affiliation; 
    }

    public int getPowerLevel() {
         return powerLevel; 
    }
    public void setPowerLevel(int powerLevel) { 
         this.powerLevel = powerLevel; 
    }
    
}