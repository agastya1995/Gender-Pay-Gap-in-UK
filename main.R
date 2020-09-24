library(dplyr)
library(ggplot2)
library(reshape2)

# LOAD AND PREPROCESS DATA

df_2017 = read.csv('UK Gender Pay Gap Data - 2017 to 2018.csv')
df_2018 = read.csv('UK Gender Pay Gap Data - 2018 to 2019.csv')
df_2019 = read.csv('UK Gender Pay Gap Data - 2019 to 2020.csv')

head(df_2017)
names(df_2017)

# Start by creating a unique id, which is the company number (if present), else the company name
df_2017$unique_id = ifelse(df_2017$CompanyNumber=='', df_2017$EmployerName, df_2017$CompanyNumber)
df_2018$unique_id = ifelse(df_2018$CompanyNumber=='', df_2018$EmployerName, df_2018$CompanyNumber)
df_2019$unique_id = ifelse(df_2019$CompanyNumber=='', df_2019$EmployerName, df_2019$CompanyNumber)

df_2017$year = 2017
df_2018$year = 2018
df_2019$year = 2019


# Drop items before merging -  Address, CompanyNumber, SicCodes, CompanyLinkToGPGInfo, ResponsiblePerson, CurrentName, DueDate, DateSubmitted
df_2017 = df_2017[, !(names(df_2017) %in% c('EmployerName', 'Address', 'CompanyNumber', 'SicCodes', 'CompanyLinkToGPGInfo', 'ResponsiblePerson', 'CurrentName', 'DueDate', 'DateSubmitted'))]
df_2018 = df_2018[, !(names(df_2018) %in% c('EmployerName', 'Address', 'CompanyNumber', 'SicCodes', 'CompanyLinkToGPGInfo', 'ResponsiblePerson', 'CurrentName', 'DueDate', 'DateSubmitted'))]
df_2019 = df_2019[, !(names(df_2019) %in% c('Address', 'CompanyNumber', 'SicCodes', 'CompanyLinkToGPGInfo', 'ResponsiblePerson', 'CurrentName', 'DueDate', 'DateSubmitted'))]


dim(df_2018)
dim(df_2019)
dim(df_2017)

# Convert employer size and submitted after deadline to factors
df_2017["SubmittedAfterTheDeadline"] = lapply(df_2017["SubmittedAfterTheDeadline"], as.factor)
df_2017["EmployerSize"] = lapply(df_2017["EmployerSize"], as.factor)

df_2018["SubmittedAfterTheDeadline"] = lapply(df_2018["SubmittedAfterTheDeadline"], as.factor)
df_2018["EmployerSize"] = lapply(df_2018["EmployerSize"], as.factor)

df_2019["SubmittedAfterTheDeadline"] = lapply(df_2019["SubmittedAfterTheDeadline"], as.factor)
df_2019["EmployerSize"] = lapply(df_2019["EmployerSize"], as.factor)

# Replace na values with 0 (only in the bonus mean difference rows)
df_2017 = replace(df_2017, is.na(df_2017), 0)
df_2018 = replace(df_2018, is.na(df_2018), 0)
df_2019 = replace(df_2019, is.na(df_2019), 0)

# Combine the 3 dataframes on either company name or company number, get rid of the rest
df_combined = merge(merge(df_2017, df_2018, by='unique_id', suffixes = c('_2017', '_2018')), df_2019, by='unique_id', suffixes=c('_2018', '_2019'))

# Add 2019 suffix to 2019 columns
names(df_combined)[34:length(names(df_combined))] = gsub('(\\w*)', '\\1_2019', names(df_combined)[34:length(names(df_combined))])

# -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- # 
# -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- # 
# -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- # 


#EDA


# Bonus - Males vs Females per company

# Percentage of women who received bonuses over the past 3 years 
df_combined %>% group_by(EmployerSize_2019) %>%
  summarise('Mean Bonus Percent (2017)' = mean(FemaleBonusPercent_2017) , 'Mean Bonus Percent (2018)' = mean(FemaleBonusPercent_2018),  
            'Mean Bonus Percent (2019)' = mean(FemaleBonusPercent_2019)) %>%
  filter(EmployerSize_2019 != 'Not Provided') %>%
   rename('Employer Size'=EmployerSize_2019)


# Need to compare it with men who receive bonuses
a = df_2019 %>% group_by('Employer Size' = EmployerSize) %>%
  filter (EmployerSize!='Not Provided') %>% 
  summarise('Female' = mean(FemaleBonusPercent),  'Male' = mean(MaleBonusPercent))
  

a_melt = melt(a,id.vars='Employer Size', variable.name = 'sex', value.name='Bonus Payout Percentage')

