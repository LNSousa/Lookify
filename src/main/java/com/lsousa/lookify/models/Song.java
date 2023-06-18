package com.lsousa.lookify.models;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "songs")
public class Song {

	// ========== Primary Key ===================

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	// ========== Member Variables ==============

	// @NotNull
	// @Size(min=1, message="")
	// private String name;
	
	@NotNull
	@Size(min=5, message="Song title must have at least 5 characters")
	private String title;

	@NotNull
	@Size(min=5, message="Song artist must have at least 5 characters")
	private String artist;

	@NotNull
	@Min(value=1, message="Rating must be between 1 and 10")
	@Max(value=10, message="Rating must be between 1 and 10")
	private Integer rating;

	// ========== Data Creation Trackers ========

	@Column(updatable = false)
	private Date createdAt;
	private Date updatedAt;

	// ========== Constructors ==================

	// Empty constructor
	// public <MODEL_NAME>() {}
	public Song() {}

	// ========== Data Creation Event ===========

	@PrePersist
	protected void onCreate() {
	    this.createdAt = new Date();
	}

	@PreUpdate
	protected void onUpdated() {
	    this.updatedAt = new Date();
	}

	// ========== Getters and Setters ===========
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}

	public Integer getRating() {
		return rating;
	}

	public void setRating(Integer rating) {
		this.rating = rating;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
}
