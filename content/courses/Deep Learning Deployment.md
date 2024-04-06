---
title: Deep Learning Deployment
type: course
tags: 
aliases:
---
1. Provide an example of where the bear classification model might work poorly, due to structural or style differences to the training data.

> There are many cases that the bear classification model could fail, especially if these cases were not represented in the training data:
> 
> - The bear is partially obstructed
> - Nighttime images are passed into the model
> - Low-resolution images are passed into the model
> - The bear is far away from the camera
> - The bear training dataset is highly biased towards one type of features (eg. color)

2. Where do text models currently have a major deficiency?

> Text models can generate context-appropriate text (like replies or imitating author style). However, text models still struggle with _correct_ responses. Given factual information (such as a knowledge base), it is still hard to generate responses that utilizes this information to generate factually correct responses, though the text can seem very compelling. This can be very dangerous, as the layman may not be able to evaluate the factual accuracy of the generated text.

3. What are the possible negative societal implications of text generation models?

> The ability for text generation models to generate context-aware, highly compelling responses can be used at a massive scale to spread disinformation (“fake news”) and encourage conflict.

> Models reinforce bias (like gender bias, racial bias) in training data and create a vicious cycle of biased outputs.

4. In situations where a model might make mistakes, and those mistakes could be harmful, what is a good alternative to automating a process?

> The predictions of the model could be reviewed by human experts for them to evaluate the results and determine what is the best next step. This is especially true for applying machine learning for medical diagnoses. For example, a machine learning model for identifying strokes in CT scans can alert high priority cases for expedited review, while other cases are still sent to radiologists for review. Or other models can also augment the medical professional’s abilities, reducing risk but still improving efficiency of the workflow. For example, deep learning models can provide useful measurements for radiologists or pathologists.

5. What kind of tabular data is deep learning particularly good at?

> Deep learning is good at analyzing tabular data that includes natural language, or high cardinality categorical columns (containing larger number of discrete choices like zip code).

6. What’s a key downside of directly using a deep learning model for recommendation systems?

> Machine learning approaches for recommendation systems will often only tell what products a user might like, and may not be recommendations that would be helpful to the user. For example, if a user is familiar with other books from the same author, it isn’t helpful to recommend those products even though the user bought the author’s book. Or, recommending products a user may have already purchased.

7. What are the steps of the Drivetrain approach?

