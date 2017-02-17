# ===============
# pollutantmean.R
# ===============
pollutantmean <- function(directory, pollutant, id=1:332) {

  all_files = list.files(directory, full.names=TRUE)
  select_files = all_files[id]

  means = c()

  for (filepath in select_files) {
    df <- read.csv(filepath)
    series = df[, pollutant]
    col_mean <- mean(series, na.rm=TRUE)
    means <- c(means, col_mean)  # Append
  }

  return(mean(means))
}


# ==========
# complete.R
# ==========
complete <- function(directory, id=1:332) {

  all_files = list.files(directory, full.names=TRUE)
  select_files = all_files[id]

  id <- c()
  nobs <- c()

  for (filepath in select_files) {

    data <- read.csv(filepath)

    id_str <- gsub('(.*/)([0-9]+).csv', "\\2", filepath)
    id_int <- as.integer(id_str)
    id <- c(id, id_int)  # Append

    na_omit <- na.omit(data)
    n_row <- nrow(na_omit)
    nobs <- c(nobs, n_row)  # Append
  }

  df <- data.frame(id=id, nobs=nobs)
  return(df)
}


# ======
# corr.R
# ======
corr <- function(directory, threshold=0) {

    files <- list.files(directory, full.names=TRUE)
    cr <- c()

    for (filepath in files) {

        data <- read.csv(filepath)
        na_omit <- na.omit(data)

        if (nrow(na_omit) > threshold) {
          cor_ <- cor(na_omit$sulfate, na_omit$nitrate)
          cr <- c(cr, cor_)  # Append
        }
    }
    return(cr)
}
