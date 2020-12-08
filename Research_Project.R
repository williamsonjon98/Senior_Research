library(dplyr)
library(ggplot2)
#start_time<- Sys.time()
load("C:/Users/willi/Downloads/ICPSR_37841-V1/ICPSR_37841/DS0001/37841-0001-Data.rda")
#$end_time<- Sys.time()
#end_time - start_time 

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

#MTF_recode_1000<- mutate(MTF_1000, Gender= recode(Gender, "'(1) MALE:(1)' = 'Male'" ))

#MTF_1000 %>% mutate ( Gender = ifelse(Gender=="(1) MALE:(1)", "Male", Gender), 
 #                     Gender = ifelse(Gender=="(2) FEMALE:(2)", "Female", Gender))
#MTF_1000 %>% mutate ( Gender = ifelse(Gender== "2", "Female", Gender))



write.csv(MTF_all, row.names = FALSE, "C:\\Users\\willi\\OneDrive - Eastern Connecticut State University\\CSC450\\MTF_all.csv")
write.csv(MTF_1000, row.names = FALSE, "C:\\Users\\willi\\OneDrive - Eastern Connecticut State University\\CSC450\\MTF_1000.csv")
write.csv(MTF_5000, row.names = FALSE, "C:\\Users\\willi\\OneDrive - Eastern Connecticut State University\\CSC450\\MTF_5000.csv")


n <- 100 # number of times to repeat

male_filter1 <- rep(NA,n) # this will store the times

for (i in 1:n) {
  
  t1 <- Sys.time()
  
  
  males<- filter(MTF_all, Gender == "(1) MALE:(1)") #filter operation
  nrow(males) #counting males 
  
  t2 <- Sys.time()
  
  male_filter1[i] <- t2 - t1
  
}

mean(male_filter1)# average 



male_filter2 <- rep(NA,n)
for (i in 1:n) {
  
  t1 <- Sys.time()
  
  
  males<- filter(MTF_5000, Gender == "(1) MALE:(1)")
  nrow(males)
  
  t2 <- Sys.time()
  
  male_filter2[i] <- t2 - t1
  
}


male_filter3 <- rep(NA,n)
for (i in 1:n) {
  
  t1 <- Sys.time()
  
  
  males<- filter(MTF_1000, Gender == "(1) MALE:(1)") 
  nrow(males)
  
  t2 <- Sys.time()
  
  male_filter3[i] <- t2 - t1
  
}
#############################################################################
#############################################################################

Vape18_all <- rep(NA,n)
for (i in 1:n) {
  
  t1 <- Sys.time()
  
  
  vape<- filter(MTF_all, Age =="(1) UNDER 18:(1)" & Vape == "(1) YES:(1)") %>%
    select(Student_id, Age, Region)
  
  t2 <- Sys.time()
  
  Vape18_all[i] <- t2 - t1
  
}

Vape18_5000 <- rep(NA,n)
for (i in 1:n) {
  
  t1 <- Sys.time()
  
  
  vape<- filter(MTF_5000, Age =="(1) UNDER 18:(1)" & Vape == "(1) YES:(1)") %>%
    select(Student_id, Age, Region)
  
  t2 <- Sys.time()
  
  Vape18_5000[i] <- t2 - t1
  
}

Vape18_1000 <- rep(NA,n)
for (i in 1:n) {
  
  t1 <- Sys.time()
  
  
  vape<- filter(MTF_1000, Age =="(1) UNDER 18:(1)" & Vape == "(1) YES:(1)") %>%
    select(Student_id, Age, Region)
  
  t2 <- Sys.time()
  
  Vape18_1000[i] <- t2 - t1
  
}

###########################################################################
##########################################################################


insertrow_all <- rep(NA,n)
for (i in 1:n) {
  
  t1 <- Sys.time()
  
  
  MTF_all<- MTF_all%>%add_row(Student_id = 12346, Responce_Type = "(0) PAPER:(0)", Region = "(3) SOUTH:(3)",
                              Age = "(1) UNDER 18:(1)", Gender = "(2) FEMALE:(2)", Race= "(3) HISPANIC:(3)", 
                              Martial_status = "(4) SINGLE:(4)", Vape = "(0) NO:(0)", Cigarette= "(1) YES: (1)",
                              Alcohol = "(2) YES:(2)")
  
  t2 <- Sys.time()
  
  insertrow_all[i] <- t2 - t1
  
}


insertrow_5000 <- rep(NA,n)
for (i in 1:n) {
  
  t1 <- Sys.time()
  
  
  MTF_5000<- MTF_5000%>%add_row(Student_id = 12346, Responce_Type = "(0) PAPER:(0)", Region = "(3) SOUTH:(3)",
                              Age = "(1) UNDER 18:(1)", Gender = "(2) FEMALE:(2)", Race= "(3) HISPANIC:(3)", 
                              Martial_status = "(4) SINGLE:(4)", Vape = "(0) NO:(0)", Cigarette= "(1) YES: (1)",
                              Alcohol = "(2) YES:(2)")
  
  t2 <- Sys.time()
  
  insertrow_5000[i] <- t2 - t1
  
}

insertrow_1000 <- rep(NA,n)
for (i in 1:n) {
  
  t1 <- Sys.time()
  
  
  MTF_1000<- MTF_1000%>%add_row(Student_id = 12346, Responce_Type = "(0) PAPER:(0)", Region = "(3) SOUTH:(3)",
                              Age = "(1) UNDER 18:(1)", Gender = "(2) FEMALE:(2)", Race= "(3) HISPANIC:(3)", 
                              Martial_status = "(4) SINGLE:(4)", Vape = "(0) NO:(0)", Cigarette= "(1) YES: (1)",
                              Alcohol = "(2) YES:(2)")
  
  t2 <- Sys.time()
  
  insertrow_1000[i] <- t2 - t1
  
}



filter(MTF_all, Age =="(1) UNDER 18:(1)" & Vape == "(1) YES:(1)") %>%
  select(Student_id, Age, Vape)

MTF_all<- MTF_all%>%add_row(Student_id = 12346, Responce_Type = "(0) PAPER:(0)", Region = "(3) SOUTH:(3)",
                  Age = "(1) UNDER 18:(1)", Gender = "(2) FEMALE:(2)", Race= "(3) HISPANIC:(3)", 
                  Martial_status = "(4) SINGLE:(4)", Vape = "(0) NO:(0)", Cigarette= "(1) YES: (1)",
                  Alcohol = "(2) YES:(2)")
MTF_all[13714,]
############################################################




