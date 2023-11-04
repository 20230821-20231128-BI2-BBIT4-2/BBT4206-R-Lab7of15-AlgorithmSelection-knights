Business Intelligence Project
================
<Knights>
<Specify the date when you submitted the lab>

- [Student Details](#student-details)
- [Setup Chunk](#setup-chunk)
- [Understanding the Dataset (Exploratory Data Analysis
  (EDA))](#understanding-the-dataset-exploratory-data-analysis-eda)
  - [Loading the Dataset](#loading-the-dataset)
    - [Source:](#source)

# Student Details

|                                           |                      |
|-------------------------------------------|----------------------|
| **Student ID Number** && **Student Name** |                      |
| 134834 - Emmanuel Kasio                   | 135356 - Ann Kigera  |
| 122883 - Michelle Guya                    | 136301 - Ian Nyameta |
| 135230 - Peter Aringo                     |                      |

**BBIT 4.2 Group** \| B \|  
**BI Project Group Name/ID (if applicable)** \| Knights \|

# Setup Chunk

**Note:** the following KnitR options have been set as the global
defaults: <BR>
`knitr::opts_chunk$set(echo = TRUE, warning = FALSE, eval = TRUE, collapse = FALSE, tidy = TRUE)`.

More KnitR options are documented here
<https://bookdown.org/yihui/rmarkdown-cookbook/chunk-options.html> and
here <https://yihui.org/knitr/options/>.

# Understanding the Dataset (Exploratory Data Analysis (EDA))

## Loading the Dataset

### Source:

The dataset that was used can be downloaded here: *\<<a
href="https://docs.google.com/spreadsheets/d/1LwVZIklzc0JvyVPQul9CxGnu2spipZjXaCO_Zv8H2sc/edit#gid=2007896421\"
class="uri">https://docs.google.com/spreadsheets/d/1LwVZIklzc0JvyVPQul9CxGnu2spipZjXaCO_Zv8H2sc/edit#gid=2007896421\</a>\>*

``` r
# The code was used to load the dataset;

Student_Performance_Dataset <-
  readr::read_csv(
    "Student_Performance_Dataset.csv", # nolint
    col_types =
      readr::cols(
        class_group =
          readr::col_factor(levels = c("A", "B", "C")),
        gender = readr::col_factor(levels = c("1", "0")),
        YOB = readr::col_date(format = "%Y"),
        regret_choosing_bi =
          readr::col_factor(levels = c("1", "0")),
        drop_bi_now =
          readr::col_factor(levels = c("1", "0")),
        motivator =
          readr::col_factor(levels = c("1", "0")),
        read_content_before_lecture =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        anticipate_test_questions =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        answer_rhetorical_questions =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        find_terms_I_do_not_know =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        copy_new_terms_in_reading_notebook =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        take_quizzes_and_use_results =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        reorganise_course_outline =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        write_down_important_points =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        space_out_revision =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        studying_in_study_group =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        schedule_appointments =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        goal_oriented =
          readr::col_factor(levels =
                              c("1", "0")),
        spaced_repetition =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        testing_and_active_recall =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        interleaving =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        categorizing =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        retrospective_timetable =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        cornell_notes =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        sq3r = readr::col_factor(levels =
                                   c("1", "2", "3", "4")),
        commute = readr::col_factor(levels =
                                      c("1", "2",
                                        "3", "4")),
        study_time = readr::col_factor(levels =
                                         c("1", "2",
                                           "3", "4")),
        repeats_since_Y1 = readr::col_integer(),
        paid_tuition = readr::col_factor(levels =
                                           c("0", "1")),
        free_tuition = readr::col_factor(levels =
                                           c("0", "1")),
        extra_curricular = readr::col_factor(levels =
                                               c("0", "1")),
        sports_extra_curricular =
          readr::col_factor(levels = c("0", "1")),
        exercise_per_week = readr::col_factor(levels =
                                                c("0", "1",
                                                  "2",
                                                  "3")),
        meditate = readr::col_factor(levels =
                                       c("0", "1",
                                         "2", "3")),
        pray = readr::col_factor(levels =
                                   c("0", "1",
                                     "2", "3")),
        internet = readr::col_factor(levels =
                                       c("0", "1")),
        laptop = readr::col_factor(levels = c("0", "1")),
        family_relationships =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        friendships = readr::col_factor(levels =
                                          c("1", "2", "3",
                                            "4", "5")),
        romantic_relationships =
          readr::col_factor(levels =
                              c("0", "1", "2", "3", "4")),
        spiritual_wellnes =
          readr::col_factor(levels = c("1", "2", "3",
                                       "4", "5")),
        financial_wellness =
          readr::col_factor(levels = c("1", "2", "3",
                                       "4", "5")),
        health = readr::col_factor(levels = c("1", "2",
                                              "3", "4",
                                              "5")),
        day_out = readr::col_factor(levels = c("0", "1",
                                               "2", "3")),
        night_out = readr::col_factor(levels = c("0",
                                                 "1", "2",
                                                 "3")),
        alcohol_or_narcotics =
          readr::col_factor(levels = c("0", "1", "2", "3")),
        mentor = readr::col_factor(levels = c("0", "1")),
        mentor_meetings = readr::col_factor(levels =
                                              c("0", "1",
                                                "2", "3")),
        `Attendance_Waiver_Granted: 1 = Yes, 0 = No` =
          readr::col_factor(levels = c("0", "1")),
        GRADE = readr::col_factor(levels =
                                    c("A", "B", "C", "D",
                                      "E"))),
    locale = readr::locale())
```

    ## Warning: The following named parsers don't match the column names:
    ## Attendance_Waiver_Granted: 1 = Yes, 0 = No

``` r
## This code was used to Install and Load the Required Packages

## readr ----
if (require("readr")) {
  require("readr")
} else {
  install.packages("readr", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## naniar ----
if (require("naniar")) {
  require("naniar")
} else {
  install.packages("naniar", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## ggplot2 ----
if (require("ggplot2")) {
  require("ggplot2")
} else {
  install.packages("ggplot2", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## corrplot ----
if (require("corrplot")) {
  require("corrplot")
} else {
  install.packages("corrplot", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## ggcorrplot ----
if (require("ggcorrplot")) {
  require("ggcorrplot")
} else {
  install.packages("ggcorrplot", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## caret ----
if (require("caret")) {
  require("caret")
} else {
  install.packages("caret", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## dplyr ----
if (require("dplyr")) {
  require("dplyr")
} else {
  install.packages("dplyr", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

``` r
# This code was used to Check for Missing Data and Address it ----

# Are there missing values in the dataset?
any_na(Student_Performance_Dataset)
```

    ## [1] TRUE

``` r
# How many?
n_miss(Student_Performance_Dataset)
```

    ## [1] 148

``` r
# What is the proportion of missing data in the entire dataset?
prop_miss(Student_Performance_Dataset)
```

    ## [1] 0.01465347

``` r
# What is the number and percentage of missing values grouped by
# each variable?
miss_var_summary(Student_Performance_Dataset)
```

    ## # A tibble: 100 × 3
    ##    variable                                                      n_miss pct_miss
    ##    <chr>                                                          <int>    <dbl>
    ##  1 CAT_2                                                             31    30.7 
    ##  2 Lab_4_Linear_Discriminant_Analysis                                18    17.8 
    ##  3 Quiz 5 on Concept 5 (Dashboarding) x/10                           12    11.9 
    ##  4 Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) …      9     8.91
    ##  5 Quiz_4_Concept_4                                                   6     5.94
    ##  6 Lab 2 - 2.e. -  (Linear Regression using Gradient Descent) x…      6     5.94
    ##  7 CAT_1                                                              4     3.96
    ##  8 EXAM                                                               4     3.96
    ##  9 Lab_1_Simple_Linear_Regression                                     3     2.97
    ## 10 Quiz 3 on Concept 3 (Linear) x/15                                  2     1.98
    ## # ℹ 90 more rows

``` r
# Which variables contain the most missing values?
gg_miss_var(Student_Performance_Dataset)
```

![](Lab7b-Submission_files/figure-gfm/Your%20Third%20Code%20Chunk-1.png)<!-- -->

``` r
# Which combinations of variables are missing together?
gg_miss_upset(Student_Performance_Dataset)
```

![](Lab7b-Submission_files/figure-gfm/Your%20Third%20Code%20Chunk-2.png)<!-- -->

``` r
# Where are missing values located (the shaded regions in the plot)?
vis_miss(Student_Performance_Dataset) +
  theme(axis.text.x = element_text(angle = 80))
```

![](Lab7b-Submission_files/figure-gfm/Your%20Third%20Code%20Chunk-3.png)<!-- -->

``` r
##Remove the observations with missing values
# as follows:
Student_Performance_removed_obs <-
  Student_Performance_Dataset %>%
  dplyr::filter(complete.cases(.))

## Verify the changes made
# The initial dataset had 21,120 observations and 16 variables
dim(Student_Performance_Dataset)
```

    ## [1] 101 100

``` r
# The filtered dataset has 16,205 observations and 16 variables
dim(Student_Performance_removed_obs)
```

    ## [1]  51 100

``` r
# Are there missing values in the dataset?
any_na(Student_Performance_removed_obs)
```

    ## [1] FALSE

``` r
# This code was used to Perform EDA and Feature Selection ----
## Compute the correlations between variables ----
# We identify the correlated variables because it is these correlated variables
# that can then be used to identify the clusters.

# Create a correlation matrix
# Using Option 1: Basic Table
cor(Student_Performance_removed_obs[, c(90,88,89,87,86,91,92,93,94,96,97,98,99)]) %>%
  View()

View(Student_Performance_removed_obs)

# Using Option 3: Fancy Plot using ggplot2
corr_matrix <- cor(Student_Performance_removed_obs[, c(90,88,89,87,86,91,92,93,94,96,97,98,99)])

p <- ggplot2::ggplot(data = reshape2::melt(corr_matrix),
                     ggplot2::aes(Var1, Var2, fill = value)) +
  ggplot2::geom_tile() +
  ggplot2::geom_text(ggplot2::aes(label = label_wrap(label, width = 10)),
                     size = 4) +
  ggplot2::theme_minimal() +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, hjust = 1))


## Plot the scatter plots ----
# A scatter plot to show the Total Grade against Coursework_TOTAL

ggplot(Student_Performance_removed_obs,
       aes(TOTAL, Coursework_TOTAL)) +
  geom_point(alpha = 0.5) +
  xlab("Total") +
  ylab("Coursework_Total")
```

![](Lab7b-Submission_files/figure-gfm/Your%20Fourth%20Code%20Chunk-1.png)<!-- -->

``` r
# A scatter plot to show the Total Grade against LabWork

ggplot(Student_Performance_removed_obs,
       aes(TOTAL, LabWork)) +
  geom_point(alpha = 0.5) +
  xlab("Total") +
  ylab("LabWork")
```

![](Lab7b-Submission_files/figure-gfm/Your%20Fourth%20Code%20Chunk-2.png)<!-- -->

``` r
# A scatter plot to show the Total Grade against Absenteeism_Percentage

ggplot(Student_Performance_removed_obs,
       aes(TOTAL, Absenteeism_Percentage)) +
  geom_point(alpha = 0.5) +
  xlab("Total") +
  ylab("Absenteeism_Percentage")
```

![](Lab7b-Submission_files/figure-gfm/Your%20Fourth%20Code%20Chunk-3.png)<!-- -->

``` r
# A scatter plot to show the Total Grade against Quizzes_and_Bonus_Marks

ggplot(Student_Performance_removed_obs,
       aes(TOTAL, Quizzes_and_Bonus_Marks)) +
  geom_point(alpha = 0.5) +
  xlab("Total") +
  ylab("Quizzes_and_Bonus_Marks")
```

![](Lab7b-Submission_files/figure-gfm/Your%20Fourth%20Code%20Chunk-4.png)<!-- -->

``` r
# A scatter plot to show the Total Grade against pray

ggplot(Student_Performance_removed_obs,
       aes(GRADE, pray)) +
  geom_point(alpha = 0.5) +
  xlab("GRADE") +
  ylab("pray")
```

![](Lab7b-Submission_files/figure-gfm/Your%20Fourth%20Code%20Chunk-5.png)<!-- -->

``` r
## Transform the data ----
# Carry out data transformation to help standardize the data making it easier to compare
# multiple variables.

summary(Student_Performance_removed_obs)
```

    ##  class_group gender      YOB             regret_choosing_bi drop_bi_now
    ##  A:10        1:31   Min.   :1999-01-01   1: 1               1: 1       
    ##  B:14        0:20   1st Qu.:2000-01-01   0:50               0:50       
    ##  C:27               Median :2001-01-01                                 
    ##                     Mean   :2000-12-17                                 
    ##                     3rd Qu.:2002-01-01                                 
    ##                     Max.   :2003-01-01                                 
    ##  motivator read_content_before_lecture anticipate_test_questions
    ##  1:42      1: 6                        1: 3                     
    ##  0: 9      2: 9                        2: 2                     
    ##            3:23                        3:12                     
    ##            4: 9                        4:23                     
    ##            5: 4                        5:11                     
    ##                                                                 
    ##  answer_rhetorical_questions find_terms_I_do_not_know
    ##  1: 1                        1: 3                    
    ##  2: 5                        2: 1                    
    ##  3:12                        3:11                    
    ##  4:23                        4:20                    
    ##  5:10                        5:16                    
    ##                                                      
    ##  copy_new_terms_in_reading_notebook take_quizzes_and_use_results
    ##  1: 3                               1: 3                        
    ##  2: 5                               2: 4                        
    ##  3:10                               3: 6                        
    ##  4:16                               4:15                        
    ##  5:17                               5:23                        
    ##                                                                 
    ##  reorganise_course_outline write_down_important_points space_out_revision
    ##  1: 2                      1: 2                        1: 3              
    ##  2:10                      2: 4                        2: 8              
    ##  3:12                      3: 6                        3:16              
    ##  4:17                      4:18                        4:14              
    ##  5:10                      5:21                        5:10              
    ##                                                                          
    ##  studying_in_study_group schedule_appointments goal_oriented spaced_repetition
    ##  1:16                    1:21                  1: 9          1: 6             
    ##  2:10                    2:17                  0:42          2:12             
    ##  3:11                    3: 9                                3:29             
    ##  4: 9                    4: 2                                4: 4             
    ##  5: 5                    5: 2                                                 
    ##                                                                               
    ##  testing_and_active_recall interleaving categorizing retrospective_timetable
    ##  1: 1                      1: 9         1: 4         1: 7                   
    ##  2: 5                      2:21         2:15         2:17                   
    ##  3:28                      3:19         3:25         3:21                   
    ##  4:17                      4: 2         4: 7         4: 6                   
    ##                                                                             
    ##                                                                             
    ##  cornell_notes sq3r   commute study_time repeats_since_Y1 paid_tuition
    ##  1: 9          1:10   1: 9    1:20       Min.   :0.000    0:47        
    ##  2:13          2:15   2:12    2:22       1st Qu.:0.000    1: 4        
    ##  3:18          3:15   3:17    3: 6       Median :0.000                
    ##  4:11          4:11   4:13    4: 3       Mean   :1.314                
    ##                                          3rd Qu.:2.000                
    ##                                          Max.   :7.000                
    ##  free_tuition extra_curricular sports_extra_curricular exercise_per_week
    ##  0:39         0:31             0:37                    0: 8             
    ##  1:12         1:20             1:14                    1:28             
    ##                                                        2:13             
    ##                                                        3: 2             
    ##                                                                         
    ##                                                                         
    ##  meditate pray   internet laptop family_relationships friendships
    ##  0:25     0: 3   0: 4     0: 0   1: 0                 1: 0       
    ##  1:19     1:10   1:47     1:51   2: 1                 2: 0       
    ##  2: 5     2: 9                   3: 9                 3:13       
    ##  3: 2     3:29                   4:18                 4:26       
    ##                                  5:23                 5:12       
    ##                                                                  
    ##  romantic_relationships spiritual_wellnes financial_wellness health day_out
    ##  0:34                   1: 1              1: 3               1: 0   0:13   
    ##  1: 0                   2: 2              2: 9               2: 1   1:37   
    ##  2: 1                   3:17              3:20               3:11   2: 1   
    ##  3:10                   4:19              4:12               4:16   3: 0   
    ##  4: 6                   5:12              5: 7               5:23          
    ##                                                                            
    ##  night_out alcohol_or_narcotics mentor mentor_meetings
    ##  0:32      0:41                 0:31   0:30           
    ##  1:18      1: 9                 1:20   1:12           
    ##  2: 1      2: 0                        2: 7           
    ##  3: 0      3: 1                        3: 2           
    ##                                                       
    ##                                                       
    ##  A - 1. I am enjoying the subject A - 2. Classes start and end on time
    ##  Min.   :3.000                    Min.   :3.000                       
    ##  1st Qu.:4.000                    1st Qu.:4.000                       
    ##  Median :4.000                    Median :5.000                       
    ##  Mean   :4.431                    Mean   :4.667                       
    ##  3rd Qu.:5.000                    3rd Qu.:5.000                       
    ##  Max.   :5.000                    Max.   :5.000                       
    ##  A - 3. The learning environment is participative, involves learning by doing and is group-based
    ##  Min.   :3.000                                                                                  
    ##  1st Qu.:4.000                                                                                  
    ##  Median :4.000                                                                                  
    ##  Mean   :4.275                                                                                  
    ##  3rd Qu.:5.000                                                                                  
    ##  Max.   :5.000                                                                                  
    ##  A - 4. The subject content is delivered according to the course outline and meets my expectations
    ##  Min.   :3.000                                                                                    
    ##  1st Qu.:4.000                                                                                    
    ##  Median :5.000                                                                                    
    ##  Mean   :4.686                                                                                    
    ##  3rd Qu.:5.000                                                                                    
    ##  Max.   :5.000                                                                                    
    ##  A - 5. The topics are clear and logically developed
    ##  Min.   :2.000                                      
    ##  1st Qu.:4.000                                      
    ##  Median :5.000                                      
    ##  Mean   :4.686                                      
    ##  3rd Qu.:5.000                                      
    ##  Max.   :5.000                                      
    ##  A - 6. I am developing my oral and writing skills
    ##  Min.   :1.000                                    
    ##  1st Qu.:4.000                                    
    ##  Median :4.000                                    
    ##  Mean   :4.039                                    
    ##  3rd Qu.:5.000                                    
    ##  Max.   :5.000                                    
    ##  A - 7. I am developing my reflective and critical reasoning skills
    ##  Min.   :2.000                                                     
    ##  1st Qu.:4.000                                                     
    ##  Median :4.000                                                     
    ##  Mean   :4.333                                                     
    ##  3rd Qu.:5.000                                                     
    ##  Max.   :5.000                                                     
    ##  A - 8. The assessment methods are assisting me to learn
    ##  Min.   :1.000                                          
    ##  1st Qu.:4.000                                          
    ##  Median :5.000                                          
    ##  Mean   :4.549                                          
    ##  3rd Qu.:5.000                                          
    ##  Max.   :5.000                                          
    ##  A - 9. I receive relevant feedback
    ##  Min.   :3.00                      
    ##  1st Qu.:4.00                      
    ##  Median :5.00                      
    ##  Mean   :4.51                      
    ##  3rd Qu.:5.00                      
    ##  Max.   :5.00                      
    ##  A - 10. I read the recommended readings and notes
    ##  Min.   :3.000                                    
    ##  1st Qu.:4.000                                    
    ##  Median :5.000                                    
    ##  Mean   :4.549                                    
    ##  3rd Qu.:5.000                                    
    ##  Max.   :5.000                                    
    ##  A - 11. I use the eLearning material posted
    ##  Min.   :3.000                              
    ##  1st Qu.:4.500                              
    ##  Median :5.000                              
    ##  Mean   :4.706                              
    ##  3rd Qu.:5.000                              
    ##  Max.   :5.000                              
    ##  B - 1. Concept 1 of 6: Principles of Business Intelligence and the DataOps Philosophy
    ##  Min.   :1.000                                                                        
    ##  1st Qu.:4.000                                                                        
    ##  Median :4.000                                                                        
    ##  Mean   :4.333                                                                        
    ##  3rd Qu.:5.000                                                                        
    ##  Max.   :5.000                                                                        
    ##  B - 2. Concept 3 of 6: Linear Algorithms for Predictive Analytics
    ##  Min.   :2                                                        
    ##  1st Qu.:4                                                        
    ##  Median :4                                                        
    ##  Mean   :4                                                        
    ##  3rd Qu.:5                                                        
    ##  Max.   :5                                                        
    ##  C - 2. Quizzes at the end of each concept
    ##  Min.   :2.00                             
    ##  1st Qu.:4.00                             
    ##  Median :5.00                             
    ##  Mean   :4.49                             
    ##  3rd Qu.:5.00                             
    ##  Max.   :5.00                             
    ##  C - 3. Lab manuals that outline the steps to follow during the labs
    ##  Min.   :3.000                                                      
    ##  1st Qu.:4.000                                                      
    ##  Median :5.000                                                      
    ##  Mean   :4.608                                                      
    ##  3rd Qu.:5.000                                                      
    ##  Max.   :5.000                                                      
    ##  C - 4. Required lab work submissions at the end of each lab manual that outline the activity to be done on your own
    ##  Min.   :3.000                                                                                                      
    ##  1st Qu.:4.000                                                                                                      
    ##  Median :5.000                                                                                                      
    ##  Mean   :4.588                                                                                                      
    ##  3rd Qu.:5.000                                                                                                      
    ##  Max.   :5.000                                                                                                      
    ##  C - 5. Supplementary videos to watch
    ##  Min.   :1.000                       
    ##  1st Qu.:4.000                       
    ##  Median :4.000                       
    ##  Mean   :4.078                       
    ##  3rd Qu.:5.000                       
    ##  Max.   :5.000                       
    ##  C - 6. Supplementary podcasts to listen to
    ##  Min.   :1.000                             
    ##  1st Qu.:3.500                             
    ##  Median :4.000                             
    ##  Mean   :4.039                             
    ##  3rd Qu.:5.000                             
    ##  Max.   :5.000                             
    ##  C - 7. Supplementary content to read C - 8. Lectures slides
    ##  Min.   :1.000                        Min.   :2.000         
    ##  1st Qu.:3.000                        1st Qu.:5.000         
    ##  Median :4.000                        Median :5.000         
    ##  Mean   :4.118                        Mean   :4.667         
    ##  3rd Qu.:5.000                        3rd Qu.:5.000         
    ##  Max.   :5.000                        Max.   :5.000         
    ##  C - 9. Lecture notes on some of the lecture slides
    ##  Min.   :3.000                                     
    ##  1st Qu.:4.000                                     
    ##  Median :5.000                                     
    ##  Mean   :4.647                                     
    ##  3rd Qu.:5.000                                     
    ##  Max.   :5.000                                     
    ##  C - 10. The quality of the lectures given (quality measured by the breadth (the full span of knowledge of a subject) and depth (the extent to which specific topics are focused upon, amplified, and explored) of learning - NOT quality measured by how fun/comical/lively the lectures are)
    ##  Min.   :2.00                                                                                                                                                                                                                                                                                 
    ##  1st Qu.:4.00                                                                                                                                                                                                                                                                                 
    ##  Median :5.00                                                                                                                                                                                                                                                                                 
    ##  Mean   :4.51                                                                                                                                                                                                                                                                                 
    ##  3rd Qu.:5.00                                                                                                                                                                                                                                                                                 
    ##  Max.   :5.00                                                                                                                                                                                                                                                                                 
    ##  C - 11. The division of theory and practice such that most of the theory is done during the recorded online classes and most of the practice is done during the physical classes
    ##  Min.   :2.00                                                                                                                                                                    
    ##  1st Qu.:4.00                                                                                                                                                                    
    ##  Median :5.00                                                                                                                                                                    
    ##  Mean   :4.51                                                                                                                                                                    
    ##  3rd Qu.:5.00                                                                                                                                                                    
    ##  Max.   :5.00                                                                                                                                                                    
    ##  C - 12. The recordings of online classes
    ##  Min.   :2.000                           
    ##  1st Qu.:4.000                           
    ##  Median :5.000                           
    ##  Mean   :4.333                           
    ##  3rd Qu.:5.000                           
    ##  Max.   :5.000                           
    ##  D - 1. Write two things you like about the teaching and learning in this unit so far.
    ##  Length:51                                                                            
    ##  Class :character                                                                     
    ##  Mode  :character                                                                     
    ##                                                                                       
    ##                                                                                       
    ##                                                                                       
    ##  D - 2. Write at least one recommendation to improve the teaching and learning in this unit (for the remaining weeks in the semester)
    ##  Length:51                                                                                                                           
    ##  Class :character                                                                                                                    
    ##  Mode  :character                                                                                                                    
    ##                                                                                                                                      
    ##                                                                                                                                      
    ##                                                                                                                                      
    ##  Evaluation_Rating Average Level of Learning Attained Rating
    ##  Min.   :2.909     Min.   :2.000                            
    ##  1st Qu.:4.318     1st Qu.:4.000                            
    ##  Median :4.545     Median :4.000                            
    ##  Mean   :4.494     Mean   :4.167                            
    ##  3rd Qu.:4.818     3rd Qu.:4.500                            
    ##  Max.   :5.000     Max.   :5.000                            
    ##  Average Pedagogical Strategy Effectiveness Rating
    ##  Min.   :3.182                                    
    ##  1st Qu.:4.091                                    
    ##  Median :4.545                                    
    ##  Mean   :4.417                                    
    ##  3rd Qu.:4.864                                    
    ##  Max.   :5.000                                    
    ##  Project: Section 1-4: (20%) x/10 Project: Section 5-11: (50%) x/10
    ##  Min.   : 0.000                   Min.   : 0.000                   
    ##  1st Qu.: 7.900                   1st Qu.: 7.000                   
    ##  Median : 9.000                   Median : 8.000                   
    ##  Mean   : 8.343                   Mean   : 7.565                   
    ##  3rd Qu.: 9.000                   3rd Qu.: 8.850                   
    ##  Max.   :10.000                   Max.   :10.000                   
    ##  Project: Section 12: (30%) x/5 Project: (10%): x/30 x 100 TOTAL
    ##  Min.   :0.000                  Min.   :  0.00                  
    ##  1st Qu.:0.000                  1st Qu.: 65.20                  
    ##  Median :0.000                  Median : 70.00                  
    ##  Mean   :1.663                  Mean   : 70.28                  
    ##  3rd Qu.:3.500                  3rd Qu.: 80.00                  
    ##  Max.   :5.000                  Max.   :100.00                  
    ##  Quiz_1_Concept_1 Quiz 3 on Concept 3 (Linear) x/15 Quiz_4_Concept_4
    ##  Min.   : 6.25    Min.   : 4.000                    Min.   : 3.00   
    ##  1st Qu.:12.18    1st Qu.: 7.000                    1st Qu.:11.59   
    ##  Median :15.50    Median :10.000                    Median :15.50   
    ##  Mean   :17.21    Mean   : 9.824                    Mean   :15.10   
    ##  3rd Qu.:20.11    3rd Qu.:12.000                    3rd Qu.:18.75   
    ##  Max.   :31.25    Max.   :15.000                    Max.   :22.00   
    ##  Quiz 5 on Concept 5 (Dashboarding) x/10 Quizzes_and_Bonus_Marks
    ##  Min.   : 1.670                          Min.   :31.86          
    ##  1st Qu.: 5.670                          1st Qu.:48.69          
    ##  Median : 6.670                          Median :61.39          
    ##  Mean   : 6.841                          Mean   :61.98          
    ##  3rd Qu.: 8.000                          3rd Qu.:73.05          
    ##  Max.   :12.670                          Max.   :95.25          
    ##  Lab_1_Simple_Linear_Regression
    ##  Min.   :3.000                 
    ##  1st Qu.:5.000                 
    ##  Median :5.000                 
    ##  Mean   :4.882                 
    ##  3rd Qu.:5.000                 
    ##  Max.   :5.000                 
    ##  Lab 2 - 2.e. -  (Linear Regression using Gradient Descent) x/5
    ##  Min.   :2.150                                                 
    ##  1st Qu.:4.525                                                 
    ##  Median :5.000                                                 
    ##  Mean   :4.560                                                 
    ##  3rd Qu.:5.000                                                 
    ##  Max.   :5.000                                                 
    ##  Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) x/5
    ##  Min.   :2.850                                                  
    ##  1st Qu.:4.850                                                  
    ##  Median :4.850                                                  
    ##  Mean   :4.629                                                  
    ##  3rd Qu.:4.925                                                  
    ##  Max.   :5.000                                                  
    ##  Lab_4_Linear_Discriminant_Analysis Lab 5 - Chart JS Dashboard Setup x/5
    ##  Min.   :1.850                      Min.   :0.000                       
    ##  1st Qu.:4.450                      1st Qu.:5.000                       
    ##  Median :5.000                      Median :5.000                       
    ##  Mean   :4.509                      Mean   :3.898                       
    ##  3rd Qu.:5.000                      3rd Qu.:5.000                       
    ##  Max.   :5.000                      Max.   :5.000                       
    ##     LabWork           CAT_1           CAT_2        Attendance_Waiver_Granted
    ##  Min.   : 59.40   Min.   :36.84   Min.   :  0.00   Min.   :0                
    ##  1st Qu.: 82.20   1st Qu.:59.21   1st Qu.: 52.00   1st Qu.:0                
    ##  Median : 94.80   Median :73.68   Median : 63.00   Median :0                
    ##  Mean   : 89.91   Mean   :72.26   Mean   : 63.49   Mean   :0                
    ##  3rd Qu.: 99.40   3rd Qu.:84.86   3rd Qu.: 81.50   3rd Qu.:0                
    ##  Max.   :100.00   Max.   :97.36   Max.   :100.00   Max.   :0                
    ##  Absenteeism_Percentage Coursework_TOTAL      EXAM           TOTAL       GRADE 
    ##  Min.   : 0.00          Min.   :17.69    Min.   :12.00   Min.   :40.23   A:15  
    ##  1st Qu.: 7.41          1st Qu.:25.68    1st Qu.:30.00   1st Qu.:53.83   B:17  
    ##  Median :11.11          Median :28.86    Median :34.00   Median :62.39   C:10  
    ##  Mean   :14.12          Mean   :28.52    Mean   :34.27   Mean   :62.79   D: 9  
    ##  3rd Qu.:18.52          3rd Qu.:31.12    3rd Qu.:42.00   3rd Qu.:72.13   E: 0  
    ##  Max.   :51.85          Max.   :35.08    Max.   :56.00   Max.   :87.72

``` r
model_of_the_transform <- preProcess(Student_Performance_removed_obs,
                                     method = c("scale", "center"))
```

    ## Warning in preProcess.default(Student_Performance_removed_obs, method =
    ## c("scale", : These variables have zero variances: Attendance_Waiver_Granted

``` r
print(model_of_the_transform)
```

    ## Created from 51 samples and 100 variables
    ## 
    ## Pre-processing:
    ##   - centered (50)
    ##   - ignored (50)
    ##   - scaled (50)

``` r
Student_Performance_removed_obs_std <- predict(model_of_the_transform, # nolint
                                            Student_Performance_removed_obs)
summary(Student_Performance_removed_obs_std)
```

    ##  class_group gender      YOB             regret_choosing_bi drop_bi_now
    ##  A:10        1:31   Min.   :1999-01-01   1: 1               1: 1       
    ##  B:14        0:20   1st Qu.:2000-01-01   0:50               0:50       
    ##  C:27               Median :2001-01-01                                 
    ##                     Mean   :2000-12-17                                 
    ##                     3rd Qu.:2002-01-01                                 
    ##                     Max.   :2003-01-01                                 
    ##  motivator read_content_before_lecture anticipate_test_questions
    ##  1:42      1: 6                        1: 3                     
    ##  0: 9      2: 9                        2: 2                     
    ##            3:23                        3:12                     
    ##            4: 9                        4:23                     
    ##            5: 4                        5:11                     
    ##                                                                 
    ##  answer_rhetorical_questions find_terms_I_do_not_know
    ##  1: 1                        1: 3                    
    ##  2: 5                        2: 1                    
    ##  3:12                        3:11                    
    ##  4:23                        4:20                    
    ##  5:10                        5:16                    
    ##                                                      
    ##  copy_new_terms_in_reading_notebook take_quizzes_and_use_results
    ##  1: 3                               1: 3                        
    ##  2: 5                               2: 4                        
    ##  3:10                               3: 6                        
    ##  4:16                               4:15                        
    ##  5:17                               5:23                        
    ##                                                                 
    ##  reorganise_course_outline write_down_important_points space_out_revision
    ##  1: 2                      1: 2                        1: 3              
    ##  2:10                      2: 4                        2: 8              
    ##  3:12                      3: 6                        3:16              
    ##  4:17                      4:18                        4:14              
    ##  5:10                      5:21                        5:10              
    ##                                                                          
    ##  studying_in_study_group schedule_appointments goal_oriented spaced_repetition
    ##  1:16                    1:21                  1: 9          1: 6             
    ##  2:10                    2:17                  0:42          2:12             
    ##  3:11                    3: 9                                3:29             
    ##  4: 9                    4: 2                                4: 4             
    ##  5: 5                    5: 2                                                 
    ##                                                                               
    ##  testing_and_active_recall interleaving categorizing retrospective_timetable
    ##  1: 1                      1: 9         1: 4         1: 7                   
    ##  2: 5                      2:21         2:15         2:17                   
    ##  3:28                      3:19         3:25         3:21                   
    ##  4:17                      4: 2         4: 7         4: 6                   
    ##                                                                             
    ##                                                                             
    ##  cornell_notes sq3r   commute study_time repeats_since_Y1  paid_tuition
    ##  1: 9          1:10   1: 9    1:20       Min.   :-0.7276   0:47        
    ##  2:13          2:15   2:12    2:22       1st Qu.:-0.7276   1: 4        
    ##  3:18          3:15   3:17    3: 6       Median :-0.7276               
    ##  4:11          4:11   4:13    4: 3       Mean   : 0.0000               
    ##                                          3rd Qu.: 0.3801               
    ##                                          Max.   : 3.1495               
    ##  free_tuition extra_curricular sports_extra_curricular exercise_per_week
    ##  0:39         0:31             0:37                    0: 8             
    ##  1:12         1:20             1:14                    1:28             
    ##                                                        2:13             
    ##                                                        3: 2             
    ##                                                                         
    ##                                                                         
    ##  meditate pray   internet laptop family_relationships friendships
    ##  0:25     0: 3   0: 4     0: 0   1: 0                 1: 0       
    ##  1:19     1:10   1:47     1:51   2: 1                 2: 0       
    ##  2: 5     2: 9                   3: 9                 3:13       
    ##  3: 2     3:29                   4:18                 4:26       
    ##                                  5:23                 5:12       
    ##                                                                  
    ##  romantic_relationships spiritual_wellnes financial_wellness health day_out
    ##  0:34                   1: 1              1: 3               1: 0   0:13   
    ##  1: 0                   2: 2              2: 9               2: 1   1:37   
    ##  2: 1                   3:17              3:20               3:11   2: 1   
    ##  3:10                   4:19              4:12               4:16   3: 0   
    ##  4: 6                   5:12              5: 7               5:23          
    ##                                                                            
    ##  night_out alcohol_or_narcotics mentor mentor_meetings
    ##  0:32      0:41                 0:31   0:30           
    ##  1:18      1: 9                 1:20   1:12           
    ##  2: 1      2: 0                        2: 7           
    ##  3: 0      3: 1                        3: 2           
    ##                                                       
    ##                                                       
    ##  A - 1. I am enjoying the subject A - 2. Classes start and end on time
    ##  Min.   :-2.3525                  Min.   :-3.2275                     
    ##  1st Qu.:-0.7090                  1st Qu.:-1.2910                     
    ##  Median :-0.7090                  Median : 0.6455                     
    ##  Mean   : 0.0000                  Mean   : 0.0000                     
    ##  3rd Qu.: 0.9346                  3rd Qu.: 0.6455                     
    ##  Max.   : 0.9346                  Max.   : 0.6455                     
    ##  A - 3. The learning environment is participative, involves learning by doing and is group-based
    ##  Min.   :-1.9146                                                                                
    ##  1st Qu.:-0.4124                                                                                
    ##  Median :-0.4124                                                                                
    ##  Mean   : 0.0000                                                                                
    ##  3rd Qu.: 1.0898                                                                                
    ##  Max.   : 1.0898                                                                                
    ##  A - 4. The subject content is delivered according to the course outline and meets my expectations
    ##  Min.   :-3.3096                                                                                  
    ##  1st Qu.:-1.3469                                                                                  
    ##  Median : 0.6157                                                                                  
    ##  Mean   : 0.0000                                                                                  
    ##  3rd Qu.: 0.6157                                                                                  
    ##  Max.   : 0.6157                                                                                  
    ##  A - 5. The topics are clear and logically developed
    ##  Min.   :-4.6096                                    
    ##  1st Qu.:-1.1776                                    
    ##  Median : 0.5383                                    
    ##  Mean   : 0.0000                                    
    ##  3rd Qu.: 0.5383                                    
    ##  Max.   : 0.5383                                    
    ##  A - 6. I am developing my oral and writing skills
    ##  Min.   :-3.24271                                 
    ##  1st Qu.:-0.04184                                 
    ##  Median :-0.04184                                 
    ##  Mean   : 0.00000                                 
    ##  3rd Qu.: 1.02511                                 
    ##  Max.   : 1.02511                                 
    ##  A - 7. I am developing my reflective and critical reasoning skills
    ##  Min.   :-3.1558                                                   
    ##  1st Qu.:-0.4508                                                   
    ##  Median :-0.4508                                                   
    ##  Mean   : 0.0000                                                   
    ##  3rd Qu.: 0.9017                                                   
    ##  Max.   : 0.9017                                                   
    ##  A - 8. The assessment methods are assisting me to learn
    ##  Min.   :-4.8633                                        
    ##  1st Qu.:-0.7523                                        
    ##  Median : 0.6180                                        
    ##  Mean   : 0.0000                                        
    ##  3rd Qu.: 0.6180                                        
    ##  Max.   : 0.6180                                        
    ##  A - 9. I receive relevant feedback
    ##  Min.   :-2.6089                   
    ##  1st Qu.:-0.8809                   
    ##  Median : 0.8471                   
    ##  Mean   : 0.0000                   
    ##  3rd Qu.: 0.8471                   
    ##  Max.   : 0.8471                   
    ##  A - 10. I read the recommended readings and notes
    ##  Min.   :-2.8639                                  
    ##  1st Qu.:-1.0151                                  
    ##  Median : 0.8338                                  
    ##  Mean   : 0.0000                                  
    ##  3rd Qu.: 0.8338                                  
    ##  Max.   : 0.8338                                  
    ##  A - 11. I use the eLearning material posted
    ##  Min.   :-3.1581                            
    ##  1st Qu.:-0.3812                            
    ##  Median : 0.5445                            
    ##  Mean   : 0.0000                            
    ##  3rd Qu.: 0.5445                            
    ##  Max.   : 0.5445                            
    ##  B - 1. Concept 1 of 6: Principles of Business Intelligence and the DataOps Philosophy
    ##  Min.   :-3.9653                                                                      
    ##  1st Qu.:-0.3965                                                                      
    ##  Median :-0.3965                                                                      
    ##  Mean   : 0.0000                                                                      
    ##  3rd Qu.: 0.7931                                                                      
    ##  Max.   : 0.7931                                                                      
    ##  B - 2. Concept 3 of 6: Linear Algorithms for Predictive Analytics
    ##  Min.   :-2.50                                                    
    ##  1st Qu.: 0.00                                                    
    ##  Median : 0.00                                                    
    ##  Mean   : 0.00                                                    
    ##  3rd Qu.: 1.25                                                    
    ##  Max.   : 1.25                                                    
    ##  C - 2. Quizzes at the end of each concept
    ##  Min.   :-3.5398                          
    ##  1st Qu.:-0.6968                          
    ##  Median : 0.7247                          
    ##  Mean   : 0.0000                          
    ##  3rd Qu.: 0.7247                          
    ##  Max.   : 0.7247                          
    ##  C - 3. Lab manuals that outline the steps to follow during the labs
    ##  Min.   :-2.6681                                                    
    ##  1st Qu.:-1.0087                                                    
    ##  Median : 0.6508                                                    
    ##  Mean   : 0.0000                                                    
    ##  3rd Qu.: 0.6508                                                    
    ##  Max.   : 0.6508                                                    
    ##  C - 4. Required lab work submissions at the end of each lab manual that outline the activity to be done on your own
    ##  Min.   :-2.6215                                                                                                    
    ##  1st Qu.:-0.9709                                                                                                    
    ##  Median : 0.6796                                                                                                    
    ##  Mean   : 0.0000                                                                                                    
    ##  3rd Qu.: 0.6796                                                                                                    
    ##  Max.   : 0.6796                                                                                                    
    ##  C - 5. Supplementary videos to watch
    ##  Min.   :-3.02780                    
    ##  1st Qu.:-0.07714                    
    ##  Median :-0.07714                    
    ##  Mean   : 0.00000                    
    ##  3rd Qu.: 0.90641                    
    ##  Max.   : 0.90641                    
    ##  C - 6. Supplementary podcasts to listen to
    ##  Min.   :-2.98245                          
    ##  1st Qu.:-0.52914                          
    ##  Median :-0.03848                          
    ##  Mean   : 0.00000                          
    ##  3rd Qu.: 0.94284                          
    ##  Max.   : 0.94284                          
    ##  C - 7. Supplementary content to read C - 8. Lectures slides
    ##  Min.   :-3.3504                      Min.   :-3.9036       
    ##  1st Qu.:-1.2011                      1st Qu.: 0.4879       
    ##  Median :-0.1264                      Median : 0.4879       
    ##  Mean   : 0.0000                      Mean   : 0.0000       
    ##  3rd Qu.: 0.9482                      3rd Qu.: 0.4879       
    ##  Max.   : 0.9482                      Max.   : 0.4879       
    ##  C - 9. Lecture notes on some of the lecture slides
    ##  Min.   :-2.9443                                   
    ##  1st Qu.:-1.1567                                   
    ##  Median : 0.6309                                   
    ##  Mean   : 0.0000                                   
    ##  3rd Qu.: 0.6309                                   
    ##  Max.   : 0.6309                                   
    ##  C - 10. The quality of the lectures given (quality measured by the breadth (the full span of knowledge of a subject) and depth (the extent to which specific topics are focused upon, amplified, and explored) of learning - NOT quality measured by how fun/comical/lively the lectures are)
    ##  Min.   :-3.3101                                                                                                                                                                                                                                                                              
    ##  1st Qu.:-0.6724                                                                                                                                                                                                                                                                              
    ##  Median : 0.6465                                                                                                                                                                                                                                                                              
    ##  Mean   : 0.0000                                                                                                                                                                                                                                                                              
    ##  3rd Qu.: 0.6465                                                                                                                                                                                                                                                                              
    ##  Max.   : 0.6465                                                                                                                                                                                                                                                                              
    ##  C - 11. The division of theory and practice such that most of the theory is done during the recorded online classes and most of the practice is done during the physical classes
    ##  Min.   :-3.5676                                                                                                                                                                 
    ##  1st Qu.:-0.7247                                                                                                                                                                 
    ##  Median : 0.6968                                                                                                                                                                 
    ##  Mean   : 0.0000                                                                                                                                                                 
    ##  3rd Qu.: 0.6968                                                                                                                                                                 
    ##  Max.   : 0.6968                                                                                                                                                                 
    ##  C - 12. The recordings of online classes
    ##  Min.   :-2.8577                         
    ##  1st Qu.:-0.4082                         
    ##  Median : 0.8165                         
    ##  Mean   : 0.0000                         
    ##  3rd Qu.: 0.8165                         
    ##  Max.   : 0.8165                         
    ##  D - 1. Write two things you like about the teaching and learning in this unit so far.
    ##  Length:51                                                                            
    ##  Class :character                                                                     
    ##  Mode  :character                                                                     
    ##                                                                                       
    ##                                                                                       
    ##                                                                                       
    ##  D - 2. Write at least one recommendation to improve the teaching and learning in this unit (for the remaining weeks in the semester)
    ##  Length:51                                                                                                                           
    ##  Class :character                                                                                                                    
    ##  Mode  :character                                                                                                                    
    ##                                                                                                                                      
    ##                                                                                                                                      
    ##                                                                                                                                      
    ##  Evaluation_Rating Average Level of Learning Attained Rating
    ##  Min.   :-3.7885   Min.   :-3.2062                          
    ##  1st Qu.:-0.4198   1st Qu.:-0.2466                          
    ##  Median : 0.1237   Median :-0.2466                          
    ##  Mean   : 0.0000   Mean   : 0.0000                          
    ##  3rd Qu.: 0.7756   3rd Qu.: 0.4933                          
    ##  Max.   : 1.2103   Max.   : 1.2332                          
    ##  Average Pedagogical Strategy Effectiveness Rating
    ##  Min.   :-2.3724                                  
    ##  1st Qu.:-0.6265                                  
    ##  Median : 0.2466                                  
    ##  Mean   : 0.0000                                  
    ##  3rd Qu.: 0.8576                                  
    ##  Max.   : 1.1194                                  
    ##  Project: Section 1-4: (20%) x/10 Project: Section 5-11: (50%) x/10
    ##  Min.   :-4.8229                  Min.   :-4.0638                  
    ##  1st Qu.:-0.2562                  1st Qu.:-0.3034                  
    ##  Median : 0.3797                  Median : 0.2338                  
    ##  Mean   : 0.0000                  Mean   : 0.0000                  
    ##  3rd Qu.: 0.3797                  3rd Qu.: 0.6905                  
    ##  Max.   : 0.9578                  Max.   : 1.3083                  
    ##  Project: Section 12: (30%) x/5 Project: (10%): x/30 x 100 TOTAL
    ##  Min.   :-0.8174                Min.   :-4.3309                 
    ##  1st Qu.:-0.8174                1st Qu.:-0.3132                 
    ##  Median :-0.8174                Median :-0.0174                 
    ##  Mean   : 0.0000                Mean   : 0.0000                 
    ##  3rd Qu.: 0.9031                3rd Qu.: 0.5988                 
    ##  Max.   : 1.6405                Max.   : 1.8313                 
    ##  Quiz_1_Concept_1  Quiz 3 on Concept 3 (Linear) x/15 Quiz_4_Concept_4  
    ##  Min.   :-1.5613   Min.   :-1.88069                  Min.   :-2.62645  
    ##  1st Qu.:-0.7165   1st Qu.:-0.91185                  1st Qu.:-0.76240  
    ##  Median :-0.2436   Median : 0.05699                  Median : 0.08766  
    ##  Mean   : 0.0000   Mean   : 0.00000                  Mean   : 0.00000  
    ##  3rd Qu.: 0.4125   3rd Qu.: 0.70288                  3rd Qu.: 0.79333  
    ##  Max.   : 2.0002   Max.   : 1.67172                  Max.   : 1.49900  
    ##  Quiz 5 on Concept 5 (Dashboarding) x/10 Quizzes_and_Bonus_Marks
    ##  Min.   :-2.61682                        Min.   :-1.89005       
    ##  1st Qu.:-0.59251                        1st Qu.:-0.83435       
    ##  Median :-0.08643                        Median :-0.03717       
    ##  Mean   : 0.00000                        Mean   : 0.00000       
    ##  3rd Qu.: 0.58665                        3rd Qu.: 0.69413       
    ##  Max.   : 2.95004                        Max.   : 2.08741       
    ##  Lab_1_Simple_Linear_Regression
    ##  Min.   :-4.3660               
    ##  1st Qu.: 0.2729               
    ##  Median : 0.2729               
    ##  Mean   : 0.0000               
    ##  3rd Qu.: 0.2729               
    ##  Max.   : 0.2729               
    ##  Lab 2 - 2.e. -  (Linear Regression using Gradient Descent) x/5
    ##  Min.   :-2.92597                                              
    ##  1st Qu.:-0.04226                                              
    ##  Median : 0.53448                                              
    ##  Mean   : 0.00000                                              
    ##  3rd Qu.: 0.53448                                              
    ##  Max.   : 0.53448                                              
    ##  Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) x/5
    ##  Min.   :-2.6991                                                
    ##  1st Qu.: 0.3346                                                
    ##  Median : 0.3346                                                
    ##  Mean   : 0.0000                                                
    ##  3rd Qu.: 0.4484                                                
    ##  Max.   : 0.5621                                                
    ##  Lab_4_Linear_Discriminant_Analysis Lab 5 - Chart JS Dashboard Setup x/5
    ##  Min.   :-3.18092                   Min.   :-1.882                      
    ##  1st Qu.:-0.07037                   1st Qu.: 0.532                      
    ##  Median : 0.58763                   Median : 0.532                      
    ##  Mean   : 0.00000                   Mean   : 0.000                      
    ##  3rd Qu.: 0.58763                   3rd Qu.: 0.532                      
    ##  Max.   : 0.58763                   Max.   : 0.532                      
    ##     LabWork            CAT_1              CAT_2         
    ##  Min.   :-2.7594   Min.   :-2.38779   Min.   :-2.71471  
    ##  1st Qu.:-0.6976   1st Qu.:-0.87980   1st Qu.:-0.49130  
    ##  Median : 0.4419   Median : 0.09564   Median :-0.02096  
    ##  Mean   : 0.0000   Mean   : 0.00000   Mean   : 0.00000  
    ##  3rd Qu.: 0.8579   3rd Qu.: 0.84964   3rd Qu.: 0.77006  
    ##  Max.   : 0.9121   Max.   : 1.69195   Max.   : 1.56108  
    ##  Attendance_Waiver_Granted Absenteeism_Percentage Coursework_TOTAL  
    ##  Min.   :0                 Min.   :-1.4849        Min.   :-2.76758  
    ##  1st Qu.:0                 1st Qu.:-0.7059        1st Qu.:-0.72370  
    ##  Median :0                 Median :-0.3169        Median : 0.08797  
    ##  Mean   :0                 Mean   : 0.0000        Mean   : 0.00000  
    ##  3rd Qu.:0                 3rd Qu.: 0.4621        3rd Qu.: 0.66701  
    ##  Max.   :0                 Max.   : 3.9659        Max.   : 1.67808  
    ##       EXAM              TOTAL         GRADE 
    ##  Min.   :-1.98972   Min.   :-1.7804   A:15  
    ##  1st Qu.:-0.38183   1st Qu.:-0.7071   B:17  
    ##  Median :-0.02452   Median :-0.0316   C:10  
    ##  Mean   : 0.00000   Mean   : 0.0000   D: 9  
    ##  3rd Qu.: 0.69010   3rd Qu.: 0.7371   E: 0  
    ##  Max.   : 1.94068   Max.   : 1.9674

``` r
sapply(Student_Performance_removed_obs_std[, c(90,88,89,87,86,91,92,93,94,96,97,98,99)], sd)
```

    ##                              Lab_4_Linear_Discriminant_Analysis 
    ##                                                               1 
    ##  Lab 2 - 2.e. -  (Linear Regression using Gradient Descent) x/5 
    ##                                                               1 
    ## Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) x/5 
    ##                                                               1 
    ##                                  Lab_1_Simple_Linear_Regression 
    ##                                                               1 
    ##                                         Quizzes_and_Bonus_Marks 
    ##                                                               1 
    ##                            Lab 5 - Chart JS Dashboard Setup x/5 
    ##                                                               1 
    ##                                                         LabWork 
    ##                                                               1 
    ##                                                           CAT_1 
    ##                                                               1 
    ##                                                           CAT_2 
    ##                                                               1 
    ##                                          Absenteeism_Percentage 
    ##                                                               1 
    ##                                                Coursework_TOTAL 
    ##                                                               1 
    ##                                                            EXAM 
    ##                                                               1 
    ##                                                           TOTAL 
    ##                                                               1

``` r
## Select the features to use to create the clusters ----
# Using OPTION 1: Use all the numeric variables to create the clusters
Student_Performance_vars <-
  Student_Performance_removed_obs_std[, c(90,88,89,87,86,91,92,93,94,96,97,98,99)]

# Using OPTION 2: Use only the most significant variables to create the clusters
# This can be informed by feature selection, or by the business case.

Student_Performance_vars <-
  Student_Performance_removed_obs_std[, c("Quizzes_and_Bonus_Marks",
                                       "EXAM")]
```

``` r
# The code was used to create the clusters using the K-Means Clustering Algorithm ----
# We start with a random guess of the number of clusters we need
set.seed(7)
kmeans_cluster <- kmeans(Student_Performance_vars, centers = 3, nstart = 20)

# We then decide the maximum number of clusters to investigate
n_clusters <- 8

# Initialize total within sum of squares error: wss
wss <- numeric(n_clusters)

set.seed(7)

# Investigate 1 to n possible clusters (where n is the maximum number of 
# clusters that we want to investigate)
for (i in 1:n_clusters) {
  # Use the K Means cluster algorithm to create each cluster
  kmeans_cluster <- kmeans(Student_Performance_vars, centers = i, nstart = 20)
  # Save the within cluster sum of squares
  wss[i] <- kmeans_cluster$tot.withinss
}

## Plot a scree plot ----
# The scree plot should help you to note when additional clusters do not make
# any significant difference (the plateau).
wss_df <- tibble(clusters = 1:n_clusters, wss = wss)

scree_plot <- ggplot(wss_df, aes(x = clusters, y = wss, group = 1)) +
  geom_point(size = 4) +
  geom_line() +
  scale_x_continuous(breaks = c(2, 4, 6, 8)) +
  xlab("Number of Clusters")

scree_plot
```

![](Lab7b-Submission_files/figure-gfm/Your%20Fifth%20Code%20Chunk-1.png)<!-- -->

``` r
# We can add guides to make it easier to identify the plateau (or "elbow").
scree_plot +
  geom_hline(
    yintercept = wss,
    linetype = "dashed",
    col = c(rep("#000000", 5), "#FF0000", rep("#000000", 2))
  )
```

![](Lab7b-Submission_files/figure-gfm/Your%20Fifth%20Code%20Chunk-2.png)<!-- -->

``` r
# The plateau is reached at 6 clusters.
# We therefore create the final cluster with 6 clusters
# (not the initial 3 used at the beginning of this STEP.)
k <- 6
set.seed(7)
# Build model with k clusters: kmeans_cluster
kmeans_cluster <- kmeans(Student_Performance_vars, centers = k, nstart = 20)
```

``` r
# Adding the cluster number as a label for each observation ----
Student_Performance_removed_obs$cluster_id <- factor(kmeans_cluster$cluster)

## View the results by plotting scatter plots with the labelled cluster ----
ggplot(Student_Performance_removed_obs, aes(Quizzes_and_Bonus_Marks, EXAM,
                                         color = cluster_id)) +
  geom_point(alpha = 0.5) +
  xlab("Quizzes_and_Bonus_Marks") +
  ylab("EXAM")
```

![](Lab7b-Submission_files/figure-gfm/Your%20Sixth%20Code%20Chunk-1.png)<!-- -->

``` r
ggplot(Student_Performance_removed_obs,
       aes(CAT_1, EXAM, color = cluster_id)) +
  geom_point(alpha = 0.5) +
  xlab("EXAM") +
  ylab("CAT_1")
```

![](Lab7b-Submission_files/figure-gfm/Your%20Sixth%20Code%20Chunk-2.png)<!-- -->

``` r
ggplot(Student_Performance_removed_obs,
       aes(EXAM, LabWork,
           color = cluster_id)) +
  geom_point(alpha = 0.5) +
  xlab("EXAM") +
  ylab("LabWork")
```

![](Lab7b-Submission_files/figure-gfm/Your%20Sixth%20Code%20Chunk-3.png)<!-- -->
