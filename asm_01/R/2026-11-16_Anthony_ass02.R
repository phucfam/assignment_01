##***************************
## Group Assignment 1
##
## Satchit Bhattacharya
##
## 2026-11-16
##
##***************************

## _ Packages used -------
library(tidyverse)
conflicted::conflicts_prefer(dplyr::filter())

#find.sp shows all taxons and what species we will work with
#t.sp.8 is the trichinella species 8 our group will be comparing with
#t.main is the trichinella sp. we are comparing to

setwd("./R/")

find.sp <- read.csv("../data/2026-10-19_trich_genotypes.csv")
t.sp.8 <- read.csv("../data/GCA_001447745.1.csv")
t.main <- read_csv("../data/trichinella_spiralis_te.csv")

#Number of each unique class for matching_class fr----
t.sp.8 |>
  group_by(matching_class) |>
  count() |> 
  arrange(desc(n))

t.main |>
  group_by(matching_class) |>
  count() |> 
  arrange(desc(n))

t.sp.8$matching_class |> unique() #|> length()
t.main$matching_class |> unique() #|> length()

#tric.sp.8 has 31 classes | tric.main has 28 classes

#list of unique matching_class as list----

t.8_class <- c( "LTR/Gypsy", "Simple_repeat", "Low_complexity", "PLE/Naiad", 
                "Satellite","DNA/TcMar-Tc1", "LTR/Pao","LINE/CR1", "Unknown", "ARTEFACT","PLE", 
                "SINE/tRNA-Deu-L2", "rRNA","DNA/TcMar-Pogo", "LTR/Ngaro", "DNA", "DNA/TcMar-Tc2", 
                "LINE/RTE-BovB","DNA/MULE-MuDR", "LINE/I-Jockey","DNA/TcMar-Tc4", "DNA/TcMar-Mariner", 
                "LINE","LTR/DIRS", "DNA/PIF-Harbinger", "DNA/hAT-Tip100", "LINE/RTE-RTE","DNA/hAT",
                "DNA/hAT-Ac","snRNA", "SINE/tRNA-RTE")

length(t.8_class)


#Working with t.sp.8----
#DNA transposons + retro transposons in tric.sp.8

t.8_dna.te <- c("DNA/TcMar-Tc1",
                "DNA/TcMar-Pogo",
                "DNA",
                "DNA/TcMar-Tc2",
                "DNA/MULE-MuDR",
                "DNA/TcMar-Tc4",
                "DNA/TcMar-Mariner",
                "DNA/PIF-Harbinger",
                "DNA/hAT-Tip100",
                "DNA/hAT",
                "DNA/hAT-Ac")

t.8_retro <- c("LTR/Gypsy",
               "LTR/Pao",
               "LTR/Ngaro",
               "LTR/DIRS",
               "LINE/CR1",
               "LINE/RTE-BovB",
               "LINE/I-Jockey",
               "LINE",
               "LINE/RTE-RTE",
               "SINE/tRNA-Deu-L2",
               "SINE/tRNA-RTE",
               "PLE/Naiad",
               "PLE")

#Looking only at the DNA transposons in tric.sp8

t.sp.8_DNA_te<- t.sp.8 |> 
  filter(matching_class%in%t.8_dna.te)
#view()

#Looking only at the retrotransposon in tric.sp8 ####
t.sp.8_retro_te<- t.sp.8 |> 
  filter(matching_class%in%t.8_retro) |> 
  View()

t.main_DNA_te <- t.main |> 
  filter(matching_class%in%t.main_dna.te) |> 
  view()

#DNA transposons similarities and differences between both groups
t.main_DNA_te |> 
  mutate(both = matching_class%in%t.8_dna.te) |> view()

#t.8_retro & t.main_retro
#mutating the column to identify unique seq b/w t8 and main
t.8_retro_unique <- t.sp.8 |> 
  filter(matching_class %in% )


#Working with t.main----
#DNA transposons + retrotransposons in t.main
t.main_dna.te <- c("DNA/TcMar-Tc4",
                   "DNA/TcMar-Tc1",
                   "DNA/hAT",
                   "DNA/PIF-Harbinger",
                   "DNA/TcMar-Mariner",
                   "RC/Helitron",
                   "DNA/hAT-Ac",
                   "DNA/MULE-MuDR",
                   "DNA/TcMar-Pogo",
                   "DNA/CMC-Chapaev")

t.main_retro <- c("LINE/CR1",
                  "LINE/RTE-BovB",
                  "SINE/tRNA-RTE",
                  "SINE/tRNA-Deu-L2",
                  "LTR/Pao",
                  "LTR/Gypsy",
                  "LTR/Ngaro",
                  "LTR/DIRS")

#Looking only at DNA transposons in t.main
t.main_DNA_te <- t.main |> 
  filter(matching_class%in%t.main_dna.te) |> 
  view()

#DNA transposons similarities and differences between both groups
t.main_DNA_te |> 
  mutate(both = matching_class%in%t.8_dna.te) |> view()

#two T.Es in t.main_DNAte that are not in t.sp_DNA_te

t.sp.8_DNA_te |> 
  mutate(both = matching_class%in%t.main_dna.te) |> view()
#three T.Es in t.sp_DNA_te that are not in t.main_DNA_te

#lists for unique DNA transposons in each species ----
t.sp.8_unique.DNA <- c("DNA", "DNA/TcMar-Tc2", "DNA/hAT-Tip100")
t.main_unique.DNA <- c("RC/Helitron", "DNA/CMC-Chapaev")

#not sure what to do with this info -> maybe useful for our topic
#Code is very messy. Feel free to change it around

