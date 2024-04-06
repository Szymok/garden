---
title: Deep Learning Kerras
type: course
tags: 
aliases:
---
- DDPM/DDIM improvements
- Predicting the amount of noise in an image
- Noise scheduling for diffusion models
- Scaling input and output images
- Importance of unit variance inputs and outputs
- Implementation and performance of different samplers
    - Euler sampler
    - Ancestral Euler sampler
    - Heuns method
    - LMS sampler

In this video lesson, the instructor explores improvements to the DDPM/DDIM implementation for fashion using a Jupyter Notebook. They discuss the removal of the concept of N steps and the capital T, which previously represented the time step in the diffusion process. Instead, they now assume that the time step is between 0 and 1, representing the percentage of the way through the diffusion process. This change simplifies the process and makes it more continuous.

The instructor then explores the idea of predicting the amount of noise in an image without passing the time step (T) as input. They create a model that predicts the alpha bar T (the amount of noise) given a noisy image. After training the model, they find that it can predict the amount of noise with reasonable accuracy. However, when they attempt to use this model for sampling without passing the time step, the results are not as good as expected.

To address this issue, the instructor modifies the DDIM step to use the predicted alpha bar T for each image, clamped to be not too far away from the median. This approach updates the noise based on the amount of noise that actually seems to be left behind, rather than the assumed amount of noise that should be left behind. The results are much better, with the new approach producing similar quality images to the original method. The instructor suggests that this "no T" approach could eventually surpass the T-based approaches, as it has been developed more recently and shows promising results.In this video lesson, the instructors discuss the research process and the importance of noise scheduling for diffusion models. They highlight that the research process is not linear and involves a lot of back and forth discussions, debugging, and exploring. They also mention that they have tried different noise schedules and input scaling strategies on larger models to see if they work.

The instructors then discuss a paper on the importance of noise scheduling for diffusion models, which demonstrates that the optimal noise schedule depends on the type of data and image size. The paper also shows that scaling the input data is a good strategy for working with different noise schedules. The authors of the paper propose a method called C-skip, which predicts an interpolated version of the clean image and the noise, depending on the amount of noise present in the input. This makes the problem to be solved by the model equally difficult regardless of the noise level.

The instructors also mention that this idea of interpolating between the noise and the image is similar to the VM objectives used in other models, such as the Steeple Diffusion 2.0. This methodology has been used in practice and has produced good results.In this section of the video lesson, the presenter discusses the importance of paying attention to side notes in research papers, as they can sometimes contain valuable information. They then explain the process of scaling input and output images in the context of noise and variance. The presenter also highlights the importance of having unit variance inputs for models and demonstrates how this can be achieved.

The lesson then moves on to the topic of sampling, where the presenter explains the concept of reverse diffusion sigma steps and how they can be used to improve the sampling process. They discuss the Euler sampler, which is a simple and deterministic method for sampling, and show that it can achieve a good FID score. The presenter then introduces the Ancestral Euler sampler, which adds randomness to the sampling process, resulting in an even better FID score.

The presenter explains Heuns method, which calculates the average slope between the current position and the position where the Euler method would have taken the model. This method is shown to be more accurate than the Euler sampler, as it takes into account the slope at both the current position and the predicted position. Overall, the lesson emphasizes the importance of understanding the underlying concepts and techniques in research papers and demonstrates how these can be applied to improve model performance.In this section of the video lesson, the instructor discusses the performance of different samplers in the context of diffusion-based models. They mention that the Hewne sampler, which calls the model twice for a single step, performs better than the Euler sampler even with fewer steps. However, they also point out that the LMS sampler, which uses only 20 evaluations, beats Euler with 100 evaluations. The LMS sampler achieves this by storing the slope in a list and using up to the last four to estimate the curvature and take the next step.

The instructor then mentions that there is a newer sampler similar to the DDPM+ sampler, which also keeps a list of recent results and uses that for the next step. They highlight the importance of having unit variance inputs and outputs, as well as a different schedule for sampling that is unrelated to the training schedule. The instructor also appreciates the paper "Elucidating the Design Space of Diffusion-Based Models" for simplifying the code and connecting various approaches in a common framework.
