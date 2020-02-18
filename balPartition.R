# Random sampling is done within the levels of predictor variable to in order to achieve balanced the class distributions within the test and train sets.

balPartition <- function(df, variable=NULL, prop=0.70){
	df <- (df
		%>% group_by(.dots = variable)
		%>% mutate(index = runif(n())<=prop)
		%>% ungroup()
	)
	part_index <- pull(df, index)
	train_df <-(df
		%>% filter(index)
		%>% data.frame()
		%>% select(-index)
	)
	test_df <-(df
		%>% filter(!index)
		%>% select(-index)
		%>% data.frame()
	)
	out <- list(train_df = train_df
		, test_df = test_df
		, part_index = part_index
	)
	return(out)
}