> [![0312-1-drivetrain-approach-lg](https://forums.fast.ai/uploads/default/optimized/2X/b/b4fcf03eeeca3ebe8d5948067509784f8f0c2351_2_690x161.png)
> 
> 0312-1-drivetrain-approach-lg900×210 86 KB
> 
> ](https://forums.fast.ai/uploads/default/original/2X/b/b4fcf03eeeca3ebe8d5948067509784f8f0c2351.png "0312-1-drivetrain-approach-lg")

8. How do the steps of the Drivetrain approach map to a recommendation system?

> The **objective** of a recommendation engine is to drive additional sales by surprising and delighting the customer with recommendations of items they would not have purchased without the recommendation. The **lever** is the ranking of the recommendations. New **data** must be collected to generate recommendations that will _cause new sales_ . This will require conducting many randomized experiments in order to collect data about a wide range of recommendations for a wide range of customers. This is a step that few organizations take; but without it, you don’t have the information you need to actually optimize recommendations based on your true objective (more sales!)

9. Create an image recognition model using data you curate, and deploy it on the web.

> To be done by the reader. Watch [lesson 2 video 105](https://youtu.be/BvHmRx14HQ8?t=4485) for help.

10. What is `DataLoaders`?

> The `DataLoaders` class is the class that passes the data to the fastai model. It is essentially a class that stores the required `Dataloader` objects (usually for train and validation sets).

11. What four things do we need to tell fastai to create `DataLoaders`?

> - what kinds of data we are working with
> - how to get the list of items
> - how to label these items
> - how to create the validation set

12. What does the splitter parameter to `DataBlock` do?

> In fastai `DataBlock`, you provide the splitter argument a way for fastai to split up the dataset into subsets (usually train and validation set). For example, to randomly split the data, you can use fastai’s predefined `RandomSplitter` class, providing it with the proportion of the data used for validation.

13. How do we ensure a random split always gives the same validation set?

> It turns out it is impossible for our computers to generate truly random numbers. Instead, they use a process known as a pseudo-random generator. However, this process can be controlled using a random seed. By setting a random seed value, the pseudo-random generator will generate the “random” numbers in a fixed manner and it will be the same for every run. Using a random seed, we can generate a random split that gives the same validation set always.

14. What letters are often used to signify the independent and dependent variables?

> x is independent. y is dependent.

15. What’s the difference between `crop`, `pad`, and `squish` `Resize()` approaches? When might you choose one over the other?

> default resized (cropped) grizzly image:
> 
> ![Screen Shot 2020-03-25 at 11.22.10 AM](https://forums.fast.ai/uploads/default/original/3X/7/3/736f4e4d0967d359a83864406ac066e180fdce1f.png)  
> `crop` is the default `Resize()` method, and it _crops_ the images to fit a square shape of the size requested, using the full width or height. This can result in losing some important details. For instance, if we were trying to recognize the breed of dog or cat, we may end up cropping out a key part of the body or the face necessary to distinguish between similar breeds.
> 
> `pad` is an alternative `Resize()` method, which pads the matrix of the image’s pixels with zeros (which shows as black when viewing the images). If we pad the images then we have a whole lot of empty space, which is just wasted computation for our model, and results in a lower effective resolution for the part of the image we actually use.
> 
> padded grizzly image:
> 
> ![Screen Shot 2020-03-25 at 11.25.41 AM](https://forums.fast.ai/uploads/default/original/3X/9/b/9b7ccf3c7749666d12c1d0980e7ca1f0288a7e68.png)
> 
> `squish` is another alternative `Resize()` method, which can either squish or stretch the image. This can cause the image to take on an unrealistic shape, leading to a model that learns that things look different to how they actually are, which we would expect to result in lower accuracy.
> 
> grizzly image squished:
> 
> ![Screen Shot 2020-03-25 at 11.29.00 AM](https://forums.fast.ai/uploads/default/original/3X/4/f/4f0eff2b52ae6858a5e6deb2cd56b48c7e86fc5e.png)  
> Which resizing method to use therefore depends on the underlying problem and dataset. For example, if the features in the dataset images take up the whole image and cropping may result in loss of information, squishing or padding may be more useful.
> 
> Another better method is `RandomResizedCrop`, in which we crop on a randomly selected region of the image. So every epoch, the model will see a different part of the image and will learn accordingly.

16. What is data augmentation? Why is it needed?

> Data augmentation refers to creating random variations of our input data, such that they appear different, but not so different that it changes the meaning of the data. Examples include flipping, rotation, perspective warping, brightness changes, etc. Data augmentation is useful for the model to better understand the basic concept of what an object is and how the objects of interest are represented in images. Therefore, data augmentation allows machine learning models to _generalize_ . This is especially important when it can be slow and expensive to label data.

17. What is the difference between `item_tfms` and `batch_tfms`?

> `item_tfms` are transformations applied to a single data sample `x` on the CPU. `Resize()` is a common transform because the mini-batch of input images to a cnn must have the same dimensions. Assuming the images are RGB with 3 channels, then `Resize`() as item_tfms will make sure the images have the same width and height.  
> `batch_tfms` are applied to batched data samples (aka individual samples that have been collated into a mini-batch) on the GPU. They are faster and more efficient than `item_tfms`. A good example of these are the ones provided by `aug_transforms()`. Inside are several batch-level augmentations that help many models.

18. What is a confusion matrix?

> A class confusion matrix is a representation of the predictions made vs the correct labels. The rows of the matrix represent the actual labels while the columns represent the predictions. Therefore, the number of images in the diagonal elements represent the number of correctly classified images, while the off-diagonal elements are incorrectly classified images. Class confusion matrices provide useful information about how well the model is doing and which classes the model might be _confusing_ .

19. What does `export` save do?

> `export` saves both the architecture, as well as the trained parameters of the neural network architecture. It also saves how the `DataLoaders` are defined.

20. What is it called when we use a model for getting predictions, instead of training?

> Inference

21. What are IPython widgets?

> IPython widgets are JavaScript and Python combined functionalities that let us build and interact with GUI components directly in a Jupyter notebook. An example of this would be an upload button, which can be created with the Python function `widgets.FileUpload()`.

22. When might you want to use CPU for deployment? When might GPU be better?

> GPUs are best for doing identical work in parallel. If you will be analyzing single pieces of data at a time (like a single image or single sentence), then CPUs may be more cost effective instead, especially with more market competition for CPU servers versus GPU servers. GPUs could be used if you collect user responses into a batch at a time, and perform inference on the batch. This may require the user to wait for model predictions. Additionally, there are many other complexities when it comes to GPU inference, like memory management and queuing of the batches.

23. What are the downsides of deploying your app to a server, instead of to a client (or edge) device such as a phone or PC?

> The application will require network connection, and there will be extra network latency time when submitting input and returning results. Additionally, sending private data to a network server can lead to security concerns.
> 
> On the flip side deploying a model to a server makes it easier to iterate and roll out new versions of a model. This is because you as a developer have full control over the server environment and only need to do it once rather than having to make sure that all the endpoints (phones, PCs) upgrade their version individually.

24. What are 3 examples of problems that could occur when rolling out a bear warning system in practice?

> The model we trained will likely perform poorly when:
> 
> 1. Handling night-time images
> 2. Dealing with low-resolution images (ex: some smartphone images)
> 3. The model returns prediction too slowly to be useful

25. What is “out of domain data”?

> Data that is fundamentally different in some aspect compared to the model’s training data. For example, an object detector that was trained exclusively with outside daytime photos is given a photo taken at night.

26. What is “domain shift”?

> This is when the type of data changes gradually over time. For example, an insurance company is using a deep learning model as part of their pricing algorithm, but over time their customers will be different, with the original training data not being representative of current data, and the deep learning model being applied on effectively out-of-domain data.

27. What are the 3 steps in the deployment process?

> 1. Manual process – the model is run in parallel and not directly driving any actions, with humans still checking the model outputs.
> 2. Limited scope deployment – The model’s scope is limited and carefully supervised. For example, doing a geographically and time-constrained trial of model deployment, that is carefully supervised.
> 3. Gradual expansion – The model scope is gradually increased, while good reporting systems are implemented in order to check for any significant changes to the actions taken compared to the manual process (i.e. the models should perform similarly to the humans, unless it is already anticipated to be better).

28. For a project you’re interested in applying deep learning to, consider the thought experiment “what would happen if it went really, really well?”

## Summary

- New exciting content to come
    - Can there be substantial new content given we have already 4 versions and a book?
- Ways of reading the book
    - How many channels available for us to read the book? (physical, github, colab and others)
- Extra sweets from the book
    - Are there interesting materials/stories covered by the book not the lecture?
    - Where can you find questionnaires and quizzes of the lectures?
- aiquizzes.com
    - Where can you get more quizzes of fastai and memorize them forever?
- Introducing the forum
    - How to make the most out of fastai forum?
- Students’ works after week 1
- A Wow moment
    - Will we learn to put model in production today?
- Find a problem and some data
    - What is the first step before building a model?
- Access to the magics of Jupyter notebook
    - Do you want to navigate the notebook with a TOC?
    - How about collapsable sections?
    - How about moving between start and end of sections fast?
    - How to install jupyter extensions
- Download and clean your data
    - Why use ggd rather than bing for searching and downloading images?
    - How to clean/remove broken images?
- Get to docs quickly
    - How to get basic info, source code, full docs on fastai codes quickly?
- Resize your data before training
    - How can you specify the resize options to your data?
    - Why should we always use RandomResizedCrop and `aug_transforms` together?
    - How RandomResizedCrop and `aug_transforms` differ?
- Data images instantly transformed not copied
    - When resized, are we making many copies of the image?
- More epochs for fancy resize
    - How many epochs do we usually go when using RandomResizedCrop and `aug_transforms`?
- Confusion matrix: where do models get wrong the most?
    - How to create confusion matrix on your model performance?
    - When to use confusion matrix? (category)-practice
    - How to interpret confusion matrix?
    - What is the most obvious thing does it tell us?
    - How hard is it to tell grizzly and black bears apart?
- Check out images with worse predictions
    - Do `plot_top_losses` give us the images with highest losses?
    - Are those images merely ones the model made confidently wrong prediction?-practice
    - Do those images include ones that the model made right prediction unconfidently?
    - What does looking at those high loss images help? (get expert examination or simple data cleaning)
- What if you want to clean the data a little
    - How to display and make cleaning choices on each of those top loss images in each data folder?-practice
    - Without expert knowledge on telling apart grizzly and black bears, at least we can clean images which mess up teddy bears.
- Myth breaker: train model and then clean data
    - How can training the model help us see the problem of dataset?-practice
    - Won’t we have more ideas to improve the dataset once we spot the problems of the dataset?
- Turn off GPU when not using
    - How to use GPU RAM locally without much trouble?
- Watch first, then watch and code along
    - What is the preferred way of lecture watching and coding by majority of students?
- A Gradio + hugging face tutorial
- Git and Github desk
    - Is Github desk a less cool but easier and more robust way to version control than git?
- Terminal for windows
    - How to set up terminal for windows?
    - Why Jeremy prefer windows than mac?
- Get started with Hugging Face Spaces
    - go to huggingface.co/spaces and create a new space
- Get the default App up and running
    - How to use git to download your space folder?
    - How to open vscode to add app.py file?
    - How to use vscode to push your space folder up to hugging face spaces online?
    - then go back to your space on Hugging Face to see the app running
- Train and download your model
    - Where is the model we are going to train and download from Kaggle notebook?
    - How to export your model after trained it on Kaggle?
    - Where do you download the model?
    - How to open a folder in terminal? `open .`
    - Make sure the model is downloaded into its own Hugging Face Space folder
- Predict with loaded model
    - How to load downloaded model to make prediction?
    - How to make prediction with the loaded model?
    - How to export selected cells of a jupyter notebook into a python file?
    - How to see how long a code runs in a jupyter cell?
- Turn your model into Gradio App locally
    - How to prepare your prediction result into a form gradio prefers? #code
    - How to build a gradio interface for your model?
    - How to launch your app with the model locally?
    - Not in video: run the code on Kaggle in cloud
- Push this app onto Hugging Face Spaces
    - Make sure to create a new space first, e.g., testing
    - How to turn the notebook into a python script?
    - How to push the folder up to github and run app in cloud?
    - Not in Video: if stuck, check out Tanishq tutorial-shooting
- How many epochs are ideal for fine tuning?
- How to save model from colab?
- How to install fastai properly
    - How to download github/fastai/fastsetup using git? `git clone https://github.com/fastai/fastsetup.git`
    - How to download and install mamba? `./setup_conda.sh`
    - Not in Video: problem of running `./setup_conda.sh`
    - How to download and install fastai? `mamba install -c fastchan fastai`
    - How to install nbdev? `mamba install -c fastchan nbdev`
    - How to start to use jupyter notebook? `jupyter notebook --no-browser`
    - Not in Video: other problem related to xcode
- The workflow summary
- HuggingFace API + gradio + Javascript = real APP
- How easy does HuggingFace API work
- How easy to to get started with JS + HF API + gradio
- App example of having multiple inputs and outputs
- App example of combining two models
- How to turn your model into your own web App with fastpages
- How to fork a public fastpages for your own use