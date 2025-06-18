---
title: Deep Learning (CNNs)
type: course
tags: 
aliases:
---
1. What is a continuous variable?

> This refers to numerical variables that have have a wide range of “continuous” values (ex: age)

2. What is a categorical variable?

> This refers to variables that can take on discrete levels that correspond to different categories.

3. Provide 2 of the words that are used for the possible values of a categorical variable.

> Levels or categories

4. What is a “dense layer”?

> Equivalent to what we call linear layers.

5. How do entity embeddings reduce memory usage and speed up neural networks?

> Especially for large datasets, representing the data as one-hot encoded vectors can be very inefficient (and also sparse). On the other hand, using entity embeddings allows the data to have a much more memory-efficient (dense) representation of the data. This will also lead to speed-ups for the model.

6. What kind of datasets are entity embeddings especially useful for?

> It is especially useful for datasets with features that have high levels of cardinality (the features have lots of possible categories). Other methods often overfit to data like this.

7. What are the two main families of machine learning algorithms?

> - Ensemble of decision trees are best for structured (tabular data)
> - Multilayered neural networks are best for unstructured data (audio, vision, text, etc.)

8. Why do some categorical columns need a special ordering in their classes? How do you do this in pandas?

> Ordinal categories may inherently have some order and by using `set_categories` with the argument `ordered=True` and passing in the ordered list, this information represented in the pandas DataFrame.

9. Summarize what a decision tree algorithm does.

> The basic idea of what a decision tree algorithm does is to determine how to group the data based on “questions” that we ask about the data. That is, we keep splitting the data based on the levels or values of the features and generate predictions based on the average target value of the data points in that group. Here is the algorithm:
> 
> 1. Loop through each column of the dataset in turn
> 2. For each column, loop through each possible level of that column in turn
> 3. Try splitting the data into two groups, based on whether they are greater than or less than that value (or if it is a categorical variable, based on whether they are equal to or not equal to that level of that categorical variable)
> 4. Find the average sale price for each of those two groups, and see how close that is to the actual sale price of each of the items of equipment in that group. That is, treat this as a very simple “model” where our predictions are simply the average sale price of the item’s group
> 5. After looping through all of the columns and possible levels for each, pick the split point which gave the best predictions using our very simple model
> 6. We now have two different groups for our data, based on this selected split. Treat each of these as separate datasets, and find the best split for each, by going back to step one for each group
> 7. Continue this process recursively, and until you have reached some stopping criterion for each group — for instance, stop splitting a group further when it has only 20 items in it.

10. Why is a date different from a regular categorical or continuous variable, and how can you preprocess it to allow it to be used in a model?

> Some dates are different to others (ex: some are holidays, weekends, etc.) that cannot be described as just an ordinal variable. Instead, we can generate many different categorical features about the properties of the given date (ex: is it a weekday? is it the end of the month?, etc.)

11. Should you pick a random validation set in the bulldozer competition? If no, what kind of validation set should you pick?

> No, the validation set should be as similar to the test set as possible. In this case, the test set contains data from later data, so we should split the data by the dates and include the later dates in the validation set.

12. What is pickle and what is it useful for?

> Allows you so save nearly any Python object as a file.

13. How are mse, samples, and values calculated in the decision tree drawn in this chapter?

> By traversing the tree based on answering questions about the data, we reach the nodes that tell us the average value of the data in that group, the mse, and the number of samples in that group.

14. How do we deal with outliers, before building a decision tree?

> Finding out of domain data (Outliers)
> 
> Sometimes it is hard to even know whether your test set is distributed in the same way as your training data or, if it is different, then what columns reflect that difference. There’s actually a nice easy way to figure this out, which is to use a random forest!
> 
> But in this case we don’t use a random forest to predict our actual dependent variable. Instead we try to predict whether a row is in the validation set, or the training set.

15. How do we handle categorical variables in a decision tree?

> We convert the categorical variables to integers, where the integers correspond to the discrete levels of the categorical variable. Apart from that, there is nothing special that needs to be done to get it to work with decision trees (unlike neural networks, where we use embedding layers).

16. What is bagging?

> Train multiple models on random subsets of the data, and use the ensemble of models for prediction.

