package com.Abenezer.characterapi;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/characters")
public class CharacterUiController {

    private final CharacterService characterService;

    public CharacterUiController(CharacterService characterService) {
        this.characterService = characterService;
    }

    @GetMapping({"", "/"})
    public String getAllCharacters(Model model) {
        model.addAttribute("characterList", characterService.getAllCharacters());
        model.addAttribute("title", "All Characters");
        return "character-list";   // → templates/character-list.ftlh
    }

    @GetMapping("/{id}")
    public String getCharacterById(@PathVariable Long id, Model model) {
        Character character = characterService.getCharacterById(id);
        if (character != null) {
            model.addAttribute("character", character);
            model.addAttribute("title", "Character Details");
        } else {
            model.addAttribute("errorMessage", "Character with ID " + id + " was not found.");
            model.addAttribute("title", "Error");
            return "error";        // → templates/error.ftlh
        }
        return "character-details"; // → templates/character-details.ftlh
    }

    @GetMapping("/add")
    public String showCreateForm(Model model) {
        model.addAttribute("character", new Character());
        model.addAttribute("title", "Add New Character");
        return "character-create"; // → templates/character-create.ftlh
    }

    
    @PostMapping("/")
    public String createCharacter(Character character) {
        Character newCharacter = characterService.createCharacter(character);
        if (newCharacter != null) {
            return "redirect:/characters/" + newCharacter.getCharacterId();
        } else {
            return "redirect:/characters/add?error=true";
        }
    }

   
    @GetMapping("/update/{id}")
    public String showUpdateForm(@PathVariable Long id, Model model) {
        Character character = characterService.getCharacterById(id);
        if (character == null) {
            model.addAttribute("errorMessage", "Character with ID " + id + " was not found.");
            model.addAttribute("title", "Error");
            return "error";
        }
        model.addAttribute("character", character);
        model.addAttribute("title", "Update Character: " + character.getName());
        return "character-update"; // → templates/character-update.ftlh
    }

    
    @PostMapping("/update/{id}")
    public String updateCharacter(@PathVariable Long id, Character updatedCharacter) {
        Character character = characterService.updateCharacter(id, updatedCharacter);
        if (character != null) {
            return "redirect:/characters/" + character.getCharacterId();
        } else {
            return "redirect:/characters/update/" + id + "?error=true";
        }
    }

   
    @GetMapping("/delete/{id}")
    public String deleteCharacter(@PathVariable Long id) {
        characterService.deleteCharacter(id);
        return "redirect:/characters/";
    }

    
    @GetMapping("/search")
    public String searchByName(@RequestParam String name, Model model) {
        model.addAttribute("characterList", characterService.searchCharactersByName(name));
        model.addAttribute("title", "Search Results for: " + name);
        model.addAttribute("searchTerm", name);
        return "character-list";
    }

   
    @GetMapping("/affiliation/{affiliation}")
    public String filterByAffiliation(@PathVariable String affiliation, Model model) {
        model.addAttribute("characterList", characterService.getCharactersByAffiliation(affiliation));
        model.addAttribute("title", "Affiliation: " + affiliation);
        model.addAttribute("filterAffiliation", affiliation);
        return "character-list";
    }

    @GetMapping("/about")
    public String aboutPage(Model model) {
        model.addAttribute("title", "About");
        return "about";
    }
}
