# if (!("ina" %in% rownames(installed.packages()))) {
# 	devtools::install_github('mihaiconstantin/ina')
# }
# 
# if (!('qgraph' %in% rownames(installed.packages()))) {
# 	install.packages('qgraph')
# }

library(shiny)
library(ina)




# The function for plotting the TESC matrices within ina.
plot_ina <- function (tesc_matrix_name, groups, diag, vsize, vTrans, borders, layout, bidirectional, directed, cut) {
		
	if (tesc_matrix_name == 'tesc_matrix_1') {
		tesc_matrix = tesc_matrix_1
		year = '2017-2018'
		name = 'tesc_matrix_1'
	} else if (tesc_matrix_name == 'tesc_matrix_3') {
		tesc_matrix = tesc_matrix_3
		year = '2015-2018'
		name = 'tesc_matrix_3'
	} else {
		stop('Invalid name for argument \'tesc_matrix_name\'.')
	}

	# Define groups and color acordingly.
	if(groups == 'published') {
		published = apply(tesc_matrix, 1, sum) > 0
		groups_def = as.factor(published)
		
		levels(groups_def)[levels(groups_def) == 'FALSE'] <- 'Unpublished'
		levels(groups_def)[levels(groups_def) == 'TRUE'] <- 'Published'
		
		color_def = c('gray', 'green')

	} else if(groups == 'department') {
		groups_def = as.factor(tesc_data$Department)
		color_def = rainbow(nlevels(groups_def))
	}

	qgraph(
			tesc_matrix, 
			labels = get_last_name(tesc_data$Name),		
			groups        = groups_def, 
			diag 		  = diag,
			vsize         = vsize,
			vTrans        = vTrans, 
			borders       = borders, 
			layout        = layout, 
			bidirectional = bidirectional,
			directed      = directed, 
			cut           = cut,
			color         = color_def,
			title         = paste('TESC collaborations for ', year, sep = ''),
			border.width  = 1)
}