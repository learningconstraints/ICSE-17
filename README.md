# ICSE-17

How to regenerate the data and the different charts for this content.

## HELPER

To generate the data that is later exploited by our classification algorithm we provide a python script that relies on pandas and shlearn modules for the classification and machine learning tasks. 

The syntax for this script is depicted above:

Syntax: ./sensitivity.py dataset perf (thresh) srm srM srs dest
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

*1.extractData.sh, this is a wrapper for the data extractor found in helpers that simply pass the default values for this as well as try to parallelize as much as possible the execution. NOTE THAT THIS IS NOT REQUIRED. WE PROVIDE THE COMPUTED DATA IN THIS REPO.

*2.computeTableData.sh, this is again a wrapper to call the R scripts used to generate the results.

## METRIC VIEW

This folder contains the scripts to generate the metrics comparison shown in the paper.  We replicate the same data a structure for all experiments. Therefore, we find a script 2.computeTableData.sh to call the R scripts with the appropriate inputs. Also, we provide a computeNumberOfConfigurations.sh script to calculate the number of total products in parallel for all models.

## Synthetic View.

This folder contains the scripts required to generate the metrics for the synthetic views carried out in this experimentation. This again relies on two scripts to call the required helpers scripts (python for the data generation and R for presentation). In this case, we do generate a table with the data resulting out of our learning constraints method. 

*1.extractData.sh, this is a wrapper for the data extractor found in helpers that simply pass the default values for this as well as try to parallelize as much as possible the execution. NOTE THAT THIS IS NOT REQUIRED. WE PROVIDE THE COMPUTED DATA IN THIS REPO.

*2.computeTableData.sh, this is again a wrapper to call the R scripts used to generate the results.

If you have any trouble executing this experiment do not hesitate to email any of the contributors of this repository.
