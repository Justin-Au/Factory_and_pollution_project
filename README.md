# The Effect of Illegal Factories on Water Pollution
This research project tries to analyze the damage brings by illegal factories on farmland in Taiwan. This is a serious problem since long ago. Factories illegally occuiped farmlands to reduce their costs. As they are not being regulated by the government, the inappropriate design of waste water discharge facilities would lead to severe disturbance on the quality of surface water and groundwater. This project uses regression models to evaluate the relationship between illegal factories and water pollution in 2017. Ordinary least squares (OLS) is adopted first. Then two-stage least squares (2SLS) with an instrumental variable (IV) is chosen to handle endogeneity. The results show that more illegally occupied farmland area by factories contributes to a higher concentration of arsenic, lead, manganese and zinc in river and groundwater.


## Background
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
8. Election database - Central Election Commission


## Data Cleaning
**Water quality data:**
- Each row represents the water quality in each township/district
- Observations without any data are dropped
- Variables with more than 10% of missing values are dropped
- The 'smaller than' sign is taken away, e.g. <0.001 is replaced by 0.001
- Data are measured in every quarter of the year, but we only concern an annual value here. We calculated the mean for each township/district

**For datasets 2-8:**
Datasets are collected from various sources, a new column *township/district code* is added to datasets 2-7. So, they could be appended with **Water quality data** by the *township/district code*


## Data Engineering
**Election database (instrumental variable):**  
Kuomintang (KMT) and Democratic Progressive Party (DPP) are the two main political parties in Taiwan. As DPP was the ruling party in 2017, we regarded DPP as 1 and other parties as 0. Then, we calculated the number of times that DPP had won county magistrates, city mayors or speical-municipality mayors in 2009/10 and 2014. This number was treated as the impact of the ruling party on illegally occupied farmland area.


## Map Plotting
**R - ggplot, rgdal, rgeos, maptools, RColorBrewer**

![alt text](https://github.com/auweiting/Factory_and_pollution_project/blob/master/map.png "The Distribution of Illegally Occupied Farmlands in Taiwan")


## Results
For both river and groundwater samples, the first stage result indicates that DPP has positive impact on illegally occupied farmland area. The significance of the estimation results (with p-value < 0.01) has proved that the IV is informative and we could use it to proceed the 2SLS estimation.  

For OLS, the result shows that illegally occupied farmland area significantly raises the concentrations of copper (Cu) and zinc (Zn) in river sample and the concentrations of arsenic (As) and Zn in groundwater sample. For 2SLS, the concentrations of As and Zn in both river and groundwater samples as well as the concentrations of lead (Pb) and manganese (Mn) in groundwater increases due to illegal factories.  

