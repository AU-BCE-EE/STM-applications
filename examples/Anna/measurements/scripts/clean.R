# Clean and restructure data

# Standarize names
names(dat) <- gsub('\\.', '_', names(dat))

# Reshape data into long format
dl <- data.frame()

dates <- names(dat)[grepl('Date', names(dat))]

for (i in dates) {

  k <- which(names(dat) == i)
  dd <- data.frame(date.time = dat[, i], temp = dat[, k + 1])
  dd$date.key <- i

  x <- names(dat)[k + 1]

  # Position is first letter
  # Note that ? makes preceding optional, max once
  dd$pos <- gsub('^([A-C]).+', '\\1', x)
  dd$height <- gsub('^[A-C]([0-9][A-Z]?).+', '\\1', x)
  dd$slurry <- gsub('^[A-Z][0-9][A-Z]?_(.+)', '\\1', x)

  dl <- rbind(dl, dd)

}

# Remove missing temperature data (forced NAs because of original structure)
dl <- subset(dl, !is.na(temp))

# Sort out date
dl$date <- as.Date(dl$date.time, format = '%m/%d/%y %H:%M:%S')
dl$date.time <- as.POSIXct(dl$date.time, format = '%m/%d/%y %H:%M:%S')
