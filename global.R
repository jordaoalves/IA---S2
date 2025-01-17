library(shinycssloaders)
library(shinydashboard)
library(shinyjs)
library(shinyWidgets)
library(statebins)
#library(hrbrthemes)
library(showtext)
library(ggplot2)
library(ggiraph)
library(caret)
library(mlbench)
library(xgboost)
library(plotly)
library(curl)
#library(ggpubr)
#theme_set(theme_ipsum_rc())
font_add_google(name = "Roboto Condensed", family = "Roboto Condensed", regular.wt = 400, bold.wt = 700)
showtext_auto()
showtext_opts(dpi = 112)


#load("modeloPredicaoXGBShinyCompleto.RData")
load("modelxgboostShinyApp.RData")

nomes <- c("age","gender","height","weight","ap_hi","ap_lo","cholesterol","gluc","active")
