# This script builds both the HTML and PDF versions of your CV

# If you wanted to speed up rendering for googlesheets driven CVs you could use
# this script to cache a version of the CV_Printer class with data already
# loaded and load the cached version in the .Rmd instead of re-fetching it twice
# for the HTML and PDF rendering. This exercise is left to the reader.

library(here)
# Knit the HTML version of the cv
  rmarkdown::render("CV/cv.rmd")

# moves the file cv.html to the main website folder
  file.rename(here("CV", "cv.html"),
              here("cv.html"))
 

# Convert to PDF using Pagedown
pagedown::chrome_print(input = here("cv.html"),
                       output = here("CV", "cv.pdf"))

# rebuilds the website with a new cv
rmarkdown::render_site(encoding = 'UTF-8')

# note: after these, you must run the git commands in the terminal

#git add .
#git commit -m "a message about the new stuff"
#git push


