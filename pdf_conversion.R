
library(pdftools)
library(dplyr)

prospectus <- pdf_text("E:/01.r_projects/05.web_scraping/pdf_input/MandG-(Lux)-Investment-Funds-1_Prospectus_Ireland_ENG.pdf")
glimpse(prospectus)


# Table of contents
toc <- pdf_toc("E:/01.r_projects/05.web_scraping/pdf_input/MandG-(Lux)-Investment-Funds-1_Prospectus_Ireland_ENG.pdf")


# Author, version, etc
info <- pdf_info("E:/01.r_projects/05.web_scraping/pdf_input/MandG-(Lux)-Investment-Funds-1_Prospectus_Ireland_ENG.pdf")

# Table with fonts
fonts <- pdf_fonts("E:/01.r_projects/05.web_scraping/pdf_input/MandG-(Lux)-Investment-Funds-1_Prospectus_Ireland_ENG.pdf")

# renders pdf to bitmap array
bitmap <- pdf_render_page("E:/01.r_projects/05.web_scraping/pdf_input/MandG-(Lux)-Investment-Funds-1_Prospectus_Ireland_ENG.pdf", page = 113)

# save bitmap image
png::writePNG(bitmap, "page.png")
jpeg::writeJPEG(bitmap, "page.jpeg")
webp::write_webp(bitmap, "page.webp")
getwd()


# Factsheet to get tables
library(tabulizer)
location <- "E:/01.r_projects/05.web_scraping/pdf_input/(lux)-asian-fund_eur_a_acc_ie_factsheet_eng_pe_lu1670618187.pdf"
factsheet <- extract_tab