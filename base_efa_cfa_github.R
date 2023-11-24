#new data frame for efa_cfa_github

#create a database where there are 3 variables with moderate-high correlations between them. 
#create another 3 variables that meet the same condition between them. 
#and finally, create another variable that has low correlation indices between all the variables.


set.seed(123)
#create a covariance matrix
sigma.1 <- rbind(c(1, 0.4, 0.5, 0.1, 0.3, 0.1, 0.01),
                 c(0.4, 1, 0.5, 0.2, 0.4, 0.2, 0.02),
                 c(0.5, 0.5, 1, 0.3, 0.1, 0.2, 0.01),
                 c(0.1, 0.2, 0.3, 1, 0.6, 0.7, 0.02),
                 c(0.3, 0.4, 0.1, 0.6, 1, 0.5, 0.03),
                 c(0.1, 0.2, 0.2, 0.7, 0.5, 1 , 0.04),
                 c(0.01, 0.02, 0.01, 0.002, 0.03, 0.04, 1))

#create the average of the vectors 
mu.1 <- c(10,5,9,7,6,500,1)

#create a random data frame with based on above conditions
df <- as.data.frame(mvrnorm(n=500, mu = mu.1, Sigma = sigma.1))

#export data frame
exporta.archivo.fnc(df, nombre = 'df_efa_cfa_github_3')
