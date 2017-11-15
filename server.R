
# Server.s
server <- function(input, output) {

	output$tescNetwork <- renderPlot({

		plot_ina(input$tesc_matrix_name, 
				 input$groups, 
				 input$diag, 
				 input$vsize, 
				 input$vTrans, 
				 input$borders,
				 input$layout,
				 input$bidirectional,
				 input$directed,
				 input$cut
			)
	})
}