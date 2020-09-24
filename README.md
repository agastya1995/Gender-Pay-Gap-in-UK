Analysing the Gender Pay Gap in the U.K.

and

Understanding the Factors Behind it

![A close up of a box Description automatically
generated](.//media/image1.jpg){width="7.5in" height="3.75in"}

By: Agastya Bhooshan

Praxis Business School

**Introduction**

Gender wage gap is the average difference in wages between men and women
in an organization. In most countries, including developed ones, men are
paid considerably more than their women counterparts. For much of the
20^th^ century, labour laws allowed employers to pay women less than
men. Gradually, with the help of women-led campaigns for equal pay,
these laws were rescinded or amended. The average pay differential fell
from 65% in the 1960's to 35% in the 1990's and has continued decreasing
ever since. However, even now, there is still a difference in the wages
of men and women. The bar chart below shows the wage gap in different
countries around the world.

![A close up of text on a white background Description automatically
generated](.//media/image2.png){width="6.5in"
height="4.333333333333333in"}

***Source: OECD (2019)***

The chart shows the grim reality of gender bias in organizations, with
women on average being paid around 10% less than their male
counterparts. Apart from Costa Rica, where there was no difference in
the average renumeration, and a few select countries like Sweden,
Colombia, Norway and New Zealand, all the countries had a gap of over
10%. The situation is particularly bad in Japan and South Korea, where
the gap is over 20%. Recently, efforts are being made to ensure not just
better pay for female employees, but also to help them reach the top of
the organization.

To improve the wage gap in the country and to bring about gender
equality, United Kingdom Government in September 2015 published the
draft Equality Act 2010 (Gender Pay Gap Information) Regulations 2016.
One of its many changes was that qualifying employers had to disclose
certain information related to the gender gap, including the average
difference in renumeration. Qualifying employers were those who employed
more than 250 people. This data was made available to the public, with
the intent being that employers with skewed gender pay figures would be
forced to improve the gender balance.

In the first year, i.e. 2017, almost all firms complied. However, in
2019, out of the 10,000 that were expected to report, less than half
disclosed the required information. This was because, although the
disclosure was (and still is) mandatory for all public and private
businesses employing over 250 people, there were (and still are) no
civil penalties for non-compliance. As a result, the number of reporting
companies decreased from 10,564 in 2017 to 5742 in 2019. The report has
faced further setback due to the Covid-19 pandemic, with the U.K
government waived the reporting requirement for 2020.

This report focuses on the gender pay gap in the United Kingdom. We use
the data provided by the U.K. government
([source](https://gender-pay-gap.service.gov.uk/viewing/download)) to
answer the following questions:

1.  Has there been a significant change in the wage difference from 2017
    to 2019, i.e. over the last 3 years?

2.  Is the bonus pay-out percentage, which is the percentage of
    employees paid bonuses, less for women when compared to men?

3.  Is it possible to, based on the organization structure and the
    number of women employees at each level, predict the average
    difference in pay between men and women?

To answer these questions, we first do some exploratory data analysis on
the datasets.

**Exploratory Data Analysis**

**Understanding the Data**

Before beginning the EDA, a few terms need to be explained.

1.  **Average Difference in Mean Hourly Rate** -- This is the difference
    in the wages between men and women. A value higher than 0 means that
    men are paid more than women. For instance, if a company has a
    difference of 10%, it means that men are paid 10% more than women on
    average in the company.

2.  **Average Difference in Median Hourly Rate** -- Similar to the mean
    difference, except that it is calculated on the median pay.

3.  **Average Difference in Mean/Median Bonus Percent** - This is the
    difference in the bonus amount paid to men and women. A value over 0
    means that men are paid more bonuses. If a company has a bonus
    difference of 10%, it means that the male employees are paid 10%
    higher bonuses than the female employees.

4.  **Bonus Pay-out** -- it refers to the percentage of total employees
    who received bonuses. For example, if the male bonus pay-out is 40%,
    it means that 40% of all men in the company received bonuses. Bonus
    pay-out is calculated for both male and female employees.

5.  **Lower Quartile, Lower Middle Quartile, Upper Middle Quartile and
    Top Quartile**: Quartiles are calculated by dividing the
    organization into 4 equal groups, or quartiles, based on the level
    of pay. The lowest quartile, therefore, represents the employees in
    the bottom 25% of earnings. Employers must report the proportion of
    men and women in each quartile. If the value of females in the top
    quartile is 60%, it means that 60% of the employees in that quartile
    are women.

6.  **Employer Size**: The employer size is divided into 5 categories,
    which are:

    a.  Under 250 -- Employing less than 250 persons

    b.  250-499 persons

    c.  500- 999

    d.  1000-4999

    e.  5000-19999

    f.  20000 or more

**\
Summary Statistics (2019)**

**Pay Statistics**

  Average Difference in Mean Hourly Rate                             14.12%
  ------------------------------------------------------------------ --------
  Average Difference in Median Hourly Rate                           12.85%
  Average Difference in Bonus                                        20.36%
  Average Difference in Female Bonus Pay-out vs Male Bonus Pay-out   1.24%

***Note**: In our dataset, the average wage gap is 14.12%, as compared
to \~15% in the OECD data. The difference is due to the following
reasons:*

-   *The data collected by the U.K. government includes the Republic of
    Ireland, while the OECD data does not*

-   *The OECD data includes the gender gap for all organizations, while
    the U.K. Government's data only includes the gap of employers
    employing over 250 people. Moreover, only half the organizations
    provided the data.*

The difference in average wages between men and women in 2019 is 14.12%,
an extremely worrying number. The difference in bonus, at 20.36%, is
even worse. There are two main reasons for this:

-   Inequal pay scales, with women being paid less than men doing
    similar work

-   Few women at the higher earning positions, i.e. the topmost
    quartile.

Has there been an improvement in the average wages in the past few
years? The plots below show that while the average wage gap has indeed
improved slightly, from 14.9% in 2017 to 14.1% in 2019, the gap in the
bonuses paid has worsened from under 17% in 2017 to over 20% in 2019.

![A screenshot of a cell phone Description automatically
generated](.//media/image3.jpeg){width="3.622030839895013in"
height="2.5083333333333333in"}![A screenshot of a cell phone Description
automatically
generated](.//media/image4.jpeg){width="3.6083333333333334in"
height="2.498847331583552in"}

***Note:** The wage gaps for 2017 and 2018 is based on the companies
that provided the 2019 data. Companies that provided data in 2017 and
2018 but not in 2019 were excluded from the calculations. This allowed
for direct comparison among the different years.*

Next, we see whether this wage gap is present for all employers, or only
for certain types of employers. To do this, we group the data based on
employer size, and make a boxplot of the average difference in hourly
rates.

![A close up of a logo Description automatically
generated](.//media/image5.jpeg){width="7.24900043744532in"
height="5.02in"}

The boxplot above shows that the difference in hourly rates across
different employer sizes is approximately the same. Larger organizations
(employing over 20,000 people), have the lowest average differences. The
black dots are the outliers, which are companies with either an
extremely high positive wage difference (50%-60%) or an extremely high
negative wage gap (-50%-60%). Both are equally bad. However, in general,
most of the values are between 5% and 20%, across all employer groups.

**Organization Structure**

In this section, we focus on the number of female employees per
quartile. The boxplot below reveals that lowest quartile has the highest
share of female employees, at 55%. The percentage of females in
successive quarters keeps on decreasing steadily, dropping to 51% in the
lower middle quarter, 46% in the upper middle quartile and to 41% in the
top quartile. This reveals an inherent biasness by employers towards
promoting men over women. It also shows how little representation women
have at the very top of the business.

![A picture containing drawing, clock Description automatically
generated](.//media/image6.jpeg){width="6.5in"
height="4.501388888888889in"}

.

![A close up of a map Description automatically
generated](.//media/image7.jpeg){width="5.432683727034121in"
height="3.3583333333333334in"}

The chart shows the distribution of percentage of female employees in
the lowest quarter of the organization, grouped by the employer size.
Almost all organizations here follow a similar trend, with the
distributions left skewed, and the peak being around 60%.

![A close up of a map Description automatically
generated](.//media/image8.jpeg){width="5.114162292213473in"
height="3.5416666666666665in"}

This chart shows the distribution of female employees in the top quarter
of the organization, grouped by organization size. The yellow line,
which is the distribution of companies employing over 20,000 people, is
an interesting case. The distribution of the smaller organizations is
multi-modal, with many peaks and gradual falls. However, the
distribution of the largest companies is one of a single peak, around
the 40% mark, and then a sharp decline. It shows that the big companies
and MNCs mostly employ men in the highest positions, with very few
exceptions.

**Hypothesis Tests**

A hypothesis test a way of using statistical evidence and data to test
theories and claims. Here, we use hypothesis tests to test two theories
on the gender gap.

**Hypothesis Test 1 -- Is the bonus pay-out percentage of male employees
higher than female employees?**

We have seen that while there is a huge difference in the average pay
and bonuses given to male and female employees, the difference in bonus
pay-out percentage (pay-out rate to men less the pay-out rate to women)
is only 1.24%. The bar chart below shows this difference, grouped by
employer size. Although larger companies tend to have higher bonus
pay-out rates than smaller organizations, the pay-out rates for both
women and men seem to be approximately the same.

![A screenshot of a cell phone Description automatically
generated](.//media/image9.jpeg){width="6.208333333333333in"
height="4.299403980752406in"}

To test whether the difference of 1.24% is significant or merely due to
the normal variations in the data, we conducted a two-sample t-test.

**Null Hypothesis:** There is no difference in the pay-out rates

**Alternative Hypothesis:** Female employees have a lower bonus pay-out
rate

**Male Bonus Pay-out Mean:** 36.85%

**Male Bonus Pay-out Standard Deviation**: 37.88%

**Female Bonus Pay-out Mean:** 35.60%

**Female Bonus Pay-out Standard Deviation:** 37.63%

**Level of significance --** 5%

Using **Welch's Two Sample t-test**

**t-Statistic** = 1.7673

**Degrees of Freedom** = 11481

**P-Value** = 0.0386

Based on a p-value of 3.86%, which is less than the predefined
significance level of 5%, we can conclude that the bonus pay-out rate
for men is indeed significantly higher than the pay-out rate for women.

**Hypothesis Test 2 -- Is the wage gap significantly different over the
past three years, i.e. 2017, 2018 and 2019?**

We have seen that the wage gap has fallen from 14.9% in 2017 to 14.2% in
2019. However, is this difference significant? To test it, we ran a
one-way ANOVA test on the three years. The results are given below:

![](.//media/image10.png){width="6.15625in" height="1.4375in"}

The p-value is 12.89%, which means that the difference in the years is
not very significant, and therefore the decrease in the difference in
average pay of females and males cannot be assumed to be a reaction to
the new reporting regulations.

**Linear Regression**

**Objective**

The objective of this section is to see if it possible to predict the
difference in pay between males and females, based the data provided.
The data here includes the number of females at every quarter of the
company, the size of the company and the bonus pay-out rates to the
employees.

We start with including all the variables in the linear regression
model. The output that we get is:

![](.//media/image11.png){width="6.78125in"
height="4.447916666666667in"}

Before checking the individual coefficients, we check the overall fit of
the data. To do that, we need to run a few tests:

1.  **Multicollinearity** -- Multicollinearity refers to correlation
    between the independent variables of the model. Although
    multicollinearity does not affect the model's accuracy, it affects
    the value of the coefficients as well as increases the standard
    error. This leads to a decrease in the significance values of the
    predictors.

To check for multicollinearity, we used Variance Inflation Factor (VIF).
This test shows the variables that are highly correlated with other
variables. A VIF of 1 means that there is no collinearity, a value
between 1 and 5 means moderate collinearity, and values of over 5 means
high collinearity. The results of the VIF test are given in the table
below.

  **Variable**                   **VIF**
  ------------------------------ ---------
  Female Lower Quartile          4.32
  Female Lower Middle Quartile   8.54
  Female Upper Middle Quartile   10.35
  Female Top Quartile            6.57
  Employer Size                  1.01
  Female Bonus Percent           14.57
  Male Bonus Percent             15.08

To remove multicollinearity, we remove the variables that have a VIF
score of over 5. The variables that were removed were - Female Lower
Middle Quartile, Female Upper Middle Quartile, and Male Bonus
Percentage. The VIF test was done again on the new linear regression
model, without the dropped predictors.

The VIF of the new linear regression model is:

  **Variable**            **VIF**
  ----------------------- ---------
  Female Lower Quartile   2.56
  Female Top Quartile     2.85
  Employer Size           1.00
  Female Bonus Percent    1.28

Since all the VIF values are under 5, there is no multicollinearity in
the data. We can proceed with this model. The updated model summary is:

![](.//media/image12.png){width="6.395833333333333in"
height="3.9166666666666665in"}

The adjusted r squared has dropped slightly, to 0.35 from 0.39. However,
the estimated coefficients here are more accurate.

2.  **Heteroscedasticity**: Heteroscedasticity refers to non-constant
    variance. For a linear regression model to be give good results, the
    response variable must be homoscedastic, i.e. its variance must be
    constant for different levels of the independent variables. Since
    this is difficult to calculate, we test for heteroscedasticity using
    the errors in the linear model. The residuals vs fitted values plot
    can give an idea of whether the errors are heteroscedastic or not.

![A screenshot of a cell phone Description automatically
generated](.//media/image13.jpeg){width="5.85in"
height="4.051180008748906in"}

The independent variable is heteroscedastic if the variance of residuals
either increase or decrease with an increase in the fitted values. Here,
the errors seem to be scattered along the mean, with there being a
slight uptrend in the start and downtrend near the end. Although it
would seem based on this chart that there the response variable is
homoscedastic, it is still a good idea to use statistical tests to be
completely sure of. A Breush-Pagan test (BP Test) can help do just that.

The results of the B.P. test were:

Null Hypothesis: The errors are homoscedastic

Alternative Hypothesis: The errors are heteroscedastic

Test Statistic = 14.291, Degrees of Freedom= 8, P-Value = 0.07449

The p-value, of 0.07, is higher than the accepted significance level of
0.05. It means that the response variable is homoscedastic and we can
continue with the model.

3.  **Normality of Residuals --** The residuals should be normally
    distributed, with a mean of 0. A normal distribution means that the
    model has no bias, and there is no extra information in the model
    that can be extracted. A histogram of the errors will give an idea
    of normality.

![A screenshot of a social media post Description automatically
generated](.//media/image14.jpeg){width="7.24900043744532in"
height="5.02in"}

Again, apart from the outlier at -500, the other errors seem to be
normally distributed around the zero mean. It shows the model is a good
one.

All the conditions for a good linear regression model (no
multicollinearity, no heteroscedasticity and errors being normally
distributed) have been met. We can now continue with the interpretation
of the model.

**Interpreting the Model**

The summary of the final model is given below.

![](.//media/image12.png){width="6.395833333333333in"
height="3.9166666666666665in"}

The p-value of the F-statistic is significant, which means that the
model is a good fit. The adjusted r squared value is 0.35, which is very
low. The model can only explain 35% of the variability in the wage gap.

The insights that the model provides are:

1.  The number of female employees in the lower quartile and in the
    upper quartile play a significant role in determining the difference
    in hourly wages between males and females. There are more females
    than males in the lowest quarter (55% vs 45%), but only 41% females
    in the top quartile. Companies who wish to improve the pay gap need
    to focus on increasing the number of females in this top quarter,
    i.e. at senior management levels. This can be done by fair promotion
    practices, women friendly schemes and corporate regulations.
    Increasing the number of women at the top will help improve gender
    gap significantly.

2.  A look at the coefficients of these two variables show that the
    'Female Lower Quartile' variable has a positive coefficient, which
    shows that more the number of females in the lower positions, more
    the pay gap in favour of males. However, the coefficient of 'Female
    Top Quartile' is -0.49, which shows that an increase in the number
    of females in the top quarter of the organization will decrease the
    pay gap in the organization.

3.  The coefficient of -3.9 for employers over 20,000 shows that the
    bigger companies have lower gender pay gaps than the smaller ones.
    The average pay gap of these companies is 12.8%, less than the
    average of 14.12%. This could be due to strict corporate
    regulations, as well as female friendly company policies.

4.  The p-values of the 'Employer Size' variables show that none of them
    are significant in explaining the pay gap. We can therefore draw no
    other conclusions from this variable.

5.  The bonus pay-out rates to female employees (Female Bonus Percent)
    is a significant variable, with a p-value of under 2e-16. However,
    its coefficient estimate of 0.05 means that it does not make much of
    an impact on the difference in wages.

**Conclusion**

Some of the conclusions that were drawn from this report are:

1.  Gender wage gap is a problem for all companies, regardless of their
    size.

2.  The gap has not improved over the past 3 years.

3.  The gap can be partially explained by factors such as the percentage
    of female employees at each organizational level and the bonus
    pay-out rates. Focusing on these factors can help improve the wage
    gap considerably.

Gender pay gap has been a major issue for the past 100 years, for all
countries, developed and undeveloped. Even though many laws have been
enacted to ensure fair pay to women, the reality is that women are still
paid considerably less than men and given fewer opportunities to grow.
It is a deep-rooted problem that will need the employers and the
government to work together to solve. Until then, women will continue
being treated unfairly in organizations.
