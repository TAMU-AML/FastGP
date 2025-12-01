

df <- read.csv("Dataset6/Inland Wind Farm Dataset2(WT1).csv")
df$wind_direction_sin <- sin(df$D)
df$wind_direction_cos <- cos(df$D)

t1 <- subset(df, year(time) %in% c(2008, 2009))
t2 <- subset(df, year(time) %in% c(2010, 2011))

start_time <- Sys.time()

xCol = c(2,3,4,5,6,7,9,10) 
yCol = c(8) 

trainX = as.matrix(t1[1:10000,xCol])
trainY = as.numeric(t1[,yCol])
testX<- as.matrix(t2[,xCol])
testY=as.numeric(t2[,yCol])


results <- data.frame(T_size = numeric(), RMSE_Vecchia = numeric(),runtime=numeric(), stringsAsFactors = FALSE)

set=c(seq(1,500,by=5))
runtimes <- numeric(length(set))

for (t in set) {

  iter_start_time <- Sys.time()
  
  bins = createThinnedBins(trainX, trainY, t)
  
  model1 <- fit_scaled_thinned(inputs = trainX, y = trainY, T=t, thinnedBins = bins, ms=30, max.it=16, tol.dec = 6)
  
  pred1 <- predictions_scaled_thinned(model1, testX, m=140)
  
  rmse_vecchia <- Metrics::rmse(testY, pred1)
  
  iter_end_time <- Sys.time()
  iter_duration <- iter_end_time - iter_start_time
  runtimes[t] <- iter_duration
  

  results[nrow(results) + 1, ] <- c(t, rmse_vecchia, iter_duration)
  print(results)
}

data=results
data <- data %>%
  mutate(
    Highlight_RMSE = case_when(
      RMSE_Vecchia %in% head(sort(RMSE_Vecchia, decreasing = TRUE), 25) ~ "Top 10 High",
      RMSE_Vecchia %in% head(sort(RMSE_Vecchia), 25) ~ "Top 10 Low",
      TRUE ~ "Normal"
    )
  )

T_num_plot <- ggplot(data, aes(x = T_size, y = RMSE_Vecchia)) +
  geom_line(color = "blue") + 
  geom_point(aes(color = Highlight_RMSE), size = 2) + 
  scale_color_manual(values = c("Top 10 High" = "red", "Top 10 Low" = "green", "Normal" = "blue")) +
  labs(title = "RMSE across Different Thinning Number", x = "Thinning Number", y = "RMSE") +
  theme(text = element_text(size = 16, face = "bold"),
        legend.position = "none") 

print(T_num_plot)

ggsave("T_num_plot.pdf", plot = T_num_plot, width = 10, height = 8, device = 'pdf')

