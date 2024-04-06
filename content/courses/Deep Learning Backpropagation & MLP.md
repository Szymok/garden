---
title: Deep Learning Backpropagation & MLP
type: course
tags: 
aliases:
---
- Basic neural network architecture
- Multi-Layer Perceptron (MLP) implementation
- Gradients and derivatives
- Chain rule and backpropagation
- Python debugger (pdb)
- PyTorch for calculating derivatives
- ReLU and linear function classes
- Log sum exp trick
- `log_softmax()` function and cross entropy loss
- Training loop for a simple neural network

In Lesson 13, the instructor introduces backpropagation and discusses the creation of a simple Multi-Layer Perceptron (MLP) neural network. The lesson begins with a review of basic neural networks and their architecture, using linear models and rectified lines to create arbitrary curves. The instructor then defines variables for the number of training examples, pixels, and possible output values, and demonstrates how to create a weight matrix and biases for the neural network.

The lesson proceeds with the implementation of a simple MLP from scratch, using linear layers, ReLU activation, and a basic Mean Squared Error (MSE) loss function. The instructor explains the importance of gradients and derivatives in optimizing the neural network's weights. In more complex functions, the derivatives form a matrix, with a row for every input and a column for every output. This matrix helps determine how changing each input affects each output, ultimately leading to the optimization of the neural network.In this section of the lesson, the focus is on understanding the chain rule and backpropagation in the context of neural networks. The chain rule is essential for calculating gradients in multi-layer networks, and backpropagation is the process of applying the chain rule to compute gradients for each layer. The lesson demonstrates how to calculate derivatives using Python and the SimPy library, and then explains the chain rule using an interactive animation of spinning wheels.

The lesson proceeds to discuss the importance of the chain rule in calculating the gradient of the mean squared error (MSE) applied to a model. The model consists of multiple layers, including linear layers and ReLU activations. The chain rule is used to compute the derivatives of each layer, starting from the end and working backward. This process is called backpropagation.

The lesson also demonstrates how to use the Python debugger (pdb) to explore and understand the code interactively. The debugger is a powerful tool for examining the state of variables and expressions during code execution. The lesson shows how to set breakpoints, print variable values, and step through code using pdb.

The lesson demonstrates how to simplify gradient calculations using Einstein summation notation and matrix multiplication. This simplification makes the code more efficient and easier to understand.In this section of the lesson, the instructor demonstrates how to use PyTorch to calculate derivatives and simplify the process by creating classes for ReLU and linear functions. The Dunder call method is introduced, which allows classes to behave like functions. The instructor then shows how to store intermediate calculations in the ReLU and linear classes to make the forward and backward passes more efficient.

Next, the instructor refactors the code by creating a module class that stores inputs and outputs, making the ReLU, linear, and MSE classes simpler. The instructor also discusses the trade-off between memory usage and computational speedup when storing intermediate calculations.

The instructor demonstrates how to use PyTorch's nn.Module to create a linear layer and shows that the forward pass is the only necessary implementation since PyTorch already knows the derivatives and can handle the backward pass. The lesson then reviews softmax and log softmax calculations, as well as log and exponent rules, which are useful for simplifying neural network calculations.In this section of the video lesson, the instructor discusses the issues with floating point math and introduces the log sum exp trick to overcome these issues. The trick involves finding the maximum of all x values, subtracting it from every number, and then using exponent rules to adjust the calculations. This method ensures that the numbers involved in the calculations do not become too large for the floating point unit.

The instructor then demonstrates how to implement the log_softmax() function and the cross entropy loss using PyTorch. They also show how to calculate the accuracy of the model using the argmax function. The instructor then proceeds to create a training loop for a simple neural network, setting the loss function to cross entropy and using a batch size of 64. The training loop goes through each epoch and updates the weights and biases of the model.

Finally, the instructor encourages viewers to practice recreating the matrix multiply, forward and backward passes, and other key components of the lesson to solidify their understanding. In the next lesson, the training loop will be refactored to make it simpler, and a validation set and multi-processing data loader will be added.