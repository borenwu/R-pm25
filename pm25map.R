library(XML)
library(leafletCN)


url = htmlParse("http://www.pm25.in/rank", encoding="UTF-8") 
table = readHTMLTable(url, encoding="UTF-8", stringsAsFactors = F)[[1]]

# 整理数据并命名
dat = table[ , 2:3]
names(dat) = c("city","AQI")
dat$AQI = as.numeric(dat$AQI)

# 调用geojsonMap进行绘制
geojsonMap(dat, "city",
           popup =  paste0(dat$city, ":", dat$AQI),
           palette = "Reds", legendTitle = "AQI")