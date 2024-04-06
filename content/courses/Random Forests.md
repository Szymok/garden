---
title: Random Forests
type: course
tags: 
aliases:
---
1. how could multi-label classification improve the usability of the bear classifier?

> This would allow for the classification of no bears present. Otherwise, a mutli-class classification model will predict the presence of a bear even if it’s not there (unless a separate class is explicitly added).

2. How do we encode the dependent variable in a multi-label classification problem?

> This is encoded as a one-hot encoded vector. Essentially, this means we have a zero vector of the same length of the number of classes, and ones are present at the indices for the classes that are present in the data.

3. How do you access the rows and columns of a `DataFrame` as if it was a matrix?

> You can use `.iloc`. For example, `df.iloc[10,10]` will select the element in the 10th row and 10th column as if the `DataFrame` is a matrix.

4. How do you get a column by name from a `DataFrame`?

> This is very simple. You can just index it! Example: `df['column_name']`

5. What is the difference between a dataset and DataLoader?

> A `Dataset` is a collection which returns a tuple of your independent and dependent variable for a single item. `DataLoader` is an extension of the `Dataset` functionality. It is an iterator which provides a stream of mini batches, where each mini batch is a couple of a batch of independent variables and a batch of dependent variables.

6. What does a `Datasets` object normally contain?

> A training `Dataset` and validation `Dataset`.

7. What does a `DataLoaders` object normally contain?

> A training `DataLoader` and validation `DataLoader`.

8. What does `lambda` do in Python?

> Lambdas are shortcuts for writing functions (writing one-liner functions). It is great for quick prototyping and iterating, but since it is not serializable, it cannot be used in deployment and production.

9. What are the methods to customise how the independent and dependent variables are created with the data block API?

> - `get_x` is used to specify how the independent variables are created.
> - `get_y` is used to specify how the datapoints are labelled.

10. Why is `softmax` not an appropriate output activation function when using a one-hot encoded target?

> `softmax` wants to make the model predict only a single class, which may not be true in a multi-label classification problem. In multi-label classification problems, the input data could have multiple labels or even no labels.

11. Why is `nll_loss` not an appropriate loss function when using a one hot encoded target?

> Again, nll_loss only works for when the model only needs to predict one class, which is not the case here.

12. What is the difference between `nn.BCELoss` and `nn.BCEWithLogitsLoss`?

> `nn.BCELoss` does not include the initial sigmoid. It assumes that the appropriate activation function (ie. the sigmoid) has already been applied to the predictions. `nn.BCEWithLogitsLoss`, on the other hand, does both the sigmoid and cross entropy in a single function.

13. Why can’t we use regular accuracy in a multi-label problem?

> The regular accuracy function assumes that the final model-predicted class is the one with the highest activation. However, in multi-label problems, there can be multiple labels. Therefore, a threshold for the activations needs to be set for choosing the final predicted classes based on the activations, for comparing to the target claases.

14. When is it okay to tune an hyper-parameter on the validation set?

> It is okay to do so when the relationship between the hyper-parameter and the metric being observed is smooth. With such a smooth relationship, we would not be picking an inappropriate outlier.

15. How is `y_range` implemented in fastai? (See if you can implement it yourself and test it without peaking!)

> `y_range` is implemented using `sigmoid_range` in fastai.
> 
> `def sigmoid_range(x, lo, hi): return x.sigmoid() * (hi-lo) + lo`

16. What is a regression problem? What loss function should you use for such a problem?

> In a regression problem, the dependent variable or labels we are trying to predict are continuous values. For such problems, the mean squared error loss function is used.

17. What do you need to do to make sure the fastai library applies the same data augmentation to your inputs images and your target point coordinates?

> You need to use the correct `DataBlock`. In this case, it is the `PointBlock`. This `DataBlock` automatically handles the application data augmentation to the input images and the target point coordinates.