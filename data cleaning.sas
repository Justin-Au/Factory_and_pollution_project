libname f2017 '~\data\';

proc means data=f2017.river noprint;
class code station_number;
output out=f2017.river_mean mean=;
run;

proc means data=f2017.river noprint;
class code station_number;
output out=f2017.river_mean mean=;
run;

proc freq data=f2017.gdwater;
table code;
run;

data f2017.river_townships_mean;
set f2017.river_mean;
if _TYPE_=0 then delete;
if _TYPE_=1 then delete;
if _TYPE_=3 then delete;
drop _TYPE_ _FREQ_ station_number;
run;

data f2017.river_stations_mean;
set f2017.river_mean;
if _TYPE_=0 then delete;
if _TYPE_=2 then delete;
if _TYPE_=1 then delete;
drop _TYPE_ _FREQ_;
run;

proc means data=f2017.river noprint;
class county;
output out=f2017.river_county_mean mean=;
run;

proc freq data=f2017.river_stations_mean;
table river_pollution_index;
run;

data f2017.river_stations_mean;
set f2017.river_stations_mean;
if river_pollution_index=. then delete;
run;

proc means data=f2017.gdwater noprint;
class code station_number;
output out=f2017.gdwater_mean mean=;
run;

data f2017.gdwater_townships_mean;
set f2017.gdwater_mean;
if _TYPE_=0 then delete;
if _TYPE_=1 then delete;
if _TYPE_=3 then delete;
drop _TYPE_ _FREQ_ station_number;
run;

data f2017.gdwater_stations_mean;
set f2017.gdwater_mean;
if _TYPE_=0 then delete;
if _TYPE_=2 then delete;
if _TYPE_=1 then delete;
drop _TYPE_ _FREQ_;
run;

proc means data=f2017.gdwater noprint;
class county;
output out=f2017.gdwater_county_mean mean=;
run;

proc freq data=f2017.gdwater_stations_mean;
table water_temperature;
run;

data f2017.gdwater_stations_mean;
set f2017.gdwater_stations_mean;
if water_temperature=. then delete;
drop sampling_date;
run;

proc means data=f2017.illegal noprint;
class code;
output out=f2017.illegal_area_sum sum=;
run;


proc means data=f2017.weather3 noprint;
class county townships;
output out=f2017.weather3_mean mean=;
run;

data f2017.weather_townships;
set f2017.weather3_mean;
if _TYPE_=0 or _TYPE_=1 or _TYPE_=2 then delete;
drop _TYPE_ _FREQ_ var1;
run;

data f2017.weather_county;
set f2017.weather3_mean;
if _TYPE_=0 or _TYPE_=1 or _TYPE_=3 then delete;
drop _TYPE_ _FREQ_ var1 code townships;
run;

proc sort data=f2017.Townships_indicator_2; by county townships; run;
proc sort data=f2017.townships_code; by county townships; run;

data f2017.Townships_indicator_2;

merge f2017.Townships_indicator_2(in=a) f2017.townships_code(in=b);
by county townships;
if a;
run;

data f2017.KMT14;
set f2017.election14;

where party in ("KMT");

run;

data f2017.DPP14;
set f2017.election14;

where party in ("DPP");

run;

proc freq data=f2017.KMT0506;
table code;
run;

proc sort data=f2017.Townships_indicator_2; by county townships; run;
proc sort data=f2017.townships_code; by county townships; run;

data f2017.Townships_indicator_2;

merge f2017.Townships_indicator_2(in=a) f2017.townships_code(in=b);
by county townships;
if a;
run;

proc sort data=f2017.income; by county townships; run;
proc sort data=f2017.townships_code; by county townships; run;

data f2017.income;

merge f2017.income(in=a) f2017.townships_code(in=b);
by county townships;
if a;
run;

proc means data=f2017.income noprint;
class code;
output out=f2017.income_sum sum=;
run;

data f2017.income_sum;
set f2017.income_sum;
if _TYPE_=0 then delete;
drop _TYPE_ _FREQ_ mean;
income_mean = sum/household_units;
run;

proc sort data=f2017.Pop_housing_2010; by county townships; run;
proc sort data=f2017.townships_code; by county townships; run;

data f2017.Pop_housing_2010;
merge f2017.Pop_housing_2010(in=a) f2017.townships_code(in=b);
by county townships;
if a;
drop county townships;
run;

proc freq data=f2017.medical_2017;
table code;
run;

proc sort data=f2017.townships_grading; by county townships; run;
proc sort data=f2017.townships_code; by county townships; run;

data f2017.townships_grading;
merge f2017.townships_grading(in=a) f2017.townships_code(in=b);
by county townships;
if a;

run;

proc sort data=f2017.death_2017; by county townships; run;
proc sort data=f2017.townships_code; by county townships; run;

data f2017.death_2017;
merge f2017.death_2017(in=a) f2017.townships_code(in=b);
by county townships;
if a;
drop county townships;
run;

proc sort data=f2017.medical_2017; by county townships; run;
proc sort data=f2017.townships_code; by county townships; run;

data f2017.medical_2017;
merge f2017.medical_2017(in=a) f2017.townships_code(in=b);
by county townships;
if a;
drop county townships;
run;

proc sort data=f2017.temp; by county townships; run;
proc sort data=f2017.townships_code; by county townships; run;

data f2017.temp;

merge f2017.temp(in=a) f2017.townships_code(in=b);
by county townships;
if a;
run;

proc freq data=f2017.temp noprint;
table code/out=f2017.temp_sum;
run;

data f2017.temp_sum;
set f2017.temp_sum;
drop Percent of Total Frequency;
run;

data f2017.temp_missing;
set f2017.temp;
if code~=. then delete;
run;
