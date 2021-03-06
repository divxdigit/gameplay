package be.thomasmore.graduaten.gameplay.service;

import be.thomasmore.graduaten.gameplay.entity.Genre;
import be.thomasmore.graduaten.gameplay.repository.GenreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GenreServiceImpl implements GenreService{
    @Autowired
    GenreRepository genreRepository;

    @Override
    public List<Genre> getGenres() {
        return genreRepository.findAll();
    }

    @Override
    public Boolean addGenre(Genre genre) {
        try {
            genreRepository.save(genre);
            return true;
        }
        catch (Exception e){ return false; }
     }

    @Override
    public List<Genre> getGenreByName(String name) {
        return genreRepository.findByName(name);
    }

    @Override
    public Genre getGenreById(Long id) {
        return genreRepository.getOne(id);
    }
}

