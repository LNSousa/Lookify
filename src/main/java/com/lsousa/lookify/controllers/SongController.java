package com.lsousa.lookify.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lsousa.lookify.models.Song;
import com.lsousa.lookify.services.SongService;

import jakarta.validation.Valid;

@Controller
public class SongController {
	@Autowired
	private SongService service;
	
	// ========== Display ========================

    // Get Requests
	@GetMapping("/")
	public String index () {
		return "index.jsp";
	}
	
	@GetMapping("/dashboard")
	public String dashboard(Model model) {
		List<Song> allSongs = service.getAll();
		
		model.addAttribute("songs", allSongs);
		
		return "dashboard.jsp";
	}
	
	@GetMapping("/songs/new")
	public String newSong(@ModelAttribute("song") Song song) {
		
		return "new.jsp";
	}
	
	@GetMapping("/songs/{id}")
	public String details(@PathVariable("id") Long id, Model model) {
		model.addAttribute("song", service.getOne(id));
		return "details.jsp";
	}
	
	@GetMapping("/search")
	public String searchResults(@RequestParam(value="q") String search, Model model) {
		model.addAttribute("artist", search.replace("+", " "));
		model.addAttribute("results", service.searchAll(search));
		return "search.jsp";
	}
	
	@GetMapping("/songs/top")
	public String topSongs(Model model) {
		List<Song> sortedSongs = service.getAll();
		sortedSongs.sort((o1, o2) -> o2.getRating().compareTo(o1.getRating()));
		
		model.addAttribute("sortedSongs", sortedSongs);
		
		return "top.jsp";
	}
    

// ========== Action =========================

    // POST, PUT, DELETE requests
	@PostMapping("/songs/new")
	public String newSong(@Valid @ModelAttribute("song") Song song, BindingResult result, Model model) {
		model.addAttribute("songs", service.getAll());
		if (result.hasErrors()) {
			return "new.jsp";
		}
		
		service.save(song);
		
		return "redirect:/dashboard";
	}
	
	@DeleteMapping("/songs/{id}/delete")
	public String deleteSong(@PathVariable("id") Long id) {
		service.deleteOne(id);
		
		return "redirect:/dashboard";
	}
	
	@PostMapping("/search") 
	public String searchForSong(@ModelAttribute("search") String search) {
		return "redirect:/search?q=" + search.replace(' ', '+');
	}
}
