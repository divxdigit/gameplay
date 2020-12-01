package be.thomasmore.graduaten.gameplay.service;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface FileService {

    void saveFile(String uploadDir, String fileName, MultipartFile multipartFile) throws IOException;

}