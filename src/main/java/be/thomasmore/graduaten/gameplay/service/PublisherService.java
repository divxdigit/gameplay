package be.thomasmore.graduaten.gameplay.service;
import java.util.List;
import be.thomasmore.graduaten.gameplay.entity.Publisher;
import org.springframework.stereotype.Service;

import java.util.List;

public interface PublisherService {
    List<Publisher> getPublishers();
    List<Publisher> getPublisherByName(String name);
    Publisher getPublisherById(Long id);
    Publisher addPublisher(Publisher publisher);

}
