library(shiny)
library(leaflet)
library(dplyr)
library(tidyr)
library(tidyverse)

library(dataRetrieval)

rm(siteInfo)

siteInfo <- readNWISdata(stateCd="UT", parameterCd="00060",
                         hasDataTypeCd="iv", service="site")

View(siteInfo)
colnames(siteInfo)

# Lat and Long columns are already numeric
typeof(siteInfo$dec_lat_va)

# Save dataset to rds file
saveRDS(siteInfo, "/home/kate/CodeProjects/RShiny/LeafletShinyNWIS/UT_siteInfo.rds")

parsed_df <- readRDS("/home/kate/CodeProjects/RShiny/LeafletShinyNWIS/UT_siteInfo.rds")

colnames(parsed_df)
