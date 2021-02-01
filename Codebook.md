# Codebook

## Followed Procedure

1. Dataset was downloaded from [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and stored AS-IS into the `./data` folder
2. The resulting zip-file from step 1 was unzipped |inplace|<br /> Contents was extracted into `./data/UCI HAR Dataset/`
3. The script [run_analysis.R](./run_analysis.R) was run to transform the text-files of the test and training sets into 2 new datasets:
   1. `./data/analysis.csv`:<br />
      _The merged train & test data, with cleaned-up variable names. Only the variables containing mean & standard deviation are retained from the original data_
   2. `./data/summary.csv`:<br />
      _A summary of analysis.csv, containing per variable the mean, grouped over the subject **and** activity_

## Notes:

1.  Dataset was download d.d. 1 Feb 2020, 1:57 GMT
2.  Tools used:
    - MacOs BigSur
    - R-Studio V1.4.1103
3.  required packages:
    - readr
    - stringr
    - dplyr

## Variables

Variables: the expanded variable-names from the original dataset.
In the original set vars are prefixed with either t of f, indicating the domain of measurement; t=time, f=frequency.

The original datasets describes 56 variables, that is reduced to 67.
Only the variables containing mean & std are retained

### expansions:

[t] is expaned into time_of<br/>
[f] is expaned into freq_of<br />
the function angle(a,b) is expanded into angle_between_a_and_b

_See [original readme](./data/UCI HAR Dataset/README.txt) for details about the the method of measurement and details of the resulting signals_

| Name                                                              | Description                   |
| ----------------------------------------------------------------- | ----------------------------- |
| activity                                                          | activity performed by subject |
| subject                                                           | id of subject                 |
| time_of_body_acceleration_mean_x                                  |                               |
| time_of_body_acceleration_mean_y                                  |                               |
| time_of_body_acceleration_mean_z                                  |                               |
| time_of_body_acceleration_std_x                                   |                               |
| time_of_body_acceleration_std_y                                   |                               |
| time_of_body_acceleration_std_z                                   |                               |
| time_of_gravity_acceleration_mean_x                               |                               |
| time_of_gravity_acceleration_mean_y                               |                               |
| time_of_gravity_acceleration_mean_z                               |                               |
| time_of_gravity_acceleration_std_x                                |                               |
| time_of_gravity_acceleration_std_y                                |                               |
| time_of_gravity_acceleration_std_z                                |                               |
| time_of_body_acceleration_jerk_mean_x                             |                               |
| time_of_body_acceleration_jerk_mean_y                             |                               |
| time_of_body_acceleration_jerk_mean_z                             |                               |
| time_of_body_acceleration_jerk_std_x                              |                               |
| time_of_body_acceleration_jerk_std_y                              |                               |
| time_of_body_acceleration_jerk_std_z                              |                               |
| time_of_body_gyro_mean_x                                          |                               |
| time_of_body_gyro_mean_y                                          |                               |
| time_of_body_gyro_mean_z                                          |                               |
| time_of_body_gyro_std_x                                           |                               |
| time_of_body_gyro_std_y                                           |                               |
| time_of_body_gyro_std_z                                           |                               |
| time_of_body_gyro_jerk_mean_x                                     |                               |
| time_of_body_gyro_jerk_mean_y                                     |                               |
| time_of_body_gyro_jerk_mean_z                                     |                               |
| time_of_body_gyro_jerk_std_x                                      |                               |
| time_of_body_gyro_jerk_std_y                                      |                               |
| time_of_body_gyro_jerk_std_z                                      |                               |
| freq_of_body_acceleration_mean_x                                  |                               |
| freq_of_body_acceleration_mean_y                                  |                               |
| freq_of_body_acceleration_mean_z                                  |                               |
| freq_of_body_acceleration_std_x                                   |                               |
| freq_of_body_acceleration_std_y                                   |                               |
| freq_of_body_acceleration_std_z                                   |                               |
| freq_of_body_acceleration_meanfreq_x                              |                               |
| freq_of_body_acceleration_meanfreq_y                              |                               |
| freq_of_body_acceleration_meanfreq_z                              |                               |
| freq_of_body_acceleration_jerk_mean_x                             |                               |
| freq_of_body_acceleration_jerk_mean_y                             |                               |
| freq_of_body_acceleration_jerk_mean_z                             |                               |
| freq_of_body_acceleration_jerk_std_x                              |                               |
| freq_of_body_acceleration_jerk_std_y                              |                               |
| freq_of_body_acceleration_jerk_std_z                              |                               |
| freq_of_body_acceleration_jerk_meanfreq_x                         |                               |
| freq_of_body_acceleration_jerk_meanfreq_y                         |                               |
| freq_of_body_acceleration_jerk_meanfreq_z                         |                               |
| freq_of_body_gyro_mean_x                                          |                               |
| freq_of_body_gyro_mean_y                                          |                               |
| freq_of_body_gyro_mean_z                                          |                               |
| freq_of_body_gyro_std_x                                           |                               |
| freq_of_body_gyro_std_y                                           |                               |
| freq_of_body_gyro_std_z                                           |                               |
| freq_of_body_gyro_meanfreq_x                                      |                               |
| freq_of_body_gyro_meanfreq_y                                      |                               |
| freq_of_body_gyro_meanfreq_z                                      |                               |
| freq_of_body_acceleration_mag_meanfreq                            |                               |
| freq_of_body_bodyacceleration_jerk_mag_meanfreq                   |                               |
| freq_of_body_bodygyro_mag_meanfreq                                |                               |
| freq_of_body_bodygyro_jerk_mag_meanfreq                           |                               |
| angle_between_time_of_body_acceleration_mean_and_gravity          |                               |
| angle_between_time_of_body_acceleration_jerk_mean_and_gravitymean |
| angle_between_time_of_body_gyromean_and_gravitymean               |                               |
| angle_between_time_of_body_gyro_jerk_mean_and_gravitymean         |                               |
