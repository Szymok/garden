---
title: Deep Learning Super-resolution
type: course
tags: 
aliases:
---
- Tiny Imagenet dataset
- Creating a super-resolution U-Net model
- Data preprocessing and augmentation
- Perceptual loss
- Gradually unfreezing pre-trained networks
- Experimenting with cross connections in Unet

In this video lesson, the instructor discusses a bug in Notebook 23 related to measuring the FID (Fréchet Inception Distance) and its impact on the results. The bug caused the model to see unusually low contrast images, leading to incorrect FID values. After fixing the bug, the FIDs were around 5.65 for generated images and 2.5 for real images.

The lesson then moves on to working with Tiny Imagenet, a dataset of 64x64 images, to create a super-resolution U-Net model. The instructor demonstrates how to create a dataset, preprocess the images, and apply data augmentation. They also discuss the challenges of overfitting and the need for data augmentation to improve the model's performance.

The instructor trains the model using AdamW optimizer and mixed precision, achieving an accuracy of nearly 60%. They also explore the potential for improvement by examining the results of other models on Tiny Imagenet from the Papers with Code website.In this section of the lesson, the focus is on super-resolution, where the goal is to scale up a low-resolution image to a higher resolution. The independent variable is a 32x32 pixel image, and the dependent variable is the original 64x64 pixel image. To ensure that the augmentation is done in the same way on both the independent and dependent variables, the augmentation is placed directly in the dataset.

The super-resolution task is challenging as the model has to learn how to draw features like eyes and whiskers from the low-resolution images. The approach taken is to create a model with a series of ResBlocks with a stride of 2, followed by an equal number of up blocks that perform up sampling and then pass through a ResBlock. This essentially undoes the stride of 2 and up samples the image. The model is trained briefly for five epochs, and the results show that it can perform super-resolution reasonably well.In this section of the video lesson, the instructor discusses the limitations of using a convolutional neural network for image super-resolution and introduces the concept of Unet, a more efficient architecture for this task. The instructor explains that using mean squared error (MSE) as a loss function can lead to blurry results, and suggests using perceptual loss as an alternative. Perceptual loss involves comparing the features of the output image and the target image at an intermediate layer of a pre-trained classifier model.

To implement perceptual loss, the instructor uses a classifier model trained on the dataset and modifies it to return the activations after the fourth residual block. The loss function is then calculated as the sum of the MSE loss between the input and target images and the MSE loss between the features obtained from the classifier model for both the target and input images. The instructor also scales the feature loss by a factor of 0.1 to balance the two components of the loss function.

After training the Unet model with the new loss function, the instructor observes that the output images are less blurry and more similar to the target images, although there is still room for improvement. The use of perceptual loss has helped the model to generate better super-resolution images compared to using MSE loss alone.In this section of the video lesson, the instructor discusses the challenges of comparing different models and their outputs. They demonstrate how perceptual loss has improved the results significantly, but also note that there isn't a clear metric to use for comparison. The instructor then moves on to gradually unfreezing pre-trained networks, a favorite trick in FastAI. They copy the weights from the pre-trained model into their model and train it for one epoch with frozen weights for the down path. This results in a significant improvement in loss.

The instructor then experiments with adding cross connections or cross cons, which are res blocks in the Unet. They create a new Unet with cross cons and train it, achieving even better results. The instructor suggests that students could try various image-to-image tasks with the Unet, such as segmentation, style transfer, colorization, or decrappification. Other ideas include watermark removal, drawing to painting, and improving the super resolution model.
