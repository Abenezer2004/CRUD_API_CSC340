package com.Abenezer.characterapi;

import java.util.Collection;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/characters")
public class CharacterapiController {

    private final CharacterService characterService;

    public CharacterapiController(CharacterService characterService) {
        this.characterService = characterService;
    }

    // GET all characters
    @GetMapping("/")
    public ResponseEntity<Collection<Character>> getAllCharacters() {
        return ResponseEntity.ok(characterService.getAllCharacters());
    }

    // GET character by ID
    @GetMapping("/{id}")
    public ResponseEntity<Character> getCharacterById(@PathVariable Long id) {
        Character character = characterService.getCharacterById(id);
        if (character != null) {
            return ResponseEntity.ok(character);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    // POST create new character
    @PostMapping("/")
    public ResponseEntity<Character> createCharacter(@RequestBody Character character) {
        Character created = characterService.createCharacter(character);
        if (created != null) {
            return ResponseEntity.ok(created);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    // PUT update existing character
    @PutMapping("/{id}")
    public ResponseEntity<Character> updateCharacter(@PathVariable Long id,
                                                      @RequestBody Character updatedCharacter) {
        Character character = characterService.updateCharacter(id, updatedCharacter);
        if (character != null) {
            return ResponseEntity.ok(character);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    // DELETE character by ID
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteCharacter(@PathVariable Long id) {
        characterService.deleteCharacter(id);
        return ResponseEntity.noContent().build();
    }

    // GET characters by affiliation
    @GetMapping("/affiliation/{affiliation}")
    public ResponseEntity<Collection<Character>> getCharactersByAffiliation(
            @PathVariable String affiliation) {
        return ResponseEntity.ok(characterService.getCharactersByAffiliation(affiliation));
    }

    // GET characters by name search
    @GetMapping("/search")
    public ResponseEntity<Collection<Character>> searchCharactersByName(
            @RequestParam(required = false) String name) {
        List<Character> characters;
        if (name != null) {
            characters = characterService.searchCharactersByName(name);
        } else {
            characters = characterService.getAllCharacters();
        }
        return ResponseEntity.ok(characters);
    }
}