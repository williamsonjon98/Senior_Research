library(dplyr)
load("C:/Users/willi/Downloads/ICPSR_37841-V1/ICPSR_37841/DS0001/37841-0001-Data.rda")

write.csv(MTF_2019, "C:\\Users\\willi\\OneDrive - Eastern Connecticut State University\\CSC450\\MTF.csv", row.names = TRUE)


MTF_2019<- da37841.0001
MTF_2019[1:5, 12]


View(MTF_2019[1:5, 12])

MTF_2019_1000<- MTF_2019[1:1000,]
MTF_2019_5000<- MTF_2019[1:5000,]

jj<- MTF_2019_1000 %>% select(11, 12, 7, 14, 144)
colnames(jj)
names(jj)[1]<- "Gender"
names(jj)[2]<- "Race"
names(jj)[3]<- "Region"
names(jj)[4]<- "Relationship"
names(jj)[5]<- "Weed"

jj$`Male/Female`<- gsub("(1) MALE:(1)", "Male", jj$`Male/Female`)
filter(jj, Gender == "(1) MALE:(1)")



