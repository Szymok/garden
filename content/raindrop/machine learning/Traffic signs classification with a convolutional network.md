---
raindrop_id: 677261807
---

# Metadata
Source URL:: https://navoshta.com/traffic-signs-classification/
Topics:: #python

---
# Traffic signs classification with a convolutional network

This is my attempt to tackle traffic signs classification problem with a convolutional neural network implemented in TensorFlow (reaching 99.33% accuracy). The highlights of this solution would be data preprocessing, data augmentation, pre-training and skipping connections in the network.

## Highlights

## Note

- The webpage assumes prior knowledge of neural networks and regularization, and uses TensorFlow as a ML framework with dependencies like numpy, matplotlib, and scikit-image.
- The German Traffic Sign Dataset is used, which consists of 39,209 32x32 px color images for training and 12,630 images for testing. Each image represents a traffic sign belonging to one of 43 classes.
- The images are represented as 32x32x3 arrays of pixel intensities in RGB color space, with values ranging from 0 to 255. The class of each image is encoded as an integer from 0 to 42.## Note

- The webpage assumes prior knowledge of neural networks and regularization, and uses TensorFlow as a ML framework with dependencies like numpy, matplotlib, and scikit-image.
- The German Traffic Sign Dataset is used, which consists of 39,209 32x32 px color images for training and 12,630 images for testing. Each image represents a traffic sign belonging to one of 43 classes.
- The images are represented as 32x32x3 arrays of pixel intensities in RGB color space, with values ranging from 0 to 255. The class of each image is encoded as an integer from 0 to 42.