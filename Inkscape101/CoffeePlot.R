library(ggplot2)
library(tidyr)

# generate data (very experimental)
coffee_cups <- 0:10
goodness_NR <- c(0, 1, 2.5, 4, 4.5, 5, 5.5, 3, 1, 0, -3)
goodness_AS <- c(0, 0, 0, 0, 4, 5.5, 6.5, 8, 10, 10.5, 11)

df <- data.frame(
  coffee_cups = coffee_cups,
  Nataliya = goodness_NR,
  Andrew = goodness_AS
)

df_long <- pivot_longer(df, cols = c(Nataliya, Andrew),
                         names_to = "person", values_to = "goodness")

p <- ggplot(df_long, aes(x = coffee_cups, y = goodness, color = person)) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "black") +
  geom_line() +
  geom_point(size = 2) +
  scale_color_manual(values = c("Nataliya" = "#1f77b4", "Andrew" = "#d62728")) +
  labs(x = "Cups of Coffee (standard)",
       y = "How good I feel (normalized)",
       color = NULL) +
  theme_bw() +
  theme(
    legend.position = c(0.02, 0.98),
    legend.justification = c(0, 1),
    panel.grid.minor = element_blank()
  )

print(p)

# Save the figure as an .svg file
ggsave("CoffeePlotR.svg", plot = p, width = 7, height = 5)
