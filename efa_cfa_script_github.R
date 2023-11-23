#open your directory (Ctrl + Shift + H) and inspect
dir()

# ULLRToolBox version ----
#read data frame

df <- lee.archivo.fnc('df_efa_cfa_github_3.txt')
nv(df)
descriptivos.fnc(df, variables = 1:7) ; cor(df) #some information about the data

## EFA----

analisis.factorial.fnc(df, variables = 1:7, tipo = 'af', rotacion = 'oblimin', grafica = T)
  ## Parallel analysis suggests that the number of factors =  2 

analisis.factorial.fnc(df,n.factores = 2, variables = 1:7, tipo = 'af', rotacion = 'oblimin', grafica = T)
  #the first snapshot shows: 1) factor with variables V4, V6 and V5; 2) factor with variables V3, V1 and V2. 
  #V7 does not seem to be included in any factor
  #we can desing our model based on this result

##CFA ----

mod1='
F1 =~ V4 + V6 + V5
F2 =~ V3 + V1 + V2
'
fit1 <- sem.fnc(df, modelo = mod1, estimador = "MLR", ortogonal = F, grafica = T)
  #        chisq df p.val   nfi  nnfi   cfi   tli   mfi rmsea rmsea.ci.lo rmsea.ci.up
  #ajuste 37.426  8     0 0.960 0.940 0.968 0.940 0.971 0.086       0.059       0.114
  #scaled 36.609  8     0 0.961 0.941 0.968 0.941 0.971 0.086       0.059       0.114

  #this value was just over the limit by a very small margin
  #Look "Indice de modificacxion de errores" (Rates of change errors). Does any "MI" index stand out from the rest? Include it in your model.
  #you can justify through scientific literature the release between these variables, but making more than one release to adjust your model is strongly discouraged.

mod2='
F1 =~ V4 + V6 + V5
F2 =~ V3 + V1 + V2
V4 ~~  V3'
fit2 <- sem.fnc(df, modelo = mod2, estimador = "MLR", ortogonal = F, grafica = T)

  #        chisq df p.val   nfi  nnfi   cfi   tli   mfi rmsea rmsea.ci.lo rmsea.ci.up
  #ajuste 14.954  7 0.037 0.984 0.982 0.991 0.982 0.992 0.048       0.011       0.081
  #scaled 14.935  7 0.037 0.984 0.982 0.991 0.982 0.992 0.048       0.011       0.081

  #the indices improved!
  #However, it is always preferable to look for another structural design that fits without having to release.
  #but these data serve as an example to teach us what to do in these cases.
  
  #we can also test whether our model fulfils a second-order structural model. To do so, we can test it in this way:

mod3='
F1 =~ V4 + V6 + V5
F2 =~ V3 + V1 + V2
F3 =~ F1 + F2
'
fit3 <- sem.fnc(df, modelo = mod3, estimador = "MLR", ortogonal = F, grafica = T)
  #this data does not comply with a second-order structure because, as the console output says, the matrix is singular
  
  #On the order hand, we do not necessarily have to do our CFA through an EFA if we have sufficient theory to justify the desing of our model.
  #For example, if the literature says that V7 can fit in teh second factor, we can "force" the model by adding it.

mod4='
F1 =~ V4 + V6 + V5
F2 =~ V3 + V1 + V2 + V7
'
fit4 <- sem.fnc(df, modelo = mod4, estimador = "MLR", ortogonal = F, grafica = T)

  #However, as you can see, V7 is still left out.

# LAVAAN version ----

install.packages("lavaan") ; library(lavaan)

## EFA ----

fa.parallel(df, fa = "fa")
  #Parallel analysis suggests that the number of factors =  2

nfactors <- 2
fit <- factanal(df, nfactors, rotation="promax")
print(fit, digits = 2, cutoff=0.3, sort=TRUE)

## CFA ----

mod1='
F1 =~ V4 + V6 + V5
F2 =~ V3 + V1 + V2
'
fit1 <- sem(mod1, data = df)
summary(fit1, fit.measures= TRUE)

  #The procedure for releasing relationships between variables by their error modification index...
  #as well as tetsting a second-order factor structure, is the same as that used for the ULLRToolBox version.
  
  
  #From here you can test how the values change if you change the function arguments. 
  #For example by changing the type of rotation, setting your model to orthogonal, using other estimators, etc.

  #give it a try! :)