# Investigating The Linear Inverse Problem In Sparse Signal Processing

This project reviews optimization techniques in the field of sparse signal
processing.

--- 

### Instructions

To run the compressed sensing experiments run the file `compressed_sensing.m` in matlab. This file utilizes `MutalaCoherence.m` which is a helper file for deteremining the maximum absolute value of the cross-correlations in a column of a matrix. Additional components in compressed_sensing.m are commented for understanding.

* Install the latest packages for compressed sensing `https://candes.su.domains/software/l1magic/`
* Install CVX package from `http://cvxr.com/cvx/download/`

--- 
To run the linear inverse experiments, please create a conda environment install the following packages:
```
skimage
matplotlib
pylab
cv2
tqdm
numpy
scipy
PIL 
time
jupyter notebook
pyunlocbox
```

Then run the file `jupyter notebook Ista_and_fista.ipynb` and run the cells. The components and sections are commented and named for understanding including the synthetic data generator and image denoising parts. These files above contain the sample inputs and outputs used in the report.





### References

``` Baraniuk, Richard G. "Compressive sensing [lecture notes]." IEEE signal processing magazine 24.4 (2007): 118-121.```

```Beck, Amir, and Marc Teboulle. "A fast iterative shrinkage-thresholding algorithm for linear inverse problems." SIAM journal on imaging sciences 2.1 (2009): 183-202.```

```Shor, Naum Zuselevich. Minimization methods for non-differentiable functions. Vol. 3. Springer Science & Business Media, 2012.```