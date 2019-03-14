Workout 1
================
Ann Deng

------------------------------------------------------------------------

**Purpose**: As a team, the Golden State Warriors (GSW) shoot a large number of shots - in the 2016 NBA season, the five players shot a total of 4334 shots from all around the opponent's half of the court (and some were even beyond the half-court line). This report seeks to demonstrate some of the strengths and weaknesses of each of the team members in terms of their shots made and shots attempted, as well as draw some general observations about the shooting patterns of the GSW.

**Method**: The data for the tables and charts for this report come from the .csv files "andre-iguodala.csv", "draymond-green.csv", "kevin-durant.csv", "klay-thompson.csv", and "stephen-curry.csv" available in the github repo at <https://github.com/ucb-stat133/stat133-hws/tree/master/data>. From this data, I compiled a .csv file that contains all of their stats plus a "minute" category that details at which minutes their shots were attempted. This "complete" .csv was used to make charts for each of the players that indicate the positions on a court where shots were attempted as well as the success or failure of the shot. In addition, I created summary tables for each of the players describing the min, max, mean, median, and quartiles for each of their shot stats, which are located in the outputs folder as supplemental information.

**Data and Analysis**:

These shot charts give a general sense of where on the court each player was shooting from: <img src="../images/gsw-shot-charts.png" width="80%" style="display: block; margin: auto;" /> We can see that Kevin Durant, Klay Thomspon, and Stephen Curry make a huge number of shots, and Draymond Green and Andre Iguodala make a significantly smaller amount. Curry makes more shots outside of the three-point line than the rest of the players.

These tables give the shooting % by player:

``` r
shot_data <- read.csv('../data/shots-data.csv')

# 2PT effective shooting % by player
arrange(
  summarise(
  group_by(shot_data, name),
  total = sum(shot_type == '2PT Field Goal'),
  made = sum(shot_made_flag == "shot_yes" & shot_type == '2PT Field Goal'),
  perc_made = sum(shot_made_flag == "shot_yes" & shot_type == '2PT Field Goal') / length(name)),
desc(perc_made))
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Kevin Durant     643   390     0.426
    ## 2 Andre Iguodala   210   134     0.361
    ## 3 Draymond Green   346   171     0.296
    ## 4 Klay Thompson    640   329     0.270
    ## 5 Stephen Curry    563   304     0.243

``` r
# 3PT effective shooting % by player
arrange(
  summarise(
  group_by(shot_data, name),
  total = sum(shot_type == '3PT Field Goal'),
  made = sum(shot_made_flag == "shot_yes" & shot_type == '3PT Field Goal'),
  perc_made = sum(shot_made_flag == "shot_yes" & shot_type == '3PT Field Goal') / length(name)),
desc(perc_made))
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Stephen Curry    687   280     0.224
    ## 2 Klay Thompson    580   246     0.202
    ## 3 Andre Iguodala   161    58     0.156
    ## 4 Draymond Green   232    74     0.128
    ## 5 Kevin Durant     272   105     0.115

``` r
# Overall effective shooting % by player
arrange(
  summarise(
  group_by(shot_data, name),
  total = length(name),
  made = sum(shot_made_flag == "shot_yes"),
  perc_made = sum(shot_made_flag == "shot_yes") / length(name)),
desc(perc_made))
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Kevin Durant     915   495     0.541
    ## 2 Andre Iguodala   371   192     0.518
    ## 3 Klay Thompson   1220   575     0.471
    ## 4 Stephen Curry   1250   584     0.467
    ## 5 Draymond Green   578   245     0.424

From these tables, we can see that, in general, Kevin Durant makes his shots most often, and Andre Iguodala second-most often. Durant also makes the highest percentage of 2PT field goals. However, Steph Curry makes the highest percentage of 3PT field goals, with Klay Thompson coming in at a close second.
