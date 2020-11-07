#### ---- Plot margibal effects for effects package objects ----

plotEffects <- function(df, var, xlabs, scale = c("response", "log-odds")){
	pos <- position_dodge(0.5)
	p1 <- (ggplot(df, aes_string(x = var, y = "fit", colour = "method"), alpha = 0.2)
		+ scale_colour_manual(values = c("red", "blue"))
		+ labs(x = xlabs
			, y = "Log-odds of\nimproved service"
		)
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
		p2 <- (p1 + geom_point(position = position_dodge(0.3), size = 0.6)
			+ geom_pointrange(aes(ymin = lower, ymax = upper), position = position_dodge(0.3))
		)
	}
	return(p2)
}
