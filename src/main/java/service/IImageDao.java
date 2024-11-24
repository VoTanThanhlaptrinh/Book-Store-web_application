package service;

import models.Image;

public interface IImageDao {

	Image findByImageId(int imageId);

	void saveImage(Image image);

	void updateImage(Image image);
	
	void deleteImage(Image image);
}
