test <- read.table("test/X_test.txt", as.is = TRUE)
training <- read.table("train/X_train.txt", as.is = TRUE)
features <- read.table("features.txt", as.is = TRUE)
measurements <- rbind(test, training)
rm("test")
rm("training")
features <- read.table("features.txt", as.is = TRUE)


teset1 <- strsplit(features[[2]], split = "\\-")
te2 <- do.call(cbind.fill, c(lapply(teset1, data.frame, stringsAsFactors = FALSE), fill = NA))
te2[] <- lapply(te2, as.character)
te3 = as.data.frame(t(te2), stringsAsFactors = FALSE)
