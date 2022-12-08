library(tidyverse)
earthquake <- read_csv("earthquakes.csv") |>
  filter(type != "Explosion") |>
  select(depth, magnitude) |>
  mutate(magnitude_rounded = round(magnitude)) |>
  group_by(magnitude_rounded) |>
  summarise(n_quakes = n())


ggplot(data = earthquake) +
  aes(x = magnitude_rounded, y = n_quakes) +
  labs(x = "Rounded magnitude", y = "Number of quakes", title = "Number of quakes per magnitude") +
  geom_bar(stat = "identity")