17. What is the difference between max_samples and max_features when creating a random forest?

> When training random forests, we train multiple decision trees on random subsets of the data. `max_samples` defines how many samples, or rows of the tabular dataset, we use for each decision tree. `max_features` defines how many features, or columns of the tabular dataset, we use for each decision tree.

18. If you increase n_estimators to a very high value, can that lead to overfitting? Why or why not?

> A higher `n_estimators` mean more decision trees are being used. However, since the trees are independent of each other, using higher `n_estimators` does not lead to overfitting.

19. What is _out of bag error_ ?

> Only use the models not trained on the row of data when going through the data and evaluating the dataset. No validation set is needed.

20. Make a list of reasons why a model’s validation set error might be worse than the OOB error. How could you test your hypotheses?

> The major reason could be because the model does not generalize well. Related to this is the possibility that the validation data has a slightly different distribution than the data the model was trained on.

21. How can you answer each of these things with a random forest? How do they work?:

- How confident are we in our projections using a particular row of data?

> Look at standard deviation between the estimators

- For predicting with a particular row of data, what were the most important factors, and how did they influence that prediction?

> Using the `treeinterpreter` package to check how the prediction changes as it goes through the tree, adding up the contributions from each split/feature. Use waterfall plot to visualize.

- Which columns are the strongest predictors?

> Look at feature importance

- How do predictions vary, as we vary these columns?

> Look at partial dependence plots

22. What’s the purpose of removing unimportant variables?

> Sometimes, it is better to have a more interpretable model with less features, so removing unimportant variables helps in that regard.

23. What’s a good type of plot for showing tree interpreter results?

> Waterfall plot

24. What is the _extrapolation problem_ ?

> Hard for a model to extrapolate to data that’s outside the domain of the training data. This is particularly important for random forests. On the other hand, neural networks have underlying Linear layers so it could potentially generalize better.

25. How can you tell if your test or validation set is distributed in a different way to your training set?

> We can do so by training a model to classify if the data is training or validation data. If the data is of different distributions (out-of-domain data), then the model can properly classify between the two datasets.

26. Why do we make saleElapsed a continuous variable, even although it has less than 9000 distinct values?

> This is a variable that changes over time, and since we want our model to extrapolate for future results, we make this a continuous variable.

27. What is boosting?

> We train a model that underfits the dataset, and train subsequent models that predicts the error of the original model. We then add the predictions of all the models to get the final prediction.

28. How could we use embeddings with a random forest? Would we expect this to help?

> Entity embeddings contains richer representations of the categorical features and definitely can improve the performance of other models like random forests. Instead of passing in the raw categorical columns, the entity embeddings can be passed into the random forest model.

29. Why might we not always use a neural net for tabular modeling?

> We might not use them because they are the hardest to train and longest to train, and less well-understood. Instead, random forests should be the first choice/baseline, and neural networks could be tried to improve these results or add to an ensemble.
## Summary
## Building embeddings from scratch[](https://course.fast.ai/Lessons/Summaries/lesson8.html#building-embeddings-from-scratch)

- What will part 2 feel like? a lot deeper technically? Able to read and implement research papers? Models involve real life situations?
- Review build a neuralnet from scratch. How Pytorch create a neuralnet effortlessly? How Pytorch keep track of model weights through `Module`? How does `Module` store weights with `nn.Parameter`? How to check weights from the model using `parameters()`?

