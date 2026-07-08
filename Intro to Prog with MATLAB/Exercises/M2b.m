%M2b;
%1. As of early 2018, Usain Bolt holds the world record in the men's 100-meter dash. It is 9.58 seconds. What was his average speed in km/h?  Assign the result to a variable called hundred.
%2. Kenyan Eliud Kipchoge set a new world record for men of 2:01:39 on September 16, 2018. Assign his average speed in km/h to the variable marathon. The marathon distance is 42.195 kilometers.

bolt_time_sec = 9.58
bolt_dist_m = 100 
bolt_dist_m_to_km = 100/1000 %converting the meters to kilometers
bolt_time_sec_to_hr = 9.58/(60*60) %converting the seconds to hour
bolt_speed = bolt_dist_m_to_km/bolt_time_sec_to_hr
hundred = bolt_speed


kip_time_min_to_hr = 1/60 %converting the minutes to hour
kip_time_sec_to_hr = 39/(60*60)%converting the seconds to hour
kip_time_hr = 2 + kip_time_min_to_hr + kip_time_sec_to_hr %adding all hour value
kip_dist_km = 42.195
kip_speed = 42.195/kip_time_hr

marathon = kip_speed
