---

  bookId: '53140'
  title: >-
    Python for Data Analysis Data Wrangling with Pandas, NumPy, and IPython by
    Wes McKinney
  author: z-lib.org
  highlightsCount: 3
---
# Python for Data Analysis Data Wrangling with Pandas, NumPy, and IPython by Wes McKinney
## Metadata
* Author: [[z-lib.org]]

## Highlights
import — location: []() ^ref-1437

---
pickle is only recommended as a short-term storage format. The problem is that it is hard to guarantee that the format will be stable over time; an object pickled today may not unpickle with a later version of a library. We have tried to maintain backward compati‐ bility when possible, but at some point in the future it may be nec‐ essary to “break” the pickle format. pandas has built-in support for two more binary data formats: HDF5 and Message‐ Pack. I will give some HDF5 examples in the next section, but I encourage you to explore different file formats to see how fast they are and how well they work for your analysis. Some other storage formats for pandas or NumPy data include: bcolz A compressable column-oriented binary format based on the Blosc compression library. Feather A cross-language column-oriented file format I designed with the R program‐ ming community’s Hadley Wickham. Feather uses the Apache Arrow columnar memory format. — location: []() ^ref-5654

---
Using HDF5 Format HDF5 is a well-regarded file format intended for storing large quantities of scientific array data. It is available as a C library, and it has interfaces available in many other languages, including Java, Julia, MATLAB, and Python. The “HDF” in HDF5 stands for hierarchical data format. Each HDF5 file can store multiple datasets and support‐ ing metadata. Compared with simpler formats, HDF5 supports on-the-fly compres‐ sion with a variety of compression modes, enabling data with repeated patterns to be stored more efficiently. HDF5 can be a good choice for working with very large data‐ sets that don’t fit into memory, as you can efficiently read and write small sections of much larger arrays. While it’s possible to directly access HDF5 files using either the PyTables or h5py libraries, pandas provides a high-level interface that simplifies storing Series and DataFrame object — location: []() ^ref-38216

---
