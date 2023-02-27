library(tidyverse)
library(tidycensus)
library(sf)
library(spdep)
library(rgeos)
library(mapview)
library(spData)
library(stars) # rasterize


x = st_rasterize(nc.sids)

# home_value <- get_acs(
#   geography = "county",
#   state = "NH",
#   variables = "B25077_001",
#   survey = "acs1",
#   year = 2019,
#   geometry = T
# )

#saveRDS(home_value, "home_value.RDS")

storms_sf = st_as_sf(storms, coords = c("lat", "long"),
                     crs = "NAD27 (EPSG: 4267)")

storms_sf %>% group_by(name, year) %>% 
  mutate(orig = st_distance(geometry))
mapview(storms_sf[1:10,])

hugo = storms_sf %>% filter(name == "Hugo") 


storms_g = storms %>% group_by(name, year) %>% tally()

for(i in 1:10) {
  print ( st_distance(storms_sf$geometry[storms_g$n[i]:storms_g$n[i + 1]], storms_sf$geometry[storms_g$n[i]] ) )
}
