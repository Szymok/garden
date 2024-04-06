---
title: Deep Learning Random Forests
type: course
tags: 
aliases:
---
## Summary
- Review: lecture 5 and OneR from scratch
- How to build a TwoR model manually (towards a decision tree)?
- How to create a decision tree with 4 leaves and draw the graph? How to interpret the graph? Why decision tree is loved when doing explorative analysis?
- What is `gini` in terms of how good a split is? What is its source code? How to think of `gini` in terms of the probability of grab the same item in multiple times?
- Why the `mean_absolute_error` of the decision tree is actually worse than the OneR version?
- How to build a decision tree with 50 leaves? How well does it work?
- How to make prediction and prepare a csv to upload to the kaggle leaderboard? We should start with a base model like this and improve the model everyday
- How decision tree frees you from dummy variables, taking log of the fare, thinking of the outliers and long tail of distributions? Jeremy always use decision trees to create a base line model, which is hard to mess up. How decision trees turn categories like `embarked` into strings and then numbers to sort? How many levels does Jeremy usually use decision tree with?
- How to build many unbiased and uncorrelated models (or decision trees) for bagging? This approach to build all these models is called random forest
- How to create a random forest with 100 decision trees? How to make them random trees? How to average the predictions of all the trees and submit to kaggle?
- What does feature-important (a favorite of Jeremy) do? Does it care about distribution or numeric vs categorical? How does Jeremy use it? and there is an amazing story of Jeremy and feature-important for credit default problem
- Does increasing num of trees always increase accuracy? Yes with tiny bumps. Does the increase of return decrease? The more trees you have, the longer the inference time, but you can speed it up by good code. Does Jeremy often use more than 100 trees? chp 8 of fastbook
- What is OOB (out of bag error)? How does bagging get away from not having a validation set given each tree only use 75%of dataset for training? Does sklearn make using OOB easy?
- What is bagging compared with random forest? Is random forest just bagging (meta model) applied to tabular data with lots of decision trees? Can we bag not just a lot of decision trees (into random forest) but also bag a lot of neuralnets? Will we (fastai people) do it, given most people don’t do it?
- What are the insights or model interpretations can be given to us by Random Forest?
- How does the bagging help us find out how confident we are about the prediction of a row of tabular data?
- After you find out those important features, what to do about those less important columns or features of the tabular dataset?
- Check out the book section on removing the redundant features
- What does Partial dependence do? How each column/feature is related to dependent variable? Is this one particular to Random Forest? Why calculating partial dependence is not as easy as it sounds? How does partial dependence work behind the scene? Can we do more than one feature partial dependence at one time?
- Can you explain why a particular prediction is made? Can tree interpreter give us feature importance (or the path from root to leaf) of the model prediction of a row of data?
- Would you delete a tree which does not perform well? No, doing so would bias your bagging.
- Will bagging of bags do better than one bag? No, average of averages is still average
- What does Jeremy think of Random forest’s feature importance vs other model explanability techniques? When to use feature importance and other explanability techniques?
- tabular section is on chp 9. Can you overfit a random forest? No, more trees make it more accurate, but not enough trees with deep levels can make your random forest overfit.
- Can you confuse random forest by adding lots of noise columns/features?
- What you don’t need to worry about with random forest? interaction in logistic regression, normalization
- What is gradient boosting? How does boosting work? Are bagging and boosting both meta models which can be applied to decision trees? Random forest vs Gradient boosting trees. Can Gradient boosting overfit given it is more accurate? What’s Jeremy’s take on random forest vs gradient boost?
- Introducing walkthrus on paddy competition and what is so thrilling about it
- What is the basic process extracted from the walkthrus?
- What does `fastkaggle` do for us? How to install and update it? Can it download kaggle data for us regardless whether you are on kaggle or not?
- There are so much benefits we can get by keep working on kaggle competitions, such as forcing you to face the truth and stopping lying to yourself about how good your model is, etc.
- What are the two things we should focus on? a good validation set and how to iterate in a minute. Why it is so important to iterate (telling it with a story)?
- When does Jeremy use `seed=42` and when not?
- Do recognise how pytorch and PILImage describe the shape of a tensor/image? Pytorch (640 rows x 480 columns ) vs PILImage( 480 columns x 640 rows)
- Does it take a lot of compute to figure out the shape or size of an image? How does Jeremy’s `fastcore.parallel` help to figure out the sizes of all images much faster?
- What’s the easist thing to do with the images? What does `item_tfms=Resize(480, method='squish'` do? What does `batch_tfms=aug_transforms(size=128, scale=0.75` do? can we use `dls.show_batch(max_n=6)` for any kind of data?
- Why Jeremy usually build a model very early on and choose the ones which can iterate fast?
- What is the project Jeremy and Thomas created to find out the best models for fine-tuning? How many different architectures have been examined? How different the two datasets they used?
- What are the criteria for evaluating the models? How they are compared? Which model architecture did Jeremy choose for his first model and why? What does Jeremy think of studying the structure of model architectures like resnet26?
- How did Jeremy create his first model? How does Jeremy use `lr_find` to pick a more appropriate learning rate? How fast is Jeremy’s first model? Why Jeremy wants it this way?
- Should we submit as soon as we can? How do we check out the submit format first? How should we build a dataloader for test set? How do we predict all the test set and return a list of indices pointing to the most probable disease type? How do we create a dictionary with `dls.vocab` and use pandas map function to map indices to disease type strings? How to put our final processed result into a dataframe and save them into a csv file and check the results from the csv file in terminal?
- How do we even make submitting to kaggle a fast automation?
- a base line model which iterates fast and trained within a minute gets us to top 80% or bottom 20% is not bad, and is a good starting point.
- How to even automate the process of sharing kaggle notebooks? and Why would you publish your notebooks on kaggle (or why this is very beneficial)?
- How does Jeremy iterate models with notebooks (bon local and kaggle) in a real simple but practically effective style?
- What does Jeremy think of AutoML? How does Jeremy approach hyperparameter optimization? How Jeremy found out `squish` is always better than `cropping` in most cases without grid search? How Jeremy find a good learning rate fast without grid search?
- What is Jeremy’s rule of thumb? computer vision problem uses deep learning models, random forest (not bothered by GBM) for tabular dataset
- Why the first model run so slow on Kaggle GPUs? How to make our model/notebook run faster on Kaggle gpus and cpus? How to first resize (down-size) all training data and put them into a different folder? How much faster did Jeremy get after this?
- How badly the first model utilizes Kaggle GPU? Did Kaggle 2 CPUs get exhausted?
- How did Jeremy pick the second model architecture for the second iteration?
- How much better can a new novel architecture improve the accuracy versus the first model (resnet26)?
- Why should we move from the era of resnet onto the new era of convnext? How to pick the appropriate models from the convnext family for our iterations?
- How to iterate the model with different settings fast by putting everything into a single function `train`? How to quickly try resizing with random cropping without `squish`? What did Jeremy find out about this model iteration?
- How to iterate the model with padding? What’s special about padding versus cropping versus squish? What’s its downsides? and how well did this iteration do?
- What does our data augmentation do to images? How to understand Test-time augmentation (tta) in terms of mini-bagging? How easy fastai makes tta work? tta should work better but in this particular kaggle run, it didn’t. Jeremy said will come back to this next time.
- How to iterate the model with larger images and longer epochs? How much better did this iteration get us? Up to this point, the mechanism behind all the iterations above is universal to all different problems
- How does the pandas indexing make mapping from indices to vocab string super fast? and submit to kaggle the usual way?
- Do we always do data augmentation for images? What data-augmentation does tta use?
- Why does Jeremy use different aspect ratios during different iterations? What are the better things Jeremy has been experimenting?
- Why Jeremy didn’t create images more image-like，but instead using simple padding (i.e., black stripes)?

[  
](https://course.fast.ai/Lessons/Summaries/lesson5.html)