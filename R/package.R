#' @import utils

with_ext = bookdown:::with_ext
readUTF8 = function(f) {
  s = file.info(f)$size
  if (s == 0) return(character(0))
  x = readChar(f, s, useBytes = TRUE)
  Encoding(x) = 'UTF-8'
  x = strsplit(x, '\n', fixed = TRUE)[[1]]
  gsub('\r$', '', x, perl = TRUE)
}

writeUTF8 = bookdown:::writeUTF8
dir_exists = bookdown:::dir_exists
dir_create = bookdown:::dir_create
existing_files = bookdown:::existing_files

attr = knitr:::attr
in_dir = knitr:::in_dir
`%n%` = knitr:::`%n%`

blogdown_skeleton = function(path, ...) {
  new_site(dir = path, ..., serve = FALSE)
}
