# EFA_and_CFA
How do I know that my variables measure a construct? Are my variables representative of the construct I want to assess? Exploratory Factor Analysis (EFA) and Confirmatory Factor Analysis (CFA) can help us with this dilemma.

## Introduction
EFA and CFA are two powerful statictical methods that are widely used in various fields of research to uncover the underlying structure of complex data.

- EFA is a technique used to reduce the dimensionality of a dataset, by creating a smaller set of variables that can be used to explain the structure of the original dataset. It is useful when the original dataset contains a large number of variables that are highly correlated. EFA provides a snapshot of the statistical relationship of the key behaviors, attitudes and dispositions of the construct of interest.

- CFA, on the other hand, is a method used to test the validity of a model. It is used when we want to test the fit of a theorical model to a dataset. CFA allows researchers to examine the relationship obetween factors, which can be explored with EFA and confirmed with CFA. This helps researchers interpret the theorical connections between underlying dimensions of a construct and even extending to relationships across constructs in a broader therocial model (Tavakol and Wetzel, 2020).

In sum, EFA provides us an initial approach of the internal structure if our model, and CFA allows us to know if the structure of our model is valid. Nevertheless, some authors advise that EFA can be used when we dont have a solid theory of our constructs. However, if we have enough theory to desing a model structure, we can use CFA without going through an EFA.

### Basic concepts before start

Imagine that you want to measure "writing performance". This will be your **"construct"**. For this purpose, you need variables to measure the "writing performance". According to the scientific literature, writing performance could be measure in two dimensions: 1) Productivity; 2) Quality. These will be your **latent variables**.
These dimensions could be explored through a writing task, such as "story writing". From the performances of people that did this task, we can extract valuable information. For example: the number of words written, the total number of words correctly spelled, the amount of scores gained in a quality rubric, etc. These measures are what we know as **observed variables**.

So the model could be like that:

🟩 observed variables ⤵
🟣 latent variables ⤵
⭕ construct
____________________________________________________________

🟩 total_words + unique_words + total_sentences ⤵
🟣 productivity ⤵

🟩 narrative_organization + total_ideas + sentence_fluency ⤵
🟣 quality ⤵

⭕ writing performance
_____________________________________________________________

Another example: "[...] *the observed variables are the responses to the items on the personality test, the latent variables are the underlying dimensions or traits that are inferred from these responses, and the constructs are the theoretical entities that are being measured.*"

## Fit index of CFA

The fit indices resulting from the CFA need to meet some basic criteria:

- 🔰 Chisq -> must be not significant / *p* > .05 / However, if the sample exceeds 200 or so, Chisq could be significant (Moss, 2009)
- 🔰 NFI / NNFI / TLI -> must be > .90 or .95 (depend on the author)
- 🔰 CFI -> must be > .90 or .96  (depend on the author)
- 🔰 IFI -> must be > .90
- 🔰 RMSEA -> must be < .08 or <.05 (depend on the author)
- 🔰 SRMR -> must be <.08
- 🔰 EXTRA information -> there cannot be negative variances

If these indices meet these criteria, the internal structure of our model is valid.

*In some cases, TLI, IFI, NNFI and MFI can be greater than 1. In any case CFI and NFI can be greater than 1 (Kenny, 2015; Newson, 2020).

## Function arguments

#### For ToolBox by ULL

- 🗨️ tipo ->
- 🗨️ rotacion ->
- 🗨️ grafica ->
  - = TRUE
  - = FALSE
- 🗨️ estimador ->
- 🗨️ ortogonal ->
  - = TRUE
  - = FALSE

#### For Lavaan

- 🗨️ tipo ->
- 🗨️ rotacion ->
- 🗨️ grafica ->
  - = TRUE
  - = FALSE
- 🗨️ estimador ->
- 🗨️ ortogonal ->
  - = TRUE
  - = FALSE

## Explanation of the example database

Database was recovered from [PENDIENTE :)].

# TOOLBOX

We are going to work with a toolbox called "UllRToolBox" by University of La Laguna -> https://sites.google.com/site/ullrtoolbox/

## References
1. Kenny, D. A. (2015). Measuring model fit.
2. Moss, S. (2009). Fit indices for structural equation modeling.
3. Newsom, J. T. (2020). Psy 523/623 structural equation modelling.
4. Penthin, M., Pirner, M. L., Scheunpflug, A., & Kröner, S. (2022). Measuring student teachers’ beliefs regarding religion in schools: piloting and preliminary validation of two newly developed scales. British Journal of Religious Education, 44(3), 281-292.
5. Tavakol, M., & Wetzel, A. (2020). Factor Analysis: a means for theory and instrument development in support of construct validity. International journal of medical education, 11, 245.
6. https://easystats.github.io/effectsize/reference/interpret_gfi.html