![module-parameter](https://forums.fast.ai/uploads/default/optimized/3X/a/c/ac1eeab37f915183a24b24161bc98b737375ed3a_2_690x284.png)

- You can build a layer in Module with `nn.Linear` without `nn.Parameter` and Pytorch can read weights from it too.

![module-layer](https://forums.fast.ai/uploads/default/optimized/3X/6/1/6169abe36ea65492da4795d59819c0a7711926f3_2_690x252.png)

- How to create the `Embedding` function and the entire `DotProductBias` with pytorch using `create_params` from scratch? After it’s trained, the trained `movie_bias` can be checked. You can check the shape of the bias by `model.movie_bias.shape`

![create-embedding](https://forums.fast.ai/uploads/default/optimized/3X/b/3/b3ad05b6e908f82d01ae5bb03833fd3d22cdd07a_2_690x216.png)

![DotProductBias-pytorch](https://forums.fast.ai/uploads/default/optimized/3X/d/4/d463560b5dac88fa6265df49f186581365b15cd7_2_690x266.png)

![movie-bias-trained](https://forums.fast.ai/uploads/default/optimized/3X/b/9/b9c387939d608287db55c4fe3f2fde20579da859_2_690x352.jpeg)

- Questions: What does `Tensor.normal_` do?

![Tensor.Normal_](https://forums.fast.ai/uploads/default/optimized/3X/a/8/a8cd719c1c9b49df72a7b63cc140c558462bc2ca_2_690x173.png)

![why-no-zeros](https://forums.fast.ai/uploads/default/optimized/3X/1/c/1c35d70ecfae6df4e054fecb879be854bbe5679a_2_690x74.png)

## Interpretation of embeddings[](https://course.fast.ai/Lessons/Summaries/lesson8.html#interpretation-of-embeddings)

- After training, what can the `movie_bias` tell us about each and all the movies? What does having a low bias mean for a movie? What does having a high bias mean for a movie? Can `user_bias` tell us which user just loves movies even the crapy ones? This is visualizing `movie_bias`

![interpreting-bias](https://forums.fast.ai/uploads/default/optimized/3X/3/8/38eba26268dc461437ffe433be538e73f74d60bf_2_690x329.png)

- What can we interpret or do about the huge matrix with shape `(num_users, 50)`? How to shrink the 50 latent factors into just 3 most important factors with `pca`?

![shrink-by-pca](https://forums.fast.ai/uploads/default/optimized/3X/c/4/c456a152f3dd0f85b7d17e6eee93c0179bc942d6_2_690x227.png)

- How to interpret the PCA chart of movies rated with only just two PCA factors of out 3 compressed by 50 factors? How the taste or style of the movies are condensed into two factors and displayed and defined by the location of the two dimensional chart? This is visualizing movie_factors or embeddings.

![compress-movie-taste-by-2-factors](https://forums.fast.ai/uploads/default/optimized/3X/4/e/4eac3d75cab2db567ac45fba7fbf0ef17b2c514d_2_587x500.jpeg)

- How fastai makes all the work above easier with just one line of code?

![fastai-make-things-easier](https://forums.fast.ai/uploads/default/optimized/3X/e/d/ed57496a25b591290deb15ac0a87bc09276e6ee7_2_559x500.jpeg)

- How fastai construct everything under the hood of `collab_learner`?

![collab_learner](https://forums.fast.ai/uploads/default/optimized/3X/4/a/4afaa7b7a3eb83460fb708c1038a4bb7636931ae_2_690x241.jpeg)

![EmbeddingDotBias](https://forums.fast.ai/uploads/default/optimized/3X/3/6/36b95732e07160818fc282f97a1ea26feebde957_2_690x291.png)

- Questions: is PCA useful in other applications? Where to find more of PCA? Why should you take Rachel’s Computational Linear Algebra?
- How to use Embedding distance to find out movie similarities?

![embedding-distance-similarities](https://forums.fast.ai/uploads/default/optimized/3X/3/5/3570ea9ea1d9e3d83fcb1fc79da041378c2ab6cb_2_690x205.jpeg)

- Go to read the fastbook for boostrapping a collaborative filtering model

## Deep learning for collaborative filtering[](https://course.fast.ai/Lessons/Summaries/lesson8.html#deep-learning-for-collaborative-filtering)

- How to do collaborative filtering with deep learning instead of matrix completion with dot product above? How to apply the easist neuralnet model architecture onto this collaborative filtering case?

![deep-learning-colab-filter](https://forums.fast.ai/uploads/default/optimized/3X/2/e/2e3885bd3fec97240d61b1114ada57a770dddcac_2_690x273.jpeg)

- How does fastai use rules of thumb to recommend the number of latent factors for users and movies?

![number-latent-factors](https://forums.fast.ai/uploads/default/optimized/3X/7/0/70613b67c9727ff47186d2323466a5ddb589497a_2_690x154.png)

- How does fastai use deep learning to build collaborative filtering model in two ways?

![dl-way-2](https://forums.fast.ai/uploads/default/optimized/3X/3/6/362b88b96fc4ec0055caf95a2be17003dee2e4fc_2_690x391.jpeg)

Why the deep learning versions are not as good as DotProduct version? Is it because DotProduct is more tailored to the problem? How do companies combine both versions to do collaborative filtering? When you have lots of metadata, should you apply deep learning to it? How would you use metadata in the model? - Questions: Can a smaller number of users and movies overwhelm everybody else? e.g., a small group of anime enthusiasts watch a lot of anime movies and give super high ratings. Details of how to deal with them won’t be discussed here - How to apply embedding matrix into NLP model through a spreadsheet demo? What’s the essense of neuralnet?

![embedding-nlp](https://forums.fast.ai/uploads/default/optimized/3X/1/0/1052d5774f1d716e988c005abce8939662b6a2a3_2_561x500.jpeg)

- How to apply embeddings to tabular dataset and models? How to understand `TabularModel` and `tabular_learner` source?
- What’s going on inside a neuralnet through a shop sale prediction kaggle competition and a paper published based on it?

## Convolutions[](https://course.fast.ai/Lessons/Summaries/lesson8.html#convolutions)

- So far we have looked at what goes in as inputs and what goes out of a model as outputs. We have also looked at the middle as matrix multiplication. What are convolution (a particular kind of matrix multiplication in the middel)? How is it be very useful to CV? Why MNIST is one of the most famous CV dataset? How does Jeremy apply what Fergus and Zeiler’s paper onto MNIST using excel and convolution?
- How to understand convolution? What does a filter do and How does it help to detect horizontal and vertical edges? How to determine the size of the filter or kernel (3x3, or 5x5, or any)? conv1 means the first convolutional layer
- moving onto the second convolutional layer. Two filters give us two channels on the first convolutional layer. On the second convolutional layer, we create one 3D matrix filter which has two matrix filters to filter/process the two channels out of the first conv layer, and condense the value. And we can also create a second channle for the 2nd conv layer using another 3D filter.
- How to determine the output and use SGD to train the model and optimize the filters?
- What is maxpooling? What’s the problem of maxpooling? How much data do we lose? Why it is a good thing? What is a dense layer and what does it do?
- How we do convolution slightly differently today? What is stride-two convolution and how does it work? (no more maxpooling) Then we do a lot of stride-two convolutions until the size shrinked to 7x7 and then do a `average_pooling` (no more dense layer). What does the 7x7 grid and take an average mean? What is the problem of such approach? When is the good time to use maxpool instead? How fastai made it easy for us to try both pooling by inventing a technique called `concat_pooling` to maxpool and `average_pool` and concat them together?
- How to understand convolution in terms of matrix multiplications?
- What is dropout and how to understand it using excel? What is droput mask? What’s its effect visually on excel? How to understand dropout as data augmentation for the activations? How does it help avoid overfitting? What’s the story of dropout and academia?
- Why Jeremy not spend much time on activation functions? We have seen many functions on metrics, loss and activations.
- What to do next before fastai part2? What Radek’s book meta learning is about? What are the things to do in Write, Help, Gather and Build?
- a fastai community member published mish activation used by many state of art models.

## Jeremy AMA[](https://course.fast.ai/Lessons/Summaries/lesson8.html#jeremy-ama)

- How to keep up? To keep up by focusing in subfield of deep learning and focusing on things that don’t change much as the foundations of fastai have not changed much from 5 years ago. Everything else is just tweaks.
- Will huge dataset and GPU computation replace us with small dataset and one gpu? There is always smarter ways of doing things, eg. Fastai team trained on imagenet on standard GPU faster than all companies with huge amount of GPUs. Pick areas of different domains which smaller models can beat the state of the art.
- How Jeremy to teach kids math? all kids can learn algebra with dragonbox5+. Great, Jeremy promised to talk more about teaching kids some point later.
- Plans for walkthrus
- How to turn a model into business? Great news, Jeremy plans to build a course on this! What is the start of a business? What is the first step? How to gradually figure out whether your idea has a real need from people?
- How Jeremy stay so efficient at working? Finish something nicely, tenacity

[  
](https://course.fast.ai/Lessons/Summaries/lesson7.html)