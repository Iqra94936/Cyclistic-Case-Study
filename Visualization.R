 
#Number of rides by user type

ggplot(all_trips ,aes(x=member_casual,fill=member_casual))+
  geom_bar()+
  labs(title="Number of Rides by User Types")

#Rides by weekday
ggplot(weekday_summary,aes(x= days_of_week,y=total_rides,
                           fill=member_casual))+
  geom_col(position="dodge")+
  labs(title =" Rides by Weekday",x=
         "Day",y="Number of Rides")
#Average ride length by weekday
ggplot(weekday_summary,aes(x= days_of_week,y=total_rides,
                           fill=member_casual))+
  geom_col(position="dodge")+
  labs(title ="Average Rides Duration by Weekday",x=
         "Day",y="Minutes")