# Bellabeat Case Study

This is a capstone project as a part of the **Google Data Analytics Certificate**. 

## Introduction

The company in question is **Bellabeat**, a high-tech manufacturer of health-focused products for women. In order to answer the key business questions, the outline of the project will follow the steps of the data analysis process: ask, prepare, process, analyze, share, and act.

By 2016, *Bellabeat* had opened offices around the world and launched multiple products. Bellabeat products became available through a growing number of online retailers in addition to their own e-commerce channel on their website. The company has invested in traditional advertising media, such as radio, out-of-home billboards, print, and television, but focuses on digital marketing extensively. Bellabeat invests year-round in Google Search, maintaining active Facebook and Instagram pages, and consistently engages consumers on Twitter. Additionally, Bellabeat runs video ads on Youtube and display ads on the Google Display Network to support campaigns around key marketing dates.

The purpose of this project is to help find any discernable patterns using the given data that is provided from **FitBit** tracking data, to help the marketing and product teams.

## Files

The analysis was conducted using datasets provided by [Mobius](https://www.kaggle.com/arashnic) and can be accessed [here](https://www.kaggle.com/arashnic/fitbit). However, for convenience sake are also included in the **CSV Files** subfolder.

## Requirements

There are no pre-requisites for viewing the given *.ipynb*, *.R*, and *.rmd* files, however if you wish to download any of the files to work with them I would suggest using [R Studio](https://www.rstudio.com/) or [Kaggle](https://www.kaggle.com/) for working with notebooks. 

Here is some sample code for one of the plots created.

```r
# aggregating MET data into daily time frames
MET_daily_data <- METsData %>% 
  separate(ActivityMinute, c("Date", "Time"), sep = " ") %>% 
  select(Id, Date, METs) %>% 
  group_by(Id, Date) %>% 
  summarize("Daily METs" = sum(METs))
head(MET_daily_data)

# changing Date column to date type
MET_daily_data$Date <- anytime::anydate(MET_daily_data$Date)
MET_data <- rename(MET_daily_data, c("METs" = "Daily METs"))
glimpse(MET_daily_data)
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## Contact Information
[LinkedIn](https://www.linkedin.com/in/joseph-jensen-157828183/)
[Kaggle](https://www.kaggle.com/josephdjensen)
