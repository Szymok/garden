---
title: Deep Learning Initialization & normalization
type: course
tags: 
aliases:
---
- Callback class and TrainLearner subclass
- HooksCallback and ActivationStats
- Glorot (Xavier) initialization
- Variance, standard deviation, and covariance
- General ReLU activation function
- Layer-wise Sequential Unit Variance (LSUV)
- Layer Normalization and Batch Normalization
- Instance Norm and Group Norm
- Accelerated SGD, RMSProp, and Adam optimizers
- Experimenting with batch sizes and learning rates

In Lesson 17 of Practical Deep Learning for Coders, the instructor introduces some minor changes to the miniai library and discusses the importance of weight initialization in neural networks. The instructor first explains the changes made to the Callback class and the addition of a TrainLearner subclass. They then demonstrate the use of a HooksCallback and ActivationStats to visualize the training process more easily.

The lesson then focuses on the importance of having 0 mean and 1 standard deviation in neural networks. The instructor demonstrates the issues that can arise when the weight matrices are not scaled correctly, leading to NaNs or zeros. They introduce the Glorot (or Xavier) initialization, which scales the random numbers in the weight matrices to maintain a standard deviation of 1 and a mean of 0. This initialization helps prevent issues during training.

The instructor provides a brief explanation of variance, standard deviation, and covariance, showing how they can be calculated using code. These concepts are important for understanding the relationships between data points and the variation within and between tensors.In this section of the video lesson, the instructor discusses the importance of covariance and variance in tensors and introduces the Pearson correlation coefficient. The lesson then moves on to explain Xavier initialization (Glorot init) and its derivation. The instructor demonstrates how to create random numbers and compute the standard deviation for a matrix multiplication. The lesson highlights the importance of initializing weight matrices and input matrices with a mean of 0 and a standard deviation of 1 for proper training of deep convolutional neural networks.

The instructor then introduces the concept of General ReLU, a modified ReLU activation function that allows for a mean of 0 by subtracting a constant value and incorporating a leaky ReLU component. This new activation function is implemented in the model, and the instructor demonstrates how to modify the input data using a callback or the Hugging Face datasets library. The results show improved training and smoother graphs with the General ReLU activation function.

The instructor emphasizes the importance of proper initialization and the lack of attention it receives in the deep learning community. By creating a custom activation function and ensuring proper initialization, the model achieves better training results and higher accuracy.In this section of the video lesson, the instructor discusses the importance of initializing neural networks correctly and introduces a technique called Layer-wise Sequential Unit Variance (LSUV) based on the paper "All You Need Is a Good Init" by Dmytro Mishkin. LSUV is a general method for initializing any neural network, regardless of the activation functions used. The process involves creating a model, initializing it, and then adjusting the weight matrix and biases for each layer until the correct mean and standard deviation are achieved. This is done using hooks in Python.

The instructor then introduces normalization techniques, specifically Layer Normalization and Batch Normalization. Layer Normalization is a simpler method that normalizes the input for each layer during training, making it easier for the model to learn. It involves creating a module with a forward function that calculates the mean and variance for each input in the mini-batch and normalizes the data accordingly. Batch Normalization, on the other hand, is a more complex method that involves calculating an exponentially weighted moving average of the means and variances of the last few batches during training. This results in a smoother training process and allows for higher learning rates.

The instructor briefly mentions other normalization techniques, such as Instance Norm and Group Norm, which have different ways of averaging over channels, height, and width. These techniques can be useful in certain situations but may have their own challenges and trade-offs.In this section of the video lesson, the instructor discusses various initialization methods and their combinations. They experiment with different batch sizes and learning rates to improve performance, aiming for 90% accuracy. By using PyTorch's BatchNorm and MomentumLearner, they achieve 87.8% accuracy after three epochs, mainly due to the smaller mini-batch size. However, they still need to do more work to reach the desired 90% accuracy.

The instructor then introduces Accelerated SGD and explains the concept of momentum. Momentum helps in following the average of directions in a loss function, making the learning process smoother. They implement momentum in an optimizer and demonstrate its effectiveness by achieving 87.6% accuracy with a high learning rate of 0.4. The loss function is also smoother with momentum.

The instructor introduces RMSProp and Adam optimizers. RMSProp divides the gradient by the amount of variation, which can be useful for finicky architectures. Adam optimizer combines RMSProp and momentum, resulting in 86.5% accuracy. The instructor highlights the importance of unbiasing the gradient and square averages in the Adam optimizer for better performance.In this last section of the video lesson, the instructor discusses the performance of the current model and suggests experimenting with different values of beta1 and beta2 to potentially improve the results. However, they acknowledge that they are running out of time and decide to postpone the next part of the lesson to ensure it is covered thoroughly.

The instructor hints that in the upcoming lesson, they will demonstrate how to achieve over 90% accuracy and share some exciting techniques. They express enthusiasm for sharing this information in the next session.
