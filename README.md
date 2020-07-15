# The Effect of Illegal Factories on Water Pollution
This research project tries to analyze the damage brings by illegal factories on farmland in Taiwan. This is a serious problem since long ago. Factories illegally occuiped farmlands to reduce their costs. As they are not being regulated by the government, the inappropriate design of waste water discharge facilities would lead to severe disturbance on the quality of surface water and groundwater. This project uses regression models to evaluate the relationship between illegal factories and water pollution. Ordinary least squares is adopted first. Then two-stage least squares with an instrumental variable is chosen to handle endogeneity. The results show that more illegally occupied farmland area by factories contributes to a higher concentration of arsenic, lead, manganese and zinc in river and groundwater.

## Background
**Web Scraping:** Python - BeautifulSoup  
**Map Plotting:** R - ggplot, rgdal, rgeos, maptools, RColorBrewer  
**Statistical Analysis:** SAS, STATA, Excel  
**Datasets:** 
1. Water quality data of river and groundwater - Environmental Protection Administration
2. Agriculture and Farmland Resources Survey - Council of Agriculture
3. The Factory Operation Census - Department of Statistics
4. Population and Housing Census - Directorate General of Budget, Accounting and Statistics
5. Census of Agricultural, Forestry, Fishery and Animal Husbandry - Directorate General of Budget, Accounting and Statistics
6. Declaration of Income Tax Returns from Fiscal Information Agency - Ministry of Finance
7. Historical weather records - Central Weather Bureau


## Web Scraping
**Historical weather records:**


## Data Cleaning
**Water quality data:**
1. Observations without any data are dropped
2. Variables with more than 10% of missing values are dropped
3. The 'smaller than' sign is taken away, e.g. <0.001 is replaced by 0.001
4. Data are measured in every quarter of the year, but we only concern an annual value here. The means of every variable are calculated

5. Datasets are collected from various sources, so they are appended to **Water quality data** by the variable *township/district code*


## Map Plotting

![alt text](https://github.com/auweiting/Factory_and_pollution_project/blob/master/map.png "The Distribution of Illegally Occupied Farmlands in Taiwan")




## Modelling

<!--
![alt text](https://github.com/auweiting/Factory_and_pollution_project/blob/master/illegal_factories_num.png "Total Number of Illegal Factories")
![alt text](https://github.com/auweiting/Factory_and_pollution_project/blob/master/sample_description_river.png "Sample Description of River Sample")
![alt text](https://github.com/auweiting/Factory_and_pollution_project/blob/master/sample_description_gdwater.png "Sample Description of Groundwater Sample") -->


## Results

<!--
![alt text](https://github.com/auweiting/Factory_and_pollution_project/blob/master/first_stage_river.png "First Stage Result of River Sample")
![alt text](https://github.com/auweiting/Factory_and_pollution_project/blob/master/ols_2sls_river.png "The Effect on Dependent Variables of River Sample")
![alt text](https://github.com/auweiting/Factory_and_pollution_project/blob/master/first_stage_gdwater.png "First Stage Result of Groundwater Sample")
![alt text](https://github.com/auweiting/Factory_and_pollution_project/blob/master/ols_2sls_gdwater.png "The Effect on Dependent Variables of Groundwater Sample") -->

