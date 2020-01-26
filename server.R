function(input, output, session){

  plot <- eventReactive(input$botao, {

    sexo <- switch(input$sexo, Masculino = 2, Feminino = 1)
    
    colesterol <- switch(input$colesterol, "Normal" = 1, "Acima do normal" = 2, "Bem acima do normal" = 3)
    
    
    input$dataDeNascimento
    
    idade <- as.numeric(difftime(input$dataDeNascimento, Sys.Date(), units = "days") * -1) ### idade em dias
    
    
    vetorInfos <- cbind.data.frame(idade,sexo,input$altura,input$peso,
                                   input$apHI,input$apLO,colesterol,
                                   as.numeric(as.logical(input$glicose)),
                                   as.numeric(as.logical(input$ativo)))
        
        
    names(vetorInfos) <- nomes
    vetorInfos
    
    b <- predict(modelxgboostShinyApp, vetorInfos,type="prob")
    b <- t(b)
    legenda <- c("Negativa","Positiva")
    novoDF <- cbind.data.frame(b,legenda)
    novoDF
    
  #  saveRDS(novoDF,"novoDF.rds")
    
    
    type <- rownames(novoDF)
    value <-as.numeric(novoDF$b)
    percentage_label = paste0(round(100 * value, 1), "%")
    hover_text = paste0(type,": ",percentage_label)
    
    donut_data <- cbind.data.frame(type,value,hover_text,percentage_label)
    
    donut_data
    
    donut_plot <- ggplot(donut_data, aes(y = value, fill = type)) +
      geom_bar_interactive(
        aes(x = 6, tooltip = hover_text),
        width = 3,
        stat = "identity",
        show.legend = FALSE
      ) +
      annotate(
        geom = "text",
        x = 0,
        y = 0,
        label = donut_data[["percentage_label"]][donut_data[["type"]] == "Presente"],
        size = 18,
        color = "blue"
      ) +
      scale_fill_manual(values = c(Ausente = "orange", Presente = "blue")) +
      coord_polar(theta = "y") +
      ggtitle("           Probabilidade de ter alguma doença cardíaca") +
      theme_void()
    
    
    ggiraph(ggobj = donut_plot , width = 1)
    

}) 



output$statebins <- renderggiraph({

 plot()
  
  
  })  
  

  
}