package com.lsousa.lookify.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.lsousa.lookify.models.Song;

@Repository
public interface SongRepo extends CrudRepository<Song, Long> {
	List<Song> findAll();
	List<Song> findByArtistContainingIgnoreCase(String search);
}
