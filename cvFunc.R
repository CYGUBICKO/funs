cvFunc <- function(df, ntree, mtry, nfolds = 5){
	n_folds <- nfolds
	n_train <- nrow(df)
	tuneGrid <- expand.grid(folds = 1:n_folds, ntree = ntree, mtry = mtry)
	cv_errors <- expand.grid(folds = 1:n_folds, ntree = rep(0, length(ntree)), mtry = rep(0, length(mtry)))
	folds_i <- sample(rep(1:n_folds, length.out = n_train))
	for (p in 1:nrow(tuneGrid)){
		index <- which(folds_i == tuneGrid[["folds"]][p])
		train <- df[-index, ]
		test <- df[index, ]
		fit <- rsf(Surv(time, status) ~ age, data = train, ntree = tuneGrid[["ntree"]][p], mtry = tuneGrid[["mtry"]][p])
		fit	
	}
}
