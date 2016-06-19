/*********************************************************//**
** @file ImageSource.h
** ImageSource interface.
** 
** @date 10/2010
** @author Yooyoung Lee 
**
** Note: Please send BUG reports to yooyoung@<NOSPAM>nist.gov.
** For more information, refer to: http://www.nist.gov/itl/iad/ig/vasir.cfm
**
** @par Disclaimer
** This software was developed at the National Institute of Standards 
** and Technology (NIST) by employees of the Federal Government in the
** course of their official duties. Pursuant to Title 17 Section 105 
** of the United States Code, this software is not subject to copyright 
** protection and is in the public domain. NIST assumes no responsibility 
** whatsoever for use by other parties of its source code or open source 
** server, and makes no guarantees, expressed or implied, about its quality, 
** reliability, or any other characteristic.
**************************************************************/
#ifndef IMAGE_SOURCE_H
#define IMAGE_SOURCE_H

/**
 * Abstract class that defines the methods an image source, i.e. provider,
 * needs to implement.
 */
class ImageSource
{
public:
  /**
   * This method should returns a single sentence describing the image source.
   */
  virtual const char* getDescription() const = 0;
  
  /**
   * This method should return the number of available images.
   *
   * @return Number of available images (>= 0)
   */
  virtual int getNumberOfImages() const = 0;

   /**
   * This method should return \c true in case there are more images that can
   * be fetched using getNextImage()
   *
   * @return \c true = one or more images available, \c false = no images
   */
  virtual bool hasNextImage() = 0;

  /**
   * This method should return the next image.
   *
   * @note The deallocation of the returned image is up to the program.
   *
   * @return Next image, or \c NULL in case of an error or if there is not any
   *    image left for processing
   */
  virtual IplImage* getNextImage() = 0;
};

#endif // !IMAGE_SOURCE_H
