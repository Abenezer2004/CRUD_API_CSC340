package com.Abenezer.characterapi;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class CharacterService {

    private final CharacterRepository characterRepository;

    public CharacterService(CharacterRepository characterRepository) {
        this.characterRepository = characterRepository;
    }

    public List<Character> getAllCharacters() {
        return characterRepository.findAll();
    }

    public Character getCharacterById(Long id) {
        return characterRepository.findById(id).orElse(null);
    }

    public Character createCharacter(Character character) {
        return characterRepository.save(character);
    }

    public Character updateCharacter(Long id, Character updatedCharacter) {
        return characterRepository.findById(id)
            .map(character -> {
                character.setName(updatedCharacter.getName());
                character.setDescription(updatedCharacter.getDescription());
                character.setQuirk(updatedCharacter.getQuirk());
                character.setHeroRank(updatedCharacter.getHeroRank());
                character.setAffiliation(updatedCharacter.getAffiliation());
                character.setPowerLevel(updatedCharacter.getPowerLevel());
                return characterRepository.save(character);
            })
            .orElse(null);
    }

    public void deleteCharacter(Long id) {
        characterRepository.deleteById(id);
    }

    public List<Character> getCharactersByAffiliation(String affiliation) {
        return characterRepository.findByAffiliation(affiliation);
    }

    public List<Character> searchCharactersByName(String name) {
        return characterRepository.findByName(name);
    }
}