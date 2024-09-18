# load the tidyr pakage
library("tidyr")

# create a dataframe
class <- data.frame (
  Name = c("Anne", "John"),
  Math_score = c(95, 80),
  Eng_score = c(88, 86)
)

# pivot_longer
data_long <- class %>%           
  pivot_longer( 
    cols= c( starts_with ('Math'),
             starts_with ('Eng')),
    names_to = "Subject", 
    values_to = "Score"
  )

# view the long format
str(data_long)

# pivot wider
data_wide <- data_long %>%
  pivot_wider(
    names_from = Subject,
    values_from = Score
  )

# view the wide format
str(data_wide)

# using a separate()

# create a dataframe
Personal_details <- data.frame(
  Full_Name = c("Anne_Sabrina",     
                 "John_Carpenter"),
  Age = c(15, 16)
)

# use separate () to split Full_Name into First_Name and Last_Name
Personal_details_new <- Personal_details %>% separate(Full_Name, into = c("First_Name", "Last_Name"), sep = "_")
str(Personal_details_new)

# using a unite()

# use the unite() to combine the columns
Personal_details_combined <- Personal_details_new %>% 
  unite( Full_Name, First_Name, Last_Name, sep = "_")
str(Personal_details_combined)
