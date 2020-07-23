library(ggplot2)
ggtheme <- function(){
   theme_set(theme_bw() +
      theme(panel.spacing=grid::unit(0,"lines")
      	, plot.title = element_text(hjust = 0.5)
			, legend.position = "bottom"
			, axis.ticks.y = element_blank()
			, axis.text.x = element_text(size = 12)
			, axis.text.y = element_text(size = 12)
			, axis.title.x = element_text(size = 12)
			, axis.title.y = element_text(size = 12)
			, legend.title = element_text(size = 13, hjust = 0.5)
			, legend.text = element_text(size = 13)
			, panel.grid.major = element_blank()
			#, panel.grid.minor = element_blank()
			, legend.key.size = unit(0.8, "cm")
			, legend.key = element_rect(fill = "white")
			, panel.spacing.y = unit(0.3, "lines")
			, panel.spacing.x = unit(1, "lines")
			, strip.background = element_blank()
			, panel.border = element_rect(colour = "grey"
				, fill = NA
				, size = 0.8
			)
			, strip.text.x = element_text(size = 11
				, colour = "black"
				, face = "bold"
			)
      )
   )
}




my_bwtheme <- theme(axis.text.x = element_text(size = 16),
             axis.text.y = element_text(size = 16),
             axis.title.x = element_text(size = 16),
             axis.title.y = element_text(size = 16),
             legend.title = element_text(size = 12),
             panel.grid.major = element_blank(),
             panel.grid.minor = element_blank(),
             strip.background = element_blank(),
             panel.spacing = unit(0, "lines"),
             legend.key.size = unit(.25, "cm"),
             legend.key = element_rect(fill = "white"),
             panel.spacing.y = unit(0.5, "lines"),
             panel.spacing.x = unit(0.6, "lines"),
             panel.border = element_rect(colour = "grey", 
                                         fill = NA, size = 0.8),
             strip.text.x = element_text(size = 12, colour = "black", 
                                         face = "bold"
	)
)
facet_theme <- theme(
	plot.title = element_text(hjust = 0.5, face = "bold", colour = "grey")
	, legend.position = "none"
	, axis.ticks.y = element_blank()
	, axis.text.x = element_text(size = 10)
	, axis.text.y = element_text(size = 10)
	, axis.title.x = element_text(size = 10)
	, axis.title.y = element_text(size = 10)
	, legend.title = element_text(size = 13)
	, panel.grid.major = element_blank()
	, panel.grid.minor = element_blank()
	, panel.spacing = unit(0, "lines")
	, legend.key.size = unit(.25, "cm")
	, legend.key = element_rect(fill = "white")
	, panel.spacing.y = unit(0.3, "lines")
	, panel.spacing.x = unit(1, "lines")
	, strip.background = element_blank()
	, panel.border = element_rect(colour = "grey"
		, fill = NA
		, size = 0.8
	)
	, strip.text.x = element_text(size = 11
		, colour = "black"
		, face = "bold"
	)
	#, plot.margin = margin(1, 4.5, 1, 1, "cm")
)
