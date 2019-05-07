server <- function(input,output, session){
  
  data <- reactive({
    x <- nwis_df
  })
  
  output$mymap <- renderLeaflet({
    nwis_df <- data()
    
    m <- leaflet(data = nwis_df) %>%
      addTiles() %>%
      addMarkers(lng = ~dec_long_va,
                 lat = ~dec_lat_va,
                 popup = paste("USGS ID", nwis_df$site_no, "<br>",
                               "Site Name", nwis_df$station_nm))
    m
  })
}