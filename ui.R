
# UI.
ui <- htmlTemplate("www/template.html",

	# The plot.
	plot = plotOutput('tescNetwork', height = '800px'),

	# Controls used to estimate the plot.
	tesc_matrix_name = selectInput('tesc_matrix_name',
								   'Web scraped network data to use:',
								   c('Data for 2017-2018' = 'tesc_matrix_1',
								   	 'Data for 2015-2018' = 'tesc_matrix_3')),

	groups = radioButtons('groups',
						  'Grouping strategy:',
						  c('Department membership'  = 'department',
						  	'Published/ unpublished' = 'published')),

	layout = radioButtons('layout',
						  'Layout algorithm:',
						  c('Spring' = 'spring',
						  	'Groups' = 'groups',
						  	'Circle' = 'circle')),

	borders = 		checkboxInput('borders',       'Show vertex border?',             TRUE),
	bidirectional = checkboxInput('bidirectional', 'Bidirectional edges?',            TRUE),
	directed = 		checkboxInput('directed',      'Assume directed collaborations?', TRUE),
	diag = 			checkboxInput('diag',          'Plot main diagonal?',             TRUE),

	cut = numericInput('cut', 
					   'Absolute width and color saturation scaling for edges:',
					   2),

	vsize = sliderInput('vsize',
						'Vertex size:',
						min = 1,
						max = 15,
						value = c(5, 8)),
			
	vTrans = sliderInput('vTrans',
						 'Vertex transparency:',
						 min = 0,
						 max = 255,
						 value = 150)
)