a_melt %>% ggplot(aes(x=`Employer Size`, y=`Bonus Payout Percentage`, fill=sex)) + geom_bar(stat='identity', position='dodge')+
  theme(text=element_text(size=12), axis.text.x = element_text(angle=45, vjust = .7, hjust=.7)) +
  labs(title='Bonus Payout Percentage - Males vs Females')+
  theme_classic() # + ggsave('bonus_payout.jpg', dpi=1000)
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# A


# -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- # 

# Bonus Frequency Polygons


# Frequency polygon of females in each quartile in 2019
# Lower Quartile
df_2019 %>% filter (EmployerSize!='Not Provided') %>% 
  ggplot(aes(x=FemaleLowerQuartile, color=EmployerSize)) +  geom_density(size=1) + 
  labs(x='Percentage', y='Density', color='Employer Size', title='Percentage of Females in Lower Quartile')+ 
  theme_classic() #+ ggsave('lower_quart_dens.jpg', dpi=1000)



# Lower Middle Quartile
df_2019 %>% filter (EmployerSize!='Not Provided') %>% 
  ggplot(aes(x=FemaleLowerMiddleQuartile, color=EmployerSize)) +  geom_density(size=1) + 
  labs(x='Percentage', y='Density', color='Employer Size', title='Percentage of Females in Lower-Middle Quartile')+
  theme_classic()# +  ggsave('lower_mid_quart_dens.jpg', dpi=1000)


# Upper Middle Quartile
df_2019 %>% filter (EmployerSize!='Not Provided') %>% 
  ggplot(aes(x=FemaleUpperMiddleQuartile, color=EmployerSize)) +  geom_density(size=1) + 
  labs(x='Percentage', y='Density', color='Employer Size', title='Percentage of Females in Upper-Middle Quartile')+
  theme_classic() # + ggsave('upper_mid_quart_dens.jpg', dpi=1000)


# Top  Quartile
df_2019 %>% filter (EmployerSize!='Not Provided') %>% 
  ggplot(aes(x=FemaleTopQuartile, color=EmployerSize)) +  geom_density(size=1) + 
  labs(x='Percentage', y='Density', color='Employer Size', title='Percentage of Females in Top Quartile')+
  theme_classic()#  + ggsave('top_quart_dens.jpg', dpi=1000)


# -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- # 


# Organization Structure

# Percentage of women in the top quartile
df_combined %>% group_by('Employer Size' = EmployerSize_2019) %>% 
  summarise('Females in Top Quartile (2017)' = mean(FemaleTopQuartile_2017), 
            'Females in Top Quartile (2018)' = mean(FemaleTopQuartile_2018),  
            'Females in Top Quartile (2019)' = mean(FemaleTopQuartile_2019)) %>%
  filter(`Employer Size` != 'Not Provided')



# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

x = df_2019%>% select('Lower Quartile' = FemaleLowerQuartile, 'Lower Middle Quartile' = FemaleLowerMiddleQuartile, 
                      'Upper Middle Quartile' = FemaleUpperMiddleQuartile, 'Top Quartile' = FemaleTopQuartile)

melt(x, variable.name='Quartile') %>% ggplot(aes(x=Quartile, y=value, fill=Quartile)) + geom_boxplot()+
  labs(x='Quartile', y='Percentage', title='Females per Quartile')+
  theme_classic()+
  theme(axis.text.x = element_text(angle = 30, vjust=.7, hjust=0.7), text=element_text(size=12))# +ggsave('box_plot_female_quartile.jpg', dpi=1000)
  
  

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# One Way Anova - difference in mean pay over the years
mean_pay = df_combined %>% select('2017'=DiffMeanHourlyPercent_2017, '2018'= DiffMeanHourlyPercent_2018, 
                                  '2019' = DiffMeanHourlyPercent_2019)
mean_pay = melt(mean_pay, variable.name = 'Year')

fm_1 = aov(value~Year, data=mean_pay)
anova(fm_1)

mean_pay %>% ggplot(aes(x=Year, y=value, fill=Year))+geom_boxplot()+
  labs(y='Percentage', title='Percentage Difference in Mean Hourly Pay')+
  theme_classic() # + ggsave('pay_boxplot.jpg', dpi=1000)

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# One Way Anova - difference in bonus pay over the years

bonus_pay = df_combined %>% select(DiffMeanBonusPercent_2017, DiffMeanBonusPercent_2018, DiffMeanBonusPercent_2019)
bonus_pay = melt(bonus_pay)

fm_2 = aov(value~variable, data=bonus_pay)
anova(fm_2)
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Difference in bonus pay
df_combined %>% group_by('Employer Size' = EmployerSize_2019) %>% 
  summarise('Mean Difference (2017)' = mean(DiffMeanBonusPercent_2017), 
            'Mean Difference (2018)' = mean(DiffMeanBonusPercent_2018), 
            'Mean Difference (2019)' = mean(DiffMeanBonusPercent_2019)) %>%
  filter(`Employer Size` != 'Not Provided')




