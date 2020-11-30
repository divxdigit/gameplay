package be.thomasmore.graduaten.gameplay.service;

import be.thomasmore.graduaten.gameplay.entity.Genre;
import be.thomasmore.graduaten.gameplay.entity.UserType;

import java.util.List;

public interface GenreService {
    List<Genre> getGenres();
    List<Genre> getGenreByName(String name);
    Genre getGenreById(Long id);
    Boolean addGenre(Genre genre);
}