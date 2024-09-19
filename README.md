# Back Fitting using R

Back Fitting is an approach used to do multiple linear regression. This is very helpful if the software at hand only does a regression with one variable.

The approach is based on a high number of iterations where the stop criterion is when values of the intercept for two consecutive iteration is the same.

The implementation of the function is done using the R language.

The function is supplied with the following two variables:
    - response: the response variable of the data frame in a string from between two quotation marks
    - Data: the data frame which has to be numeric in oder for the function to deliver suitable results. Other than numerics cannot unfortunately be handeled.

The result of the function is:
  - the estimated coefficients
  - the number of iterations needed to reach the convergence, so you can have an indication of the time and complexity of the calculations.

Please note that this method is slower than the regualr multiple regression implemented in commercial softwares given the many iterations needed.

Should you have any query, please contact me.

Best regards,
Mustafa Anjrini


  