x = df_combined %>% summarise('2017'=mean(DiffMeanHourlyPercent_2017),
                          '2018'=mean(DiffMeanHourlyPercent_2018),
                          '2019' = mean(DiffMeanHourlyPercent_2019))



melt(x) %>% ggplot(aes(x=variable, y=value, group=1)) + geom_path() + geom_point(size=2)+
  labs(x='Year', y='Percentage Difference', title='Percentage Difference in Mean Hourly Rates') +
  theme_classic() # + ggsave('hourly_rates_over_year.jpg', dpi = 1000, )

y = df_combined %>% summarise('2017'=mean(DiffMeanBonusPercent_2017),
                              '2018'=mean(DiffMeanBonusPercent_2018),
                              '2019' = mean(DiffMeanBonusPercent_2019))


melt(y) %>% ggplot(aes(x=variable, y=value, group=1)) + geom_line() + geom_point() + 
  labs(x='Year', y='Percentage Difference', title='Percentage Difference in Mean Bonus Rates') +
  theme_classic() # + ggsave('bonus_diff_over_year.jpg', dpi = 1000)

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Two sample t test, to see if there is a differenece between the bonus payout rates

t.test(df_2019$MaleBonusPercent, df_2019$FemaleBonusPercent, alternative='greater')


# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Boxplot of difference in pay, by employer size. Remove the one outlier

df_2019 %>% filter(EmployerSize!='Not Provided', DiffMeanHourlyPercent>-200) %>% 
  select('Employer Size' = EmployerSize, 'Percentage Difference' = DiffMeanHourlyPercent) %>%
  ggplot(aes(x=`Employer Size`, y=`Percentage Difference`, fill=`Employer Size`)) + geom_boxplot()+
  labs(title='Average Difference in Mean Hourly Rates') + 
  theme_classic()#   + ggsave('hourly_pay_per_employer.jpg', dpi=1000)


df_2019 %>% filter(EmployerSize!='Not Provided') %>% group_by(EmployerSize) %>%
          summarise(mean(DiffMeanHourlyPercent))

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
library(regclass)
library(lmtest)

# Create a new data frame for linear regression. Easy to work with
df_for_regression = df_2019[, names(df_2019) %in% c('DiffMeanHourlyPercent',  'FemaleLowerQuartile', 'FemaleLowerMiddleQuartile',
                                'FemaleUpperMiddleQuartile', 'FemaleTopQuartile', 'EmployerSize',
                                'MaleBonusPercent', 'FemaleBonusPercent')]

# Drop the companies where employer size is not provided
df_for_regression <- df_for_regression %>% filter(EmployerSize != 'Not Provided')



str(df_for_regression)
lin_mod = lm(DiffMeanHourlyPercent~FemaleLowerQuartile+FemaleLowerMiddleQuartile+FemaleUpperMiddleQuartile
             +FemaleTopQuartile+EmployerSize + FemaleBonusPercent + MaleBonusPercent, data = df_for_regression)


summary(lin_mod)

# Test for Multicollinearity
# Use GVIF. VIFs are fine, all under 5
VIF(lin_mod)
dwtest(lin_mod) # Almost 2. So not going to change anything

  
lin_mod = lm(DiffMeanHourlyPercent~FemaleLowerQuartile+FemaleTopQuartile+EmployerSize + FemaleBonusPercent, data = df_for_regression)
VIF(lin_mod)

summary(lin_mod)
# Test for hetroscedasticity
lmtest::bptest(lin_mod)

lm_df = fortify(lin_mod)

lm_df %>% ggplot(aes(x=.fitted, y=.resid))+geom_point()+
  geom_smooth(aes(x=lm_df$.fitted, y=lm_df$.resid)) + 
  geom_hline(yintercept =mean(lm_df$.resid)) +
  labs(x='Fitted Values', y='Residuals', title='Residuals vs Fitted Values') + 
  theme_classic() #+  ggsave('errors_vs_fitted.jpg', dpi = 1000)


lm_df %>% ggplot(aes(x=.resid)) + geom_freqpoly(binwidth=1)+
  labs(x='Residuals', y='Count', title='Frequency Polygon of Residuals')+
  theme_classic() # + ggsave('freq_poly_errors.jpg', dpi=1000)

summary(lin_mod)

# drop employer size
lin_mod_2 = lm(DiffMeanHourlyPercent~FemaleLowerQuartile+FemaleLowerMiddleQuartile+FemaleUpperMiddleQuartile
             +FemaleTopQuartile, data = df_for_regression)

summary(lin_mod_2)

VIF(lin_mod_2)
dwtest(lin_mod_2)

bptest(lin_mod_2)

lm_df_2 = fortify(lin_mod_2)

lm_df_2 %>% ggplot(aes(x=.fitted, y=.resid))+geom_point() + geom_smooth() +
  geom_hline(yintercept =mean(lm_df$.resid))+
  theme_classic()
# Test autocorrelation of errors


summary(lin_mod_2)
summary(lin_mod)


