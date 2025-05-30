setwd("/media/myaseen208/Documents1/MYaseen208/Consultancy/Mr._M._Yaseen/kidsnotes/reading3vol2/reading3vol2/images")
getwd()

library(pdftools)
library(furrr)
library(png)
library(magick)
library(webp)

FileName1 <- "BoxWhiskerPlot"

# system(paste(getOption("pdfviewer"), paste0(FileName1, ".pdf")))


pdftools::pdf_convert(
  pdf = paste0(FileName1, ".pdf"),
  format = "png",
  pages = NULL,
  filenames = paste0(FileName1, ".png"),
  dpi = 300
)


write_webp(
  image = readPNG(paste0(FileName1, ".png")),
  target = paste0(FileName1, ".webp"),
  quality = 80
)


FilesPNG <- dir(pattern = "png$")
FilesPNG

sapply(FilesPNG, \(x) {
  write_webp(
    image = readPNG(x),
    target = paste0(tools::file_path_sans_ext(x), ".webp"),
    quality = 80
  )
})

FilesJPG <- dir(pattern = "jpg$")

image_read("GeorgeEPBox.jpg")

sapply(FilesJPG, \(x) {
  image_write(
    image = image_read(x),
    path = paste0(tools::file_path_sans_ext(x), ".webp"),
    quality = 80
  )
})
