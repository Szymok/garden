---
title: Deep Learning
type: course
tags: 
aliases:
---
1. Do you need these for deep learning?

> - Lots of math - False
> - Lots of data - False
> - Lots of expensive computers - False
> - A PhD - False

2. Name five areas where deep learning is now the best in the world:

> Any five of the following:  
> Natural Language Processing (NLP) – Question Answering, Document Summarization and Classification, etc.  
> Computer Vision – Satellite and drone imagery interpretation, face detection and recognition, image captioning, etc.  
> Medicine – Finding anomalies in medical images (ex: CT, X-ray, MRI), detecting features in tissue slides (pathology), diagnosing diabetic retinopathy, etc.  
> Biology – Folding proteins, classifying, genomics tasks, cell classification, etc.  
> Image generation/enhancement – colorizing images, improving image resolution (super-resolution), removing noise from images (denoising), converting images to art in style of famous artists (style transfer), etc.  
> Recommendation systems – web search, product recommendations, etc.  
> Playing games – Super-human performance in Chess, Go, Atari games, etc  
> Robotics – handling objects that are challenging to locate (e.g. transparent, shiny, lack of texture) or hard to pick up  
> Other applications – financial and logistical forecasting; text to speech; much much more.

3. What was the name of the first device that was based on the principle of the artificial neuron?

> Mark I perceptron built by Frank Rosenblatt

4. Based on the book of the same name, what are the requirements for “Parallel Distributed Processing”?

> 1. A set of _processing units_
> 2. A _state of activation_
> 3. An _output function_ for each unit
> 4. A _pattern of connectivity_ among units
> 5. A _propagation rule_ for propagating patterns of activities through the network of connectivities
> 6. An _activation rule_ for combining the inputs impinging on a unit with the current state of that unit to produce a new level of activation for the unit
> 7. A _learning rule_ whereby patterns of connectivity are modified by experience
> 8. An _environment_ within which the system must operate

5. What were the two theoretical misunderstandings that held back the field of neural networks?

> In 1969, Marvin Minsky and Seymour Papert demonstrated in their book, “Perceptrons”, that a single layer of artificial neurons cannot learn simple, critical mathematical functions like XOR logic gate. While they subsequently demonstrated in the same book that additional layers can solve this problem, only the first insight was recognized, leading to the start of the first AI winter.
> 
> In the 1980’s, models with two layers were being explored. Theoretically, it is possible to approximate any mathematical function using two layers of artificial neurons. However, in practices, these networks were too big and too slow. While it was demonstrated that adding additional layers improved performance, this insight was not acknowledged, and the second AI winter began. In this past decade, with increased data availability, and improvements in computer hardware (both in CPU performance but more importantly in GPU performance), neural networks are finally living up to its potential.

6. What is a GPU?

> GPU stands for Graphics Processing Unit (also known as a graphics card). Standard computers have various components like CPUs, RAM, etc. CPUs, or central processing units, are the core units of all standard computers, and they execute the instructions that make up computer programs. GPUs, on the other hand, are specialized units meant for displaying graphics, especially the 3D graphics in modern computer games. The hardware optimizations used in GPUs allow it to handle thousands of tasks at the same time. Incidentally, these optimizations allow us to run and train neural networks hundreds of times faster than a regular CPU.

7. Open a notebook and execute a cell containing: 1+1 . What happens?

> In a Jupyter Notebook, we can create code cells and run code in an interactive manner. When we execute a cell containing some code (in this case: 1+1), the code is run by Python and the output is displayed underneath the code cell (in this case: 2).

8. Follow through each cell of the stripped version of the notebook for this chapter. Before executing each cell, guess what will happen.

> To be done by the reader.

9. Complete the Jupyter Notebook online appendix.

> To be done by the reader.

10. Why is it hard to use a traditional computer program to recognize images in a photo?

> For us humans, it is easy to identify images in a photos, such as identifying cats vs dogs in a photo. This is because, subconsciously our brains have learned which features define a cat or a dog for example. But it is hard to define set rules for a traditional computer program to recognize a cat or a dog. Can you think of a universal rule to determine if a photo contains a cat or dog? How would you encode that as a computer program? This is very difficult because cats, dogs, or other objects, have a wide variety of shapes, textures, colors, and other features, and it is close to impossible to manually encode this in a traditional computer program.

11. What did Samuel mean by “Weight Assignment”?

