o <- readLines('vector_BostonVistingGroup.fa0')
write(gsub('[^A^T^C^G]', '', o, perl = TRUE), file = 'vector_BostonVistingGroup.fa')
