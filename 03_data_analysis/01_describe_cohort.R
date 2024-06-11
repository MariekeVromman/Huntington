
#' ---
#' title: "HD mice cohort - describe cohort"
#' author: "Marieke Vromman"
#' output: 
#'    html_document:
#'       toc: TRUE
#'       toc_float: TRUE
#'       theme: paper
#'       df_print: paged
#'       highlight: tango
#' ---
#' 

#' # File set-up

#' ## Set working directory to current directory
if (rstudioapi::isAvailable()) {
  setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
}

#' ## Load standard libraries and resolves conflicts
library(tidyverse)
library(conflicted)
conflict_prefer("filter", "dplyr")
conflict_prefer("select", "dplyr")
conflict_prefer("slice", "dplyr")
conflict_prefer("rename", "dplyr")
conflict_prefer('intersect', 'dplyr')

#' ## Set figure theme
mytheme = theme_bw(base_size = 10) + 
  theme(text = element_text(size=10, colour='black'),
        title = element_text(size=10, colour='black'),
        line = element_line(linewidth=0.5),
        axis.title = element_text(size=10, colour='black'),
        axis.text = element_text(size=10, colour='black'),
        axis.line = element_line(colour = "black"),
        axis.ticks = element_line(linewidth=0.5),
        strip.background = element_blank(),
        strip.text.y = element_blank(),
        panel.grid = element_blank(),
        panel.border = element_blank(),
        legend.text=element_text(size=10)) 

mytheme_discrete_x = mytheme + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1))

#' ## Read data
anno = read_tsv('../01_data/metadata.tsv')

anno %>%
  count(housing_condition)
  
anno %>% 
  select(BioSample, Age, genotype, housing_condition, sex) %>%
  group_by(Age, genotype, housing_condition, sex) %>%
  tally()

anno$Age = factor(anno$Age, levels = c('2 month', '6 month', '10 month'))
anno$genotype = factor(anno$genotype, levels = c('Het (Q20) Knock-In', 
                                                 'Het (Q80) Knock-In', 
                                                 'Het (Q92) Knock-In', 
                                                 'Het (Q111) Knock-In', 
                                                 'Het (Q140) Knock-In',
                                                 'Het (Q175) Knock-In',
                                                 'Wild Type'))

anno$housing_condition = factor(anno$housing_condition, levels = c('housed with Het (Q20) mice', 
                                                                   'housed with Het (Q80) mice', 
                                                                   'housed with Het (Q92) mice', 
                                                                   'housed with Het (Q111) mice', 
                                                                   'housed with Het (Q140) mice',
                                                                   'housed with Het (Q175) mice'))

anno %>% 
  filter(!genotype == 'Wild Type') %>%
  select(BioSample, Age, genotype, housing_condition, sex) %>% 
  ggplot(aes(genotype, fill = sex)) +
  geom_bar() +
  facet_wrap(~Age) +
  mytheme_discrete_x +
  ggtitle('all knock-in mice')

anno %>% 
  filter(genotype == 'Wild Type') %>%
  select(BioSample, Age, genotype, housing_condition, sex) %>% 
  ggplot(aes(housing_condition, fill = sex)) +
  geom_bar() +
  facet_wrap(~Age) +
  mytheme_discrete_x +
  ggtitle('all wild type mice')

anno
