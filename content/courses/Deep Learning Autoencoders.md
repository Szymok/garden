---
title: Deep Learning Autoencoders
type: course
tags: 
aliases:
---
- Convolutional autoencoders
- Convolutions and kernels
- Im2col technique
- Padding and stride in CNNs
- Receptive field
- Building a CNN from scratch
- Creating a Learner for faster experimentation
- Python concepts: try-except blocks, decorators, getattr, and debugging
- Cognitive load theory in learning

In Lesson 15, the focus is on creating a convolutional autoencoder and understanding convolutions. Convolutions allow neural networks to understand the structure of a problem, making it easier to solve. In the case of images, convolutions help identify patterns of pixels that represent the same thing, regardless of their position in the image. Convolutional Neural Networks (CNNs) are a good starting point for image processing tasks, but they can also be used for language-based tasks with one-dimensional convolutions.

The lesson demonstrates how to apply a convolution to an image using a kernel, which is a tensor that slides over the image. By applying different kernels, the network can detect various features such as top edges, left edges, and diagonal edges. The lesson also introduces the concept of im2col, a technique that converts a convolution into a matrix multiplication for faster computation. This technique is used in deep learning libraries like PyTorch, which provides optimized functions like unfold() and conv2d() for efficient convolutions.

To address the issue of losing pixels on the edges of the image during convolution, padding can be added. Padding involves starting the kernel at the edge of the image, allowing the convolution to cover the entire image without losing any pixels.In this section of the video lesson, the instructor demonstrates the use of padding and stride in convolutional neural networks (CNNs) and how they affect the output size. The instructor explains that odd-numbered edge size kernels are generally easier to deal with to ensure the output size remains the same as the input size. The instructor also introduces the concept of stride, which is the amount by which the window moves across the input. Stride 2 convolutions are useful because they reduce the dimensionality of the input by a factor of 2, which is often desired in classification architectures.

The instructor then creates a CNN from scratch using a sequential model and demonstrates how to train it on the GPU. The instructor also discusses the concept of receptive field, which is the area of the input that has an impact on a particular activation in the output. The receptive field is an important concept in understanding how different parts of the input contribute to the output of a CNN.

The instructor demonstrates how to create a convolutional neural network in Microsoft Excel, which helps visualize the receptive field and the impact of different input areas on the output.In this section of the lesson, the instructor demonstrates how to build a model using the Hugging Face library and the datasets created in a previous lesson. They create a DataLoader for training and validation and use a sequential model for classification. However, the model runs slowly and has low accuracy. To address these issues, the instructor decides to create an auto-encoder, which compresses the input image and then reconstructs it. They build a deconvolutional layer and a new fit function for the auto-encoder, but the results are still not satisfactory.

The instructor emphasizes the need for a more efficient and flexible framework to rapidly test different models and configurations. They introduce the concept of a Learner, which will be built on top of the existing model, DataLoader, loss function, learning rate, and optimizer. The Learner will allow for faster experimentation and better understanding of the model's performance. They create a simple Learner that fits on one screen and demonstrate its use with a multi-layer perceptron (MLP) model.

To make the Learner more flexible, the instructor creates a Metric class that can be subclassed to calculate different metrics, such as accuracy. They also create a basic Metric for loss calculation. The Learner is then updated to incorporate these new Metric classes, allowing for more efficient experimentation and evaluation of different models and configurations.In this section of the video lesson, the instructor explains the process of creating a Learner with the model, data loaders, loss function, learning rate, and callbacks. The fit() function is called, which goes through each epoch and calls one_epoch() for training and validation. The one_epoch() function goes through each batch in the DataLoader and calls one_batch(), which performs prediction, gets the loss, and if it's training, performs the backward() step and zero_grad(). The instructor also introduces a special decorator with callbacks, which is used to create the _fit() function.

The with_callbacks class is used to store the name of the function and is called as a decorator. When called, it receives the function (_fit) and returns a different function that calls the original function with the arguments and keyword arguments. Before calling the original function, it calls a special method called callback, passing in the string before_fit. After the original function is completed, it calls the callback method again, passing the string after_fit. The whole process is wrapped in a try-except block, looking for a CancelFitException.

The instructor emphasizes the importance of understanding Python concepts such as try-except blocks, decorators, getattr, and debugging to reduce cognitive load while learning the framework being built. Cognitive load theory suggests that learning can be difficult if there are too many things going on at the same time. The instructor encourages learners to practice and familiarize themselves with these concepts to improve their software engineering skills in data science work. The lesson concludes with the anticipation of diving deeper into these topics in the next session.