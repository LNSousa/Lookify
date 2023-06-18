package com.lsousa.lookify.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lsousa.lookify.models.Song;
import com.lsousa.lookify.repos.SongRepo;

@Service
public class SongService {
	@Autowired
	private SongRepo repo;
	
	// ========== Register and Login =============



	// ========== Create / Update ================

	    public Song save(Song s) {
	        return repo.save(s);
	    }

	// ========== Read ===========================

	    public List<Song> getAll() {
	        return repo.findAll();
	    }

	    public Song getOne (Long id) {
	        Optional<Song> optionalSong = repo.findById(id);

	        if (optionalSong.isPresent()) {
	            return optionalSong.get();
	        } else {
	            return null;
	        }
	    }
	    
	    public List<Song> searchAll(String search) {
	    	return repo.findByArtistContainingIgnoreCase(search);
	    }

	// ========== Delete =========================

	    public void deleteOne (Long id) {
	        repo.deleteById(id);
	    }

	}
