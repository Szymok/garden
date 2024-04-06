---
title: Deep Learning The Learner Framework
type: course
tags: 
aliases:
---
- Building a flexible training framework
- Basic Callbacks Learner
- Callbacks and exceptions (CancelFitException, CancelEpochException, CancelBatchException)
- Metrics and MetricsCB callback
- torcheval library
- DeviceCB callback
- Refactoring code with context managers
- set_seed function
- Analyzing the training process
- PyTorch hooks
- Histograms of activations

In Lesson 16, the focus is on building a flexible training framework called the learner. The lesson starts with a Basic Callbacks Learner, which is an intermediate step towards the flexible learner. The Basic Callbacks Learner is similar to the previous Learner, with a fit function that goes through each epoch, calling one_epoch with training on and off. The main difference is the addition of callbacks, which are functions or classes that are called at specific points during the training process.

The lesson demonstrates the creation of a simple callback called CompletionCB, which counts the number of batches completed during the fitting process. The concept of CancelFitException, CancelEpochException, and CancelBatchException is introduced, which allows callbacks to raise exceptions to skip certain parts of the training process.

Next, the lesson introduces metrics and demonstrates how to create a MetricsCB callback to print out metrics during training. The torcheval library is introduced as a source of pre-built metrics that can be used in the learner. A DeviceCB callback is also created to handle moving the model and data to the appropriate device, such as a GPU.

The lesson demonstrates the use of a context manager to refactor the code and reduce duplication. This simplifies the code and makes it easier to maintain and add callbacks in the future.In this section of the lesson, the focus is on looking inside the models to diagnose and fix problems during training. A set_seed function is introduced to set a reproducible seed for PyTorch, NumPy, and Python's random number generators. The same Fashion MNIST dataset is used, and a model similar to previous ones is created. MultiClassAccuracy is used again, along with the same callbacks as before. The goal is to train as fast as possible, not only to save time but also to find a more generalizable set of weights and reduce overfitting. A high learning rate of 0.6 is used to test the stability of the training. A function is created to set up the Learner with the callbacks, fit the model, and return the Learner for further use.In this section of the video lesson, the instructor discusses how to analyze the training process of a neural network by looking at the mean and standard deviation of each layer's activations. Initially, a custom SequentialModel is created to store the means and standard deviations of each layer. However, this approach is not very elegant, and the instructor introduces PyTorch hooks as a more convenient solution. Hooks allow users to add functionality to existing models without rewriting them. The instructor demonstrates how to create a Hook class and a Hooks class to simplify the process of adding hooks to a model.

The lesson then moves on to creating histograms of the activations to better visualize the training process. The instructor modifies the append_stats function to include a histogram of the absolute values of the activations. These histograms are then turned into a single column of colored pixels, with each color representing the frequency of a particular range of activation values. This creates a more visually appealing and informative representation of the training process.

The instructor emphasizes that an ideal training process should have a more even distribution of activation values, with fewer dead or nearly dead activations (close to zero). The lesson concludes with the assertion that understanding the training process and the behavior of the model's activations is crucial for building and debugging neural network models.In this section of the video lesson, the instructor has reached the deepest point of the current topic and is now ready to start building up the pieces to help train models reliably and quickly. The ultimate goal is to create high-quality generative models and other models from scratch.

In the next class, the focus will be on initialization, which is an important topic for model training. The instructor suggests that students should revise concepts like standard deviations before the next lesson, as they will be used extensively.
