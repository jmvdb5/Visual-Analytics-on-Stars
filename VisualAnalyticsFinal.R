# Load libraries
library(devtools)
library(ggplot2)
library(dplyr)

# Install my personal package found at https://github.com/jmvdb5/starFunction
install_local("starFunctions_0.2.1.tar.gz")

# Load the package
library(starFunctions)

# Load data
data("starData")

# Clean Data
starData$Star.color <- trimws(starData$Star.color, which = "both", whitespace = " ")
starData$Star.color <- tolower(starData$Star.color)
starData$Star.color <- gsub("-", " ", starData$Star.color)
starData$Star.color <- gsub("whitish", "white", starData$Star.color)


# Plot Temperature vs Luminosity on a log scale
ggplot(starData, aes(Temperature, Luminosity, size = Radius, color = Star.color, alpha = 0.8)) +
  stat_smooth(aes(group = Star.type), method = lm) +
  geom_point() +
  geom_point(shape = 21, size = 2, color = "black")  +
  scale_color_manual(values = c("#0600b5", "#7a6bff", "#eba000", "#eb7100", "#f7cf2f", "#b50000", "#d3d1ff", "#fffab0", "#fff780", "yellow", "#a3a06d"), name = "Star Color")+
  scale_y_log10() +
  scale_x_log10() +
  guides(alpha = "none") +
  xlab("Temperature (K)") +
  labs(title = "Temperature vs Luminosity for Stars", caption = "Data source: https://www.kaggle.com/datasets/deepu1109/star-dataset") +
  theme(panel.grid.major = element_line(linewidth = 0.5, color = "gray80"),
        panel.grid.minor = element_line(linewidth = 0.25, color = "gray99"),
        panel.background = element_rect(fill = "gray50"))


# Plot Absolute Magnitude vs Radius on a log scale
ggplot(starData, aes(Absolute.Magnitude, Radius, size = Luminosity, color = Star.color, alpha = 0.9)) +
  stat_smooth(aes(group = Star.type), method = lm) +
  geom_point() +
  geom_point(shape = 21, size = 2, color = "black") +
  scale_color_manual(values = c("#0600b5", "#7a6bff", "#eba000", "#eb7100", "#f7cf2f", "#b50000", "#d3d1ff", "#fffab0", "#fff780", "yellow", "#a3a06d"), name = "Star Color") +
  scale_y_log10() +
  guides(alpha = "none") +
  ylab("Radius") +
  xlab("Absolute Magnitude") +
  labs(title = "Absolute Magnitude vs Radius", caption = "Data source: https://www.kaggle.com/datasets/deepu1109/star-dataset") +
  theme(panel.grid.major = element_line(linewidth = 0.5, color = "gray80"),
        panel.grid.minor = element_line(linewidth = 0.25, color = "gray99"),
        panel.background = element_rect(fill = "gray50"))
