setwd('~/map')

library(ggplot2)        #plot
library(rgdal)          #handle shp for fortify()
library(rgeos)          #handle shp for fortify()
library(maptools)       #handle shp for readSgapeSpatial()
library(RColorBrewer)   #plotting adjustments

tw_new<-readOGR('TOWN_MOI_1071226.shp')     #geospatial vector data
head(tw_new,1)
names(tw_new)

tw_new.df<- fortify(tw_new,region = "TOWNID")     #transform to data.frame
tail(tw_new.df,20)

illegal_factories<-read.csv('illegal_factories2017_2.csv',encoding="UTF-8")     #illegally occupied area per township
head(illegal_factories)


finalplot<-merge(tw_new.df,illegal_factories,by.x='id',by.y='X.U.FEFF.TOWNID',all.x=T)
head(finalplot,10)


illegal_factories_map<-ggplot() +
  geom_polygon(data = finalplot, 
               aes(x = long, y = lat, 
                   group = group, 
                   fill = illegally_occupied_farmland_area), 
               color = "black", 
               size = 0.25) + 
  coord_map()+                                               #maintain the ratio of the map
  scale_fill_gradientn(
    colours = brewer.pal(5,"Reds"))+
  theme_void()+                                              #remove background
  labs(title="                       Illegally Occupied Farmland Area by Factories in Taiwan")

dev.off()

illegal_factories_map