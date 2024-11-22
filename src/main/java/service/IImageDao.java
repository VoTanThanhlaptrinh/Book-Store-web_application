package service;

import java.awt.Image;
import java.util.List;

import models.User;

public interface IImageDao {
	List<Image> getUsers();

	User findByImageId(int imageId);

	void saveImage(Image image);

	void updateImage(Image image);
	
}
