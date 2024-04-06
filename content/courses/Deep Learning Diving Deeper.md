---
title: Deep Learning Diving Deeper
type: course
tags: 
aliases:
---
- Papers:
    - Progressive Distillation for Fast Sampling of Diffusion Models
    - On Distillation of Guided Diffusion Models
    - Imagic
- Tokenizing input text
- CLIP encoder for embeddings
- Scheduler for noise determination
- Organizing and simplifying code
- Negative prompts and callbacks
- Iterators and generators in Python
- Custom class for matrices
- Dunder methods
- Python data model
- Tensors
- Pseudo-random number generation
    - Wickman-Hill algorithm
    - Random state in deep learning
- Linear classifier using a tensor

In this section of the video lesson, the instructor showcases various student projects from the course forum, highlighting their creativity and applications of deep learning techniques. The lesson then reviews the concepts covered in the previous lesson, focusing on the Stable Diffusion process and the use of CLIP for text encoding. The instructor emphasizes the importance of understanding the math behind diffusion, even for those who may not consider themselves math-oriented.

The lesson proceeds to discuss two recent papers that have improved the Stable Diffusion process. The first paper, "Progressive Distillation for Fast Sampling of Diffusion Models," introduces a distillation process that reduces the number of steps required for denoising images from 60 to 4. This is achieved by training a student model to learn from a teacher model, which is a pre-trained Stable Diffusion model. The student model is then used to perform the denoising process more efficiently.

The second paper, "On Distillation of Guided Diffusion Models," focuses on incorporating guidance into the distillation process. This is done by passing the guidance scale as an additional input to the student model, allowing it to learn how to handle Classifier Free Guided Diffusion. The instructor recommends watching Johno's paper walkthrough video for a more in-depth understanding of these papers and their implications.In this video lesson, the presenter discusses the Imagic algorithm, which allows users to input an image and a text prompt, and the algorithm adjusts the image to match the prompt while keeping other elements as similar as possible. The presenter demonstrates various examples of the algorithm in action, such as changing a bird's pose or turning a dog from standing to sitting.

The lesson then dives into the code implementation of the Stable Diffusion model, which is used to generate images based on text prompts. The presenter explains the process of tokenizing the input text, using the CLIP encoder to create embeddings, and using a scheduler to determine the amount of noise at each step. The code is then run through a loop for a specified number of steps, updating the latents and generating the final image.

The presenter also shares their approach to organizing and simplifying the code, making it easier to understand and experiment with. They suggest homework assignments for viewers, such as implementing negative prompts or adding callbacks to their version of the code. This allows users to have a better understanding of the code and not rely solely on library updates.In this section of the video lesson, the instructor provides a rapid overview of Stable Diffusion and recent papers that have significantly developed the concept. The instructor then proceeds to demonstrate how to rebuild the Stable Diffusion concept from scratch, starting with basic matrix multiplication. The goal is to understand the foundations of Stable Diffusion, which include using Python, the Python standard library, Matplotlib, Jupyter notebooks, and nbdev. The instructor also introduces the "mini-ai" library that will be built throughout the course.

The instructor then demonstrates how to work with the MNIST dataset, which consists of 28x28 pixel grayscale images of handwritten digits. The instructor shows how to download the dataset, load it into Python, and convert the images into lists of lists. The instructor also introduces the concept of iterators and generators in Python, which are essential for working with large datasets efficiently.

The instructor demonstrates how to create a custom class in Python to work with matrices more conveniently. This involves defining special "dunder" methods, which have two underscores on each side and are used to define the behavior of the class. Overall, this section of the lesson provides a foundation for understanding and working with Stable Diffusion, as well as introducing essential Python concepts and techniques.In this section of the video lesson, the instructor discusses the Python data model and how to create a class that can store and index data using dunder init (__init__) and dunder getitem (__getitem__). The instructor also explains the concept of tensors, which are essentially multi-dimensional arrays, and their importance in deep learning. Tensors can be one-dimensional (vectors), two-dimensional (matrices), or higher-dimensional. The instructor then demonstrates how to create random numbers using a pseudo-random number generator, highlighting the importance of understanding random state and its implications in deep learning.

The instructor introduces the Wickman-Hill algorithm, which is a pseudo-random number generator that relies on a global random state. This algorithm is used to create a function called "rand" that generates random numbers with no obvious correlation between them and an even distribution. However, the instructor warns about the potential issues with random state when using parallel processing in deep learning, as the global state can be copied, leading to unexpected results. The instructor emphasizes the importance of properly initializing the random number generator in each process to avoid such issues.

Finally, the instructor compares the performance of their custom random number generator with Pytorch's built-in generator, showing that the Pytorch version is significantly faster. The lesson concludes with a brief discussion on creating a linear classifier using a 784 by 10 tensor, which represents the final layer of a neural network for classifying digits.