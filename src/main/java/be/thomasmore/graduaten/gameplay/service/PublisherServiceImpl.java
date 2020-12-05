package be.thomasmore.graduaten.gameplay.service;

import be.thomasmore.graduaten.gameplay.entity.Publisher;
import be.thomasmore.graduaten.gameplay.repository.PublisherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class PublisherServiceImpl implements PublisherService {
    @Autowired
    PublisherRepository publisherRepository;

    @Override
    public List<Publisher> getPublishers() {
        return publisherRepository.findAll();
    }

    @Override
    public Boolean addPublisher(Publisher publisher) {

        try {
            publisherRepository.save(publisher);
            return true;
        }
        catch (Exception e){ return false; }
    }

    @Override
    public List<Publisher> getPublisherByName(String name) {
        return publisherRepository.findByName(name);
    }

    @Override
    public Publisher getPublisherById(Long id) {
        return publisherRepository.getOne(id);
    }


}