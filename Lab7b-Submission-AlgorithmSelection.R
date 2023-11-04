# STEP 1. Install and Load the Required Packages ----
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



## STEP 2. Load the Dataset
# BI1 Student Performance dataset

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
        `Attendance_Waiver_Granted` =
          readr::col_factor(levels = c("0", "1")),
        GRADE = readr::col_factor(levels =
                                    c("A", "B", "C", "D",
                                      "E"))),
    locale = readr::locale())
        
        
# STEP 3. Check for Missing Data and Address it ----
# Are there missing values in the dataset?
any_na(Student_Performance_Dataset)

# How many?
n_miss(Student_Performance_Dataset)

# What is the proportion of missing data in the entire dataset?
prop_miss(Student_Performance_Dataset)

# What is the number and percentage of missing values grouped by
# each variable?
miss_var_summary(Student_Performance_Dataset)

# Which variables contain the most missing values?
gg_miss_var(Student_Performance_Dataset)

# Which combinations of variables are missing together?
gg_miss_upset(Student_Performance_Dataset)

# Where are missing values located (the shaded regions in the plot)?
vis_miss(Student_Performance_Dataset) +
  theme(axis.text.x = element_text(angle = 80))


## OPTION 1: Remove the observations with missing values ----
# We can decide to remove all the observations that have missing values
# as follows:
Student_Performance_removed_obs <-
  Student_Performance_Dataset %>%
  dplyr::filter(complete.cases(.))



# The initial dataset had 21,120 observations and 16 variables
dim(Student_Performance_Dataset)

# The filtered dataset has 16,205 observations and 16 variables
dim(Student_Performance_removed_obs)

# Are there missing values in the dataset?
any_na(Student_Performance_removed_obs)


# STEP 4. Perform EDA and Feature Selection ----
## Compute the correlations between variables ----
# We identify the correlated variables because it is these correlated variables
# that can then be used to identify the clusters.

# Create a correlation matrix
# Option 1: Basic Table
cor(Student_Performance_removed_obs[, c(90,88,89,87,86,91,92,93,94,96,97,98,99)]) %>%
  View()

View(Student_Performance_removed_obs)

# Option 3: Fancy Plot using ggplot2
corr_matrix <- cor(Student_Performance_removed_obs[, c(90,88,89,87,86,91,92,93,94,96,97,98,99)])

p <- ggplot2::ggplot(data = reshape2::melt(corr_matrix),
                     ggplot2::aes(Var1, Var2, fill = value)) +
  ggplot2::geom_tile() +
  ggplot2::geom_text(ggplot2::aes(label = label_wrap(label, width = 10)),
                     size = 4) +
  ggplot2::theme_minimal() +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, hjust = 1))

ggcorrplot(corr_matrix, hc.order = TRUE, type = "lower", lab = TRUE)

## Plot the scatter plots ----
# A scatter plot to show the Total Grade against Coursework_TOTAL

ggplot(Student_Performance_removed_obs,
       aes(TOTAL, Coursework_TOTAL)) +
  geom_point(alpha = 0.5) +
  xlab("Total") +
  ylab("Coursework_Total")

# A scatter plot to show the Total Grade against LabWork

ggplot(Student_Performance_removed_obs,
       aes(TOTAL, LabWork)) +
  geom_point(alpha = 0.5) +
  xlab("Total") +
  ylab("LabWork")

# A scatter plot to show the Total Grade against Absenteeism_Percentage

ggplot(Student_Performance_removed_obs,
       aes(TOTAL, Absenteeism_Percentage)) +
  geom_point(alpha = 0.5) +
  xlab("Total") +
  ylab("Absenteeism_Percentage")

# A scatter plot to show the Total Grade against Quizzes_and_Bonus_Marks

ggplot(Student_Performance_removed_obs,
       aes(TOTAL, Quizzes_and_Bonus_Marks)) +
  geom_point(alpha = 0.5) +
  xlab("Total") +
  ylab("Quizzes_and_Bonus_Marks")

# A scatter plot to show the Total Grade against pray

ggplot(Student_Performance_removed_obs,
       aes(GRADE, pray)) +
  geom_point(alpha = 0.5) +
  xlab("GRADE") +
  ylab("pray")

## Transform the data ----
# The K Means Clustering algorithm performs better when data transformation has
# been applied. This helps to standardize the data making it easier to compare
# multiple variables.

summary(Student_Performance_removed_obs)
model_of_the_transform <- preProcess(Student_Performance_removed_obs,
                                     method = c("scale", "center"))
print(model_of_the_transform)
Student_Performance_removed_obs_std <- predict(model_of_the_transform, # nolint
                                            Student_Performance_removed_obs)
summary(Student_Performance_removed_obs_std)
sapply(Student_Performance_removed_obs_std[, c(90,88,89,87,86,91,92,93,94,96,97,98,99)], sd)


## Select the features to use to create the clusters ----
# OPTION 1: Use all the numeric variables to create the clusters
Student_Performance_vars <-
  Student_Performance_removed_obs_std[, c(90,88,89,87,86,91,92,93,94,96,97,98,99)]

# OPTION 2: Use only the most significant variables to create the clusters
# This can be informed by feature selection, or by the business case.

Student_Performance_vars <-
  Student_Performance_removed_obs_std[, c("Quizzes_and_Bonus_Marks",
                                       "EXAM")]


# STEP 5. Create the clusters using the K-Means Clustering Algorithm ----
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

# We can add guides to make it easier to identify the plateau (or "elbow").
scree_plot +
  geom_hline(
    yintercept = wss,
    linetype = "dashed",
    col = c(rep("#000000", 5), "#FF0000", rep("#000000", 2))
  )

# The plateau is reached at 6 clusters.
# We therefore create the final cluster with 6 clusters
# (not the initial 3 used at the beginning of this STEP.)
k <- 6
set.seed(7)
# Build model with k clusters: kmeans_cluster
kmeans_cluster <- kmeans(Student_Performance_vars, centers = k, nstart = 20)

# STEP 6. Add the cluster number as a label for each observation ----
Student_Performance_removed_obs$cluster_id <- factor(kmeans_cluster$cluster)

## View the results by plotting scatter plots with the labelled cluster ----
ggplot(Student_Performance_removed_obs, aes(Quizzes_and_Bonus_Marks, EXAM,
                                         color = cluster_id)) +
  geom_point(alpha = 0.5) +
  xlab("Quizzes_and_Bonus_Marks") +
  ylab("EXAM")

ggplot(Student_Performance_removed_obs,
       aes(CAT_1, EXAM, color = cluster_id)) +
  geom_point(alpha = 0.5) +
  xlab("EXAM") +
  ylab("CAT_1")

ggplot(Student_Performance_removed_obs,
       aes(EXAM, LabWork,
           color = cluster_id)) +
  geom_point(alpha = 0.5) +
  xlab("EXAM") +
  ylab("LabWork")



