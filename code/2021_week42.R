library(tidytuesdayR)
library(dplyr)
library(ggplot2)

tuesdata <- tidytuesdayR::tt_load(2021, week = 42)

farmed <- tuesdata$`aquaculture-farmed-fish-production`

sub_farmed = filter(farmed, Entity == 'Brazil'| Entity == 'Norway' | Entity == 'Peru' | Entity == 'Portugal')

df = data.frame(values = sub_farmed$`Aquaculture production (metric tons)`,
                years = sub_farmed$Year,
                country = sub_farmed$Entity)

ggplot(df) + aes(x = years, y = values, color = country) + geom_line() + theme_minimal() + 
    xlab("Year") + ylab("Aquaculture production (metric tons)") + labs(color = 'Entity') +
    scale_y_continuous(limits = c(0, 1500000), breaks = c(0, 500000, 1000000, 1500000))