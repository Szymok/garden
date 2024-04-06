---
title: Deep Learning DDPM and Dropout
type: course
tags: 
aliases:
---
- Dropout technique for improving model performance
- Test time dropout callback for measuring model confidence
- Denoising Diffusion Probabilistic Models (DDPM) for generative modeling
- Forward and reverse processes in DDPM
- Implementing a noise predicting model using a neural network
- Training loop and loss function calculation in DDPM
- Visualizing noisy images at different timesteps
- Alternative noise schedules for improved DDPM performance
- Inheriting from Callback and UNet2DModel for an alternative implementation
- Experimenting with initialization techniques and optimizers
- Introduction to mixed precision for faster training

In Lesson 19, Jeremy introduces special guests Tanishq and Johno and provides a quick update on the Fashion-MNIST challenge. He discusses the use of Dropout, a simple but powerful technique that randomly deletes activations with a certain probability, improving model performance. Jeremy also mentions a test time dropout callback that can be used to measure model confidence.

Tanishq then dives into Denoising Diffusion Probabilistic Models (DDPM), a generative modeling technique that has gained popularity in recent years. He provides an overview of the goal of generative modeling, which is to obtain information about the probability distribution of data points (p(x)) to sample new points and create new generations. Tanishq highlights the key variables and equations in the DDPM paper and explains the forward and reverse processes involved in the model.

The forward process, used for training, goes from an image to pure noise, while the reverse process goes from pure noise to an image. The transition between these two processes is driven by a learned model. The lesson focuses on the code and the variables used in the math, providing a foundation for understanding DDPM and its applications in image generation.In this section of the video lesson, the instructor explains the concept of diffusion models and their application in image generation. The diffusion process involves iteratively adding noise to an image, causing it to lose its original structure and become pure noise. The reverse process uses a neural network to predict and remove the noise, bringing the image back towards its original state.

The instructor demonstrates the implementation of a diffusion model using the Fashion-MNIST dataset and a U-Net neural network architecture. The model is trained to predict the noise added to the image at each timestep. The training process involves selecting a random timestep, adding noise to the image based on that timestep, and passing the noisy image and timestep to the model. The target for the model is the actual noise added to the image.

A callback is used to set up the batch for the learner, making it easier to work with the unique training loop. The instructor also discusses the use of Greek letters in the code to match the equations from the research paper, making it easier to understand the implementation. Overall, the diffusion model allows for the generation of images by iteratively predicting and removing noise, walking towards the data distribution.In this video lesson, the middle section focuses on the implementation of a noise predicting model using a neural network. The model takes in input Xt and t and compares it to the actual epsilon. The prediction function is implemented using Hugging Face's API, which requires calling .sample to get the predictions from the model. The training loop is implemented in miniai, and the loss function calculation is performed using learn.preds and learn.batch[1]. The DDPM callback is initialized with the appropriate arguments, and an MSE loss is used.

The sampling process starts with a random image, which is not part of the data distribution. The noise predicting model is used to predict the direction to move in, and the image is updated with a weighted average of the denoised image estimate and the original noisy image, along with some additional noise. This process is repeated for each timestep, with the estimates becoming more accurate as the timesteps progress. The final generated image is obtained at the end of the sampling process.

The implementation also includes a function to visualize the noisy images at different timesteps during the sampling process. The noise schedule used in the original DDPM paper has limitations, especially when applied to smaller images. Improved DDPM papers propose alternative noise schedules that can be explored and implemented to improve the generative model's performance.In this section of the video lesson, the instructor demonstrates an alternative approach to the previous implementation by inheriting from Callback instead of TrainCB. They create a new UNet class by inheriting from UNet2DModel and replacing the forward function. This allows them to bypass the need for TrainCB and predict. They also experiment with making the model faster by dividing the channels by two and adjusting the group normalization. The instructor emphasizes the importance of visualizing the results at each step to identify and fix errors.

The instructor then discusses how to improve the training speed and learning rate. They notice that the diffusers code does not initialize anything, so they experiment with different initialization techniques, such as zeroing out every second convolutional layer and using orthogonal weights for the downsamplers. They also replace the default Adam optimizer with one that has a larger epsilon value, which helps prevent the learning rate from exploding during training.

Finally, the instructor introduces the concept of mixed precision to further speed up the training process. Mixed precision involves using 16-bit floating-point values instead of the default 32-bit values, which modern Nvidia GPUs can process much faster. However, mixed precision requires careful implementation to maintain the necessary precision for gradient calculations. The instructor plans to cover the implementation of mixed precision in the next lesson.
