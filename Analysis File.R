                  #Descriptive Analysis
#Average ride length by user type
all_trips <- all_trips %>%
  group_by(member_casual) %>%
  summarise(avg_duration =
  mean(ride_length, na.rm = TRUE))

print(avg_ride)

#Rides by weekday and user type
weekday_summary <- all_trips %>%
  group_by(member_casual,days_of_week) %>%
  summarise(total_rides = n(),
            avg_duration =
  mean(ride_length, na.rm= TRUE))
print(weekday_summary)
