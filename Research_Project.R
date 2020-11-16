library(dplyr)
start_time<- Sys.time()
load("C:/Users/willi/Downloads/ICPSR_37841-V1/ICPSR_37841/DS0001/37841-0001-Data.rda")
end_time<- Sys.time()
end_time - start_time 

MTF_2019<- da37841.0001

MTF_all<- MTF_2019 %>% select(2,5, 7, 10, 11, 12, 14, 143, 189, 70)
names(MTF_all)[1]<- "Student_id"
names(MTF_all)[2]<- "Responce_Type"
names(MTF_all)[3]<- "Region"
names(MTF_all)[4]<- "Age"
names(MTF_all)[5]<- "Gender"
names(MTF_all)[6]<- "Race"
names(MTF_all)[7]<- "Martial_status"
names(MTF_all)[8]<- "Vape"
names(MTF_all)[9]<- "Cigarette"
names(MTF_all)[10]<- "Alcohol"
colnames(MTF_all)

MTF_1000<- MTF_all[1:1000,]
MTF_5000<- MTF_all[1:5000,]

Males_filter<- function(){
  
  start_time1<- Sys.time()
  
  males<- filter(MTF_all, Gender == "(1) MALE:(1)")
  nrow(males)
  
  end_time1<- Sys.time()
  end_time1 - start_time1 
}

Males_filter_1000<- function(){
  
  start_time2<- Sys.time()
  
  males<- filter(MTF_1000, Gender == "(1) MALE:(1)")
  nrow(males)
  
  end_time2<- Sys.time()
  end_time2 - start_time2
}

Males_filter_5000<- function(){
  
  start_time3<- Sys.time()
  
  males<- filter(MTF_5000, Gender == "(1) MALE:(1)")
  nrow(males)
  
  end_time3<- Sys.time()
  end_time3 - start_time3 
}

write.csv(MTF_all, "C:\\Users\\willi\\OneDrive - Eastern Connecticut State University\\CSC450\\Senior_Research\\MTF_Mydata.csv", row.names = TRUE)











