package daoInterface;

import models.Image;

public interface IImageDao {

	Image findByImageId(int imageId);

	void updateImage(Image image);

	void deleteImage(Image image);

	int saveImage(Image image);
}
