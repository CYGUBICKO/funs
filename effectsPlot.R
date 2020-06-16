#### ---- Plot effects ----
#### ---- Details: Plots the predicted effect sizes form a effect lib -
#### ---- Date: 2020 Jan 11 (Sat) ----

#source("ggplot_theme.R")

plotEffects <- function(df, var, xlabs){
	pos <- position_dodge(0.2)
	p1 <- (ggplot(df, aes_string(x = var, y = "fit", group = "services"))
		+ scale_color_discrete(breaks = c("watersource"
				, "garbagedposal"
				, "toilettype"
			)
		)
		+ labs(x = xlabs
			, y = "Probability of\nimproved service"
			, colour = "Services"
		)
		+ theme(legend.position = "bottom")
	)
	if (grepl("numeric|integer", class(df[[var]]))){
		p2 <- (p1 + geom_smooth(aes(ymin = lower, ymax = upper, colour = services)
				, stat = "identity"
				, size = 0.5
			)
		)
	} else {
		p2 <- (p1 + geom_point(size = 0.6)
			+ geom_line()
			+ geom_errorbar(aes(ymin = lower, ymax = upper), width = 0)
			+ facet_wrap(~services, scales = "free_y")
#			+ facet_theme
		)
#		p3 <- (ggplot(df, aes_string(x = "services", y = "fit", colour = var, group = var))
#			+ geom_point(size = 0.5)
#			+ geom_line(aes_string(linetype = var))
#			+ geom_errorbar(aes(ymin = lower, ymax = upper), width = 0)
#			+ facet_wrap(as.formula(paste0("~", var)), scales = "free_y")
#			+ facet_theme
#		)
	}
	return(p2)
}


