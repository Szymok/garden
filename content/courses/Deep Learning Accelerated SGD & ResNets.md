---
title: Deep Learning Accelerated SGD & ResNets
type: course
tags: 
aliases:
---
- Stochastic gradient descent (SGD) accelerated approaches
    - Momentum
    - RMSProp
    - Adam
- Learning rate annealing
- PyTorch learning rate schedulers
    - Cosine Annealing
    - OneCycleLR
- Working with PyTorch optimizers
- Neural network architecture improvements
    - Deeper and wider networks
    - ResNets
    - Residual connections
- Data augmentation techniques
    - Random erasing
    - Test time augmentation
- Creating custom schedulers and experimenting with model performance

In this section of the lesson, the instructor demonstrates how to use Microsoft Excel to visualize and experiment with various stochastic gradient descent (SGD) accelerated approaches, such as momentum, RMSProp, and Adam. The instructor starts by creating a simple linear regression problem in Excel and then applies basic SGD, momentum, RMSProp, and Adam to solve the problem. The instructor also introduces the concept of learning rate annealing and shows how to implement it in Excel.

The instructor then moves on to explore learning rate schedulers in PyTorch. By using the dir() function, the instructor lists all the available schedulers in the torch.optim.lr_scheduler module. The instructor decides to experiment with Cosine Annealing and demonstrates how to work with PyTorch optimizers. The instructor creates a learner with a single batch callback and fits the model to obtain an optimizer. The instructor then explores the attributes of the optimizer and explains the concept of parameter groups.

In summary, this section of the lesson provides a hands-on approach to understanding and experimenting with various SGD accelerated approaches and learning rate annealing using Microsoft Excel and PyTorch.In this section of the lesson, the instructor explains how to work with PyTorch optimizers and schedulers. The optimizer's state is stored in a dictionary where the keys are parameter tensors. The instructor also demonstrates how to create a cosine annealing scheduler and how it adjusts the learning rates of the optimizer for each set of parameters. The scheduler requires the optimizer and the number of iterations (T_max) as input.

The instructor then shows how to create a scheduler callback and a recorder callback to keep track of the learning rate during training. By using a cosine annealing scheduler and a recorder callback, the learning rate can be plotted to visualize its behavior during training. The instructor also demonstrates how to create an epoch scheduler callback, which updates the learning rate at the end of each epoch instead of each batch.

The lesson continues with the implementation of the OneCycleLR scheduler from PyTorch, which adjusts the learning rate and momentum during training. The instructor explains the benefits of using a warmup phase with low learning rates and high momentum, followed by a high learning rate phase with low momentum, and finally a phase with decreasing learning rates and increasing momentum.

Lastly, the instructor highlights some changes made to the code, such as the HasLearn callback, the addition of an lr_find method to the Learner class using fastcore's patch decorator, and the addition of new parameters to the fit method.In this section of the video lesson, the instructor discusses how to improve the architecture of a neural network by making it deeper and wider. They start by making a small change to the initial convolutional layer, changing the stride to 1 and increasing the number of channels to 128. This results in a significant improvement in accuracy, from 90.6% to 91.7%.

Next, the instructor introduces ResNets and the concept of residual connections, which allow for deeper networks without sacrificing training dynamics. They implement a ResBlock, which contains two convolutional layers and an identity connection, and replace the convolutions in the previous model with ResBlocks. This new model achieves an accuracy of 92.2%.

The instructor then explores various ResNet architectures from the PyTorch Image Models (timm) library, finding that their simple, thoughtfully designed architecture outperforms many of the pre-built models. They further improve the model by increasing the kernel size of the first ResBlock and doubling the number of channels, resulting in an accuracy of 92.7%. They create a more flexible ResNet model that can handle different input sizes by having one less layer and stopping at 256 channels.In this section of the video lesson, the instructor discusses the use of Global Average Pooling layers to reduce the dimensions of the output from the last ResBlock. This is followed by an explanation of how to calculate the number of floating point operations (FLOPs) for a model, which can be used as an approximation for the model's computational complexity. The instructor then explores different ways to reduce the number of parameters and FLOPs in the model while maintaining accuracy, such as removing certain layers or replacing ResBlocks with single convolutions.

The instructor also highlights the limitations of weight decay as a regularization technique when using BatchNorm layers and suggests using data augmentation instead. Various data augmentation techniques are demonstrated, including random erasing, which replaces a random patch in the image with Gaussian noise. Test time augmentation is also introduced, which involves averaging predictions from multiple augmented versions of the same image to improve accuracy. The instructor concludes the section by showing how to implement random erasing and test time augmentation in the model, ultimately achieving an accuracy of 94.2% in 20 epochs.In this section of the video lesson, the instructor demonstrates data augmentation techniques to improve model performance. They create a class for data augmentation, which includes random crop, random flip, and random RandErase. After running the model for 50 epochs, they achieve an accuracy of 94.6%. The instructor then explores the idea of random copying, where a part of the image is copied to another part of the same image, ensuring the correct distribution of pixels. They implement this idea manually and create a class for it. After training the model for 25 epochs, they achieve an accuracy of 94%.

The instructor then experiments with ensembling, where they train two separate models for 25 epochs each and combine their predictions. Although the ensemble model performs better than the individual models, it does not beat the previous best accuracy of 94.6%. The instructor encourages viewers to experiment with different techniques and data augmentation methods to improve model performance.

For homework, the instructor asks viewers to create their own cosine annealing scheduler and 1-Cycle scheduler from scratch, ensuring they work correctly with the batch scheduler callback. This exercise aims to help viewers gain a deeper understanding of the PyTorch API and the process of exploration and experimentation. Additionally, the instructor challenges viewers to beat their model's performance on the 5-epoch, 20-epoch, or 50-epoch Fashion-MNIST dataset, ideally using miniai with custom additions.
