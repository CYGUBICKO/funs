#### ---- Plot margibal effects for effects package objects ----

plotEffects <- function(df, var, xlabs, scale = c("response", "log-odds")){
	pos <- position_dodge(0.5)
	p1 <- (ggplot(df, aes_string(x = var, y = "fit"))
		+ labs(x = xlabs
			, y = "Log-odds of\nimproved service"
		)
		+ guides(colour = FALSE)
		+ theme(legend.position = "bottom")
	)
	scale <- match.arg(scale)
	if (scale == "response") {
		p1 <- (p1
			+ scale_y_continuous(labels = logist_format(), breaks = breaks_pretty(5))
			+ labs(x = xlabs
				, y = "Probability of\nimproved service"
			)
		)
	}
	if (grepl("numeric|integer", class(df[[var]]))){
		p2 <- (p1
			+ geom_line()
			+ geom_line(aes(y = lower), lty = 2)
			+ geom_line(aes(y = upper), lty = 2)
			+ guides(fill = FALSE)
		)
	} else {
		p2 <- (p1 + geom_point(size = 0.6)
			+ geom_line()
			+ geom_errorbar(aes(ymin = lower, ymax = upper), width = 0)
		)
	}
	return(p2)
}
