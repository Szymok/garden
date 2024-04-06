---
title: Deep Learning Attention & transformers
type: course
tags: 
aliases:
---
- Implementing an unconditional stable diffusion model
- Time embedding and sine/cosine embeddings
- Self-attention and multi-headed attention
- Rearrange function
- Transformers
- Creating a conditional stable diffusion model

In Lesson 24, the focus is on completing the unconditional stable diffusion model. The lesson begins with the creation of a 26 diffusion unit, which is based on the diffusers model. The pre-activation convolution is used, and the structure of the model is similar to what is found in diffusers. The lesson also covers the creation of a saved res block and a saved convolution, which are used to store activations during the down sampling and up sampling paths of the model.

The lesson then moves on to the implementation of the unconditional model, which is similar to the diffusers unconditional model but without attention and time embedding. The model is trained using fashion MNIST with fewer channels than the default. The lesson also discusses the importance of time embedding and introduces sine and cosine embeddings as a way to create embeddings for each time step.

The sine and cosine embeddings are used to create a res block with embeddings, where the forward function takes both the activations and the time embedding vector T. The lesson demonstrates how to create these embeddings using a range of time steps and exponents, resulting in a 100x16 matrix of embeddings.The attention mechanism in stable diffusion is designed to allow the model to take into account information from other pixels in the image, regardless of their distance. This is achieved by flattening the image into a one-dimensional sequence of tokens and applying 1D attention, which was originally developed for NLP tasks.

The attention process involves creating a weighted average of all the pixels in the flattened image. Each pixel in the image will be updated based on its original value plus the weighted average of the other pixels. The weights are designed to sum to one, ensuring that the pixel values do not change drastically.

This approach allows the model to consider information from distant pixels, such as the shape of a bunny rabbit's ear, when making decisions about the activations at a particular location in the image. Although the attention mechanism used in stable diffusion is known to be suboptimal, it serves as a starting point for understanding and implementing attention in generative models.In this section of the video lesson, the instructor discusses the concept of self-attention and multi-headed attention in the context of stable diffusion. Self-attention is a mechanism that allows a model to weigh the importance of different parts of an input sequence when making predictions. The instructor explains how to calculate the weights for self-attention using matrix products and demonstrates the implementation of self-attention in code.

The instructor then introduces multi-headed attention, which is an extension of self-attention that allows the model to focus on different aspects of the input sequence simultaneously. This is achieved by splitting the channels into multiple groups, or heads, and performing self-attention on each group separately. The instructor demonstrates how to implement multi-headed attention in code using the rearrange function from the einops library.

The instructor compares the custom implementation of self-attention and multi-headed attention with the built-in PyTorch implementation, highlighting the importance of specifying the batch_first parameter to ensure consistency with the custom implementation.In this section of the video lesson, the instructor discusses the rearrange function and its usefulness in replacing individual operations like transpose and reshape. They also mention that rearrange is becoming popular in the diffusion research community. The instructor then adds attention to the MResBlock and adjusts the down and up blocks to accommodate attention channels. They also discuss the balance of finding the right place to add attention in the network to avoid high memory usage.

The instructor briefly covers transformers and their potential use in vision tasks. They explain that transformers can approximate any convolution, but doing so requires a lot of data, layers, parameters, and compute. Pre-trained vision transformers (VITs) can perform better than convolutions when fine-tuned on ImageNet, but using them without pre-training on a large dataset would result in poor performance.

Finally, the instructor demonstrates how to create a conditional model by adding a label to the input of the UNet model. This allows the model to generate images of a specific class, such as a shirt or pants. The sampling process is then adjusted to accommodate the class ID, and the model successfully generates images of the specified class. The instructor concludes by mentioning that the next lesson will cover Variational Autoencoders (VAEs) and latent diffusion.
