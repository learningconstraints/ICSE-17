# ICSE-17

How to regenrate the data and the different charts for this content.

## HELPER

To generate the data that is later exploited by our classification algorithm we provide a python script that relies on pandas and sklearn modules for the classification and machine learning tasks. 

The syntax for this script is depicted above:

Syntax: ./sensitivity.py <dataset> <perf> (<thresh>) <srm> <srM> <srs> <dest>
-  dataset     path to the studied system's dataset
-  perf        name of the studied performance ("perf" in most cases,
               exceptions being x264 and SaC)
-  thresh      optional parameter to set a threshold for a sensitivity analysis
               on sampling size only. Takes values between 0 and 1 being the
               wanted representation of class 0
-  srm         minimum sampling size
-  srM         maximum sampling size
-  srs         sampling step between two iterations
-  dest        path to save results


You can see the machine learning algorithm within line 60 (when we call tree.DecisionTreeClassifier(criterion="entropy", min_samples_leaf=2))

## HEATMAPS

To generate the different heatmaps we find two scripts in the heatmaps folder. 

*1.extractData.sh is a wrapper for the data extrator found in helpers that simply pass the default values for this as well as try to paralelyze as much as possible the execution. NOTE THAT THIS IS NOT REQUIRED. WE PROVIDE THE COMPUTED DATA IN THIS REPO.

*2.computeTableData.sh this is again a wrapper to call the R scripts used to generate the results.

## METRIC VIEW

This folder contains the scripts to generate the metrics comparision shown in the paper.  We replicate the same dat a structure for all experiments. Therefore, we find a 
