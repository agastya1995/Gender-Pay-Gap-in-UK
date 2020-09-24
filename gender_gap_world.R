library(dplyr)
library(ggplot2)

df = read.csv('/home/agastya/Documents/Praxis - Subjects/Stats/End_Term_Project/DP_LIVE_12082020191801527.csv')

gb_wages = df %>% filter(LOCATION=='GBR' & SUBJECT=='EMPLOYEE') 
gb_wages %>% ggplot(aes(x=TIME, y=Value))+geom_line()

subset(gb_wages, TIME==2019)

gb_wages
time_ser = ts(gb_wages$Value, start = 1970)

df %>% filter(LOCATION=='CRI')
country_names = c('Canada', 'Colombia', 'Costa Rica', 'Czech Republic', 'Great Britain', 'Japan',
                  'South Korea', 'Mexico', 'Norway', 'New Zealand', 'Slovakia', 'Sweden', 'USA')

df %>% filter(TIME==2019 & SUBJECT=='EMPLOYEE') %>% 
  ggplot(aes(x=LOCATION, y=Value, fill=LOCATION)) +geom_bar(stat='identity') +
  labs(x='Country', y='Wage Gap (in %)') + scale_x_discrete(labels=country_names)+
  scale_color_hue(labels=country_names)+ guides(fill=FALSE) + 
  theme(text=element_text(size=20), axis.text.x = element_text(angle=45, vjust = .7, hjust=.7)) 
  # ggsave('a.png',  width = 30, height = 20, units = "cm")

gb_wages

