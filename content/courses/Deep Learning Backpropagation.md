---
title: Deep Learning Backpropagation
type: course
tags: 
aliases:
---
- Backpropagation and the chain rule
- Refactoring code for efficiency and flexibility
- PyTorch’s `nn.Module` and `nn.Sequential`
- Creating custom PyTorch modules
- Implementing optimizers, DataLoaders, and Datasets
- Working with Hugging Face datasets
- Using nbdev to create Python modules from Jupyter notebooks
- `**kwargs` and delegates
- Callbacks and dunder methods in Python’s data model
- Building a proper training loop using PyTorch DataLoader

In Lesson 14, the instructor discusses the implementation of the chain rule in neural network training using backpropagation. They explain how the code from the previous lesson maps to the math and recommend resources for those who need to brush up on their understanding of derivatives and the chain rule. The lesson then moves on to refactoring the code to make it more efficient and flexible. The instructor introduces PyTorch's nn.Module and demonstrates how to create custom PyTorch modules that automatically track layers and parameters. They also show how to build their own implementation of nn.Module and how to create a sequential model using PyTorch's nn.Sequential.

The instructor demonstrates how to create a custom PyTorch module by subclassing nn.Module and assigning layers as attributes. This allows the module to automatically track its layers and parameters, making the code more efficient and flexible. They also show how to create their own implementation of nn.Module using Python's dunder setattr and dunder repr methods, as well as the parameters() function. This custom implementation can then be used to create a sequential model.

The instructor demonstrates how to use PyTorch's nn.Sequential to create a sequential model by passing in a list of layers. They also show an alternative implementation using the reduce() function, which is a more general concept in computer science. The lesson concludes with the instructor showing how to use PyTorch's nn.Sequential to create a sequential model and fit it to the data.In this section of the lesson, the concept of an optimizer is introduced, which simplifies the process of updating parameters based on gradients and learning rates. The optimizer is created by passing the model parameters and learning rate. The loop is then simplified by using opt.step() and opt.zero_grad(). The lesson also demonstrates how to create a custom SGD optimizer from scratch.

The lesson proceeds to create a Dataset class, which takes in independent and dependent variables and allows for easy slicing of the data. This is followed by the creation of a DataLoader class, which takes a Dataset and a batch size, and iterates through the data in batches. The DataLoader is further improved by adding a Sampler class, which can shuffle the order of the data for each training iteration.

The lesson demonstrates how to use PyTorch's built-in DataLoader, which works similarly to the custom DataLoader created earlier. The PyTorch DataLoader can also handle multi-processing, allowing for parallel processing of data. This can be particularly useful when working with large datasets or when performing complex data transformations.In this section of the video lesson, the instructor demonstrates how to create a proper, working, and sensible training loop using PyTorch DataLoader. The instructor then introduces Hugging Face datasets and shows how to use them with the custom training loop. The lesson covers how to load a dataset called Fashion-MNIST using Hugging Face and how to create DataLoaders for it. The instructor also discusses the differences between using dictionaries and tuples in PyTorch and Hugging Face, and how to convert between them using custom collation functions.

Furthermore, the instructor introduces a Python library called nbdev, which allows users to create Python modules from Jupyter notebooks. This is used to create a library called miniai, which will be used throughout the course. The lesson also covers plotting images using matplotlib and creating custom functions to make plotting easier, such as show_image().

Overall, this section of the lesson focuses on creating a custom training loop, working with Hugging Face datasets, and visualizing data using matplotlib. The instructor emphasizes the importance of understanding the underlying code and not relying solely on other people's code, as it allows for greater flexibility and creativity in building custom solutions.In this section of the video lesson, the instructor discusses the use of **kwargs and delegates in fastcore to extend existing functions and maintain their documentation. They also demonstrate how to create subplots using matplotlib and enhance the functionality of subplots using delegates. The instructor then introduces the concept of callbacks and shows how they can be used in GUI events and slow calculations. They also cover the use of *args and **kwargs in Python functions and the importance of dunder methods in Python's data model. The instructor emphasizes the need to be familiar with these concepts as they are used throughout the course and in various frameworks.In this section of the video lesson, the instructor emphasizes that no part of the course is inherently more difficult than others, and any unfamiliarity is simply due to a lack of background in that specific area. They encourage students to spend time studying and practicing to pick up new concepts and not to stress if they don't understand something right away. The instructor also highlights the importance of asking for help, as the community is eager to assist.

The lesson has been successful in achieving its objectives, as the students now have a well-optimized training loop, a clear understanding of DataLoaders and Datasets, and experience with an optimizer and Hugging Face datasets. These accomplishments have set the stage for creating a generic learner training loop and experimenting with various models.

In the next lesson, students can look forward to building and experimenting with different models using the foundation they have established in this lesson. The instructor encourages students to continue asking questions and seeking help as needed, fostering a supportive learning environment.