> “weight assignment” refers to the current values of the model parameters. Arthur Samuel further mentions an “ _automatic means of testing the effectiveness of any current weight assignment_ _” and a “_ _mechanism for altering the weight assignment so as to maximize the performance_ _”. This refers to the evaluation and training of the model in order to obtain a set of parameter values that maximizes model performance._

12. What term do we normally use in deep learning for what Samuel called “Weights”?

> We instead use the term parameters. In deep learning, the term “weights” has a separate meaning. (The neural network has various parameters that we fit our data to. As shown in upcoming chapters, the two _types_ of neural network parameters are weights and biases)

13. Draw a picture that summarizes Arthur Samuel’s view of a machine learning model

![samuel](https://forums.fast.ai/uploads/default/original/3X/7/0/701d716d473b29722bb281c77e661cb1f63e94b8.jpeg)

14. Why is it hard to understand why a deep learning model makes a particular prediction?

> This is a highly-researched topic known as interpretability of deep learning models. Deep learning models are hard to understand in part due to their “deep” nature. Think of a linear regression model. Simply, we have some input variables/data that are multiplied by some weights, giving us an output. We can understand which variables are more important and which are less important based on their weights. A similar logic might apply for a small neural network with 1-3 layers. However, deep neural networks have hundreds, if not thousands, of layers. It is hard to determine which factors are important in determining the final output. The neurons in the network interact with each other, with the outputs of some neurons feeding into other neurons. Altogether, due to the complex nature of deep learning models, it is very difficult to understand why a neural network makes a given prediction.
> 
> However, in some cases, recent research has made it easier to better understand a neural network’s prediction. For example, as shown in this chapter, we can analyze the sets of weights and determine what kind of features activate the neurons. When applying CNNs to images, we can also see which parts of the images highly activate the model. We will see how we can make our models interpretable later in the book.

15. What is the name of the theorem that a neural network can solve any mathematical problem to any level of accuracy?

> The universal approximation theorem states that neural networks can theoretically represent any mathematical function. However, it is important to realize that practically, due to the limits of available data and computer hardware, it is impossible to practically train a model to do so. But we can get very close!

16. What do you need in order to train a model?

> You will need an architecture for the given problem. You will need data to input to your model. For most use-cases of deep learning, you will need labels for your data to compare your model predictions to. You will need a loss function that will quantitatively measure the performance of your model. And you need a way to update the parameters of the model in order to improve its performance (this is known as an optimizer).

17. How could a feedback loop impact the rollout of a predictive policing model?

> In a predictive policing model, we might end up with a positive feedback loop, leading to a highly biased model with little predictive power. For example, we may want a model that would predict crimes, but we use information on arrests as a _proxy_ . However, this data itself is slightly biased due to the biases in existing policing processes. Training with this data leads to a biased model. Law enforcement might use the model to determine where to focus police activity, increasing arrests in those areas. These additional arrests would be used in training future iterations of models, leading to an even more biased model. This cycle continues as a _positive feedback loop_

18. Do we always have to use 224x224 pixel images with the cat recognition model?

> No we do not. 224x224 is commonly used for historical reasons. You can increase the size and get better performance, but at the price of speed and memory consumption.

19. What is the difference between classification and regression?

> Classification is focused on predicting a class or category (ex: type of pet). Regression is focused on predicting a numeric quantity (ex: age of pet).

20. What is a validation set? What is a test set? Why do we need them?

> The validation set is the portion of the dataset that is not used for training the model, but for evaluating the model during training, in order to prevent overfitting. This ensures that the model performance is not due to “cheating” or memorization of the dataset, but rather because it learns the appropriate features to use for prediction. However, it is possible that we overfit the validation data as well. This is because the human modeler is also part of the training process, adjusting _hyperparameters_ (see question 32 for definition) and training procedures according to the validation performance. Therefore, another unseen portion of the dataset, the test set, is used for final evaluation of the model. This splitting of the dataset is necessary to ensure that the model _generalizes_ to _unseen_ data.

21. What will fastai do if you don’t provide a validation set?

> fastai will automatically create a validation dataset. It will randomly take 20% of the data and assign it as the validation set ( `valid_pct` = `0.2` ).

22. Can we always use a random sample for a validation set? Why or why not?

> A good validation or test set should be representative of new data you will see in the future. Sometimes this isn’t true if a random sample is used. For example, for time series data, selecting sets randomly does not make sense. Instead, defining different time periods for the train, validation, and test set is a better approach.

23. What is overfitting? Provide an example.

> Overfitting is the most challenging issue when it comes to training machine learning models. Overfitting refers to when the model fits too closely to a limited set of data but does not generalize well to unseen data. This is especially important when it comes to neural networks, because neural networks can potentially “_memorize_” the dataset that the model was trained on, and will perform abysmally on unseen data because it didn’t “memorize” the ground truth values for that data. This is why a proper validation framework is needed by splitting the data into training, validation, and test sets.

24. What is a metric? How does it differ to “loss”?

> A _metric_ is a function that measures quality of the model’s predictions using the validation set. This is similar to the ­ _loss_ , which is also a measure of performance of the model. However, loss is meant for the optimization algorithm (like SGD) to efficiently update the model parameters, while metrics are human-interpretable measures of performance. Sometimes, a metric may also be a good choice for the loss.

25. How can pretrained models help?

> Pretrained models have been trained on other problems that may be quite similar to the current task. For example, pretrained image recognition models were often trained on the ImageNet dataset, which has 1000 classes focused on a lot of different types of visual objects. Pretrained models are useful because they have already learned how to handle a lot of simple features like edge and color detection. However, since the model was trained for a different task than already used, this model cannot be used as is.

26. What is the “head” of a model?

> When using a pretrained model, the later layers of the model, which were useful for the task that the model was originally trained on, are replaced with one or more new layers with randomized weights, of an appropriate size for the dataset you are working with. These new layers are called the “head” of the model.

27. What kinds of features do the early layers of a CNN find? How about the later layers?

> Earlier layers learn simple features like diagonal, horizontal, and vertical edges. Later layers learn more advanced features like car wheels, flower petals, and even outlines of animals.

28. Are image models only useful for photos?

> Nope! Image models can be useful for other types of images like sketches, medical data, etc.
> 
> However, a lot of information can be represented _as images_ . For example, a sound can be converted into a spectrogram, which is a visual interpretation of the audio. Time series (ex: financial data) can be converted to image by plotting on a graph. Even better, there are various transformations that generate images from time series, and have achieved good results for time series classification. There are many other examples, and by being creative, it may be possible to formulate your problem as an image classification problem, and use pretrained image models to obtain state-of-the-art results!

29. What is an “architecture”?

> The architecture is the template or structure of the model we are trying to fit. It defines the mathematical model we are trying to fit.

30. What is segmentation?

> At its core, segmentation is a pixelwise classification problem. We attempt to predict a label for every single pixel in the image. This provides a mask for which parts of the image correspond to the given label.

31. What is y_range used for? When do we need it?

> y_range is being used to limit the values predicted when our problem is focused on predicting a numeric value in a given range (ex: predicting movie ratings, range of 0.5-5).

32. What are “hyperparameters”?

> Training models requires various other parameters that define _how_ the model is trained. For example, we need to define how long we train for, or what learning rate (how fast the model parameters are allowed to change) is used. These sorts of parameters are hyperparameters.

33. What’s the best way to avoid failures when using AI in an organization?

> Key things to consider when using AI in an organization:
> 
> 1. Make sure a training, validation, and testing set is defined properly in order to evaluate the model in an appropriate manner.
> 2. Try out a simple baseline, which future models should hopefully beat. Or even this simple baseline may be enough in some cases.

## Summary
- Welcome to Part 1 2022 course
- Were computers smart enough to determine photos of birds before 2015?
- How to download and display a photo of a bird from DuckDuckGo using simple codes?
- What photos/images are actually made of, at least for computers?
- How to create two folders named ‘bird’ and ‘forest’ respectively under a larger folder ‘dest’? How to download 200 images for each category? How to resize and save those images in respective folders?
- How to find broken images and then remove or unlink them from their folders?
- How to create a DataBlock which prepares all the data for building models? How to display the images in a batch?
- How to build a model and train/finetune it on your local computer?
- How to predict or classify a photo of bird with a model?
- How to get started running and playing around the codes and models immediately and effortlessly?
- Why should you read lecture questionnaires before studying the lecture?
- How do you search and locate a particular moment inside a lecture video?
- Can you create an original masterpiece painting by simply utterring some artistic words?
- Can you believe that models today can explain your math problems not just give you a correct answer? Can you believe that models today can help you get a joke?
- Jeremy and fastai community make serious effort in help beginners continuously.
- Do you want to know how to make the most out of fastai?
- Do you know people learn naturally (better) with context rather than by theoretical curriculum? Do you want this course to make you a competent deep learning practitioner by context and practical knowledge? If you want theory from ground up, go to part 2 fastai 2019
- Do you know that learning the same thing in different ways betters understanding?
- Why you must take this course very seriously? (Personally, I think it’s truly a privilege to be taught by Jeremy and to be part of the fastai family. I didn’t appreciate it enough as I should 4 years ago.)
- Why did we need so many scientists from different disciplines to collaborate for many years in order to design a successful model before deep learning?
- Why can deep learning create a model to tell bird from forest photos in 2 minute which was the impossible before 2015? Would you like to see how much better/advanced/complex are the features discovered by deep learning than groups of interdisciplinary scientists?
- Are all things are data, sound, time (series), movement? Are images are just one way of expressing data? Why not store or express data (of sound, time, movement) in the form of images? Can imaged based algos learn on those images no matter how weird they appear to humans?
- Can I do DL with no math (I mean with high school math)? Can I train DL models with hand-made data (<50 samples)? Can I train state of art models for free (literally)?
- Which should I invest my life in DL software field, Pytorch or Tensorflow?
- Why should you use fastai over pure pytorch? Don’t you want to write less code, make less error, achieve better result? Don’t you want a robust and simple tool used by your future colleagues and bosses?
- Why is jupyter notebook the most loved and tested coding tool for DL? Do you want Jeremy to show you how to use Jupyter notebook hand by hand?
- How to make sure your notebook is connected in the cloud? How to make sure you are using the latest updated fastai? #best-practice
- Doesn’t fastai feel like python with best practices too? How to import libraries to download images? How to create and display a thumbnail image? Always view your data at every step of building a model #best-practice How to download and resize images? Why do we resize images? #best-practice
- Why a real world DL practitioner spend most of the valuable/productive time preparing data rather than tweaking models? Can super tiny amount of models solve super majority of practical problems in the world? Have fastai selected and prepared the best models for us already?
- Does Jeremy add best practices of other programming languages into fastai? Jeremy loves functional programming
- How fastai design team decide what tasks should DataBlock do? task 1: Which blocks of data do DataBlock need to prepare for training? task 2: How should DataBlock get those data, or by what function/tool? task 3: Should we always ask DataBlock to keep a section of data for validation? task 4: Which function or method should DataBlock use to get label for y? task 5: Which transformation should DataBlock apply to each data sample? task 6: Does dataloader do the above tasks efficiently by doing them in thousands of batches at the same time with the help of GPUs?
- What is the most efficient way of finding out how to use e.g., DataBlock properly? How to learn DataBlock thoroughly?
- What do you give to a learner, e.g., vision_learner?
- Is fastai the first and only framework implement TIMM? Can you use any model from TIMM in your project? Where can you learn more of TIMM?
- What is a pretrained model, Resnet18? What did this model learn from? What come out of this model’s learning? or what is Kaggle downloading exactly?
- What exactly does fine tuning do to the pretrained model? What does fine-tuning want the model learn from your dataset compared with the pretrained dataset?
- How to use the fine tuned model to make predictions?
- Can we fine tune pretrained CV models to tell us the object each and every pixel on a photo belong to?
- Why do we need specialized DataLoaders like SegmentationDataLoaders given DataBlock?
- What can tabular analysis do? Can we use a bunch of columns to predict another column of a table? How do you download all kinds of dataset for training easily with fastai? untar_data What are the parameters for TabularDataLoaders? What is the best practice show_batch of fastai learned from Julia (another popular language)? Why to use fit_one_cycle instead of fine_tune for tabular dataset?
- Can we use collaborative filtering to make movie recommendations for users? How does recommendation system work? Can collaborative filtering models learn from data of similar music users and recommend/predict music for new users based on how similar they are to existing users?
- How to download dataset for collaborative filtering models? How to use CollabDataLoaders? How to build a collaborative filtering model with collab_learner? What is the best practice for setting y_range for collab_learner? #best-practice If in theory no reason to use pretrained collab models, and fine_tune works as good as fit or fit_one_cycle, any good explanations for it? #question How to show results of this recommendation model using show_results?
- What can Deep Learning do at the present? What are the tasks that deep learning may not be good at?
- Has the basic idea of deep learning changed much since 1959?
- What did we write into programs/models before deep learning? How to draw chart in jupyter notebook?
- What is a model? What are weights? How do data, weights and model work together to produce result? Why are the initial results are no good at all? Can we design a function to tell the model how good it is doing? loss function Then can we find a way to update/improve weights by knowing how bad/good the model is learning each time from the data? If we can iterate the cycle multiple times, can we build a powerful model?
- Homework: Run notebooks, especially the bird notebook. Create something interesting to you based on the bird notebook. Read the first chapter of the book. Be inspired by all the amazing student projects.

[  
](https://course.fast.ai/Lessons/lesson8a.html)