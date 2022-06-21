# ECG Signal Analysis
The electrocardiogram (ECG) signal shows the electrical activity of the heart in terms of quasi periodic voltage signals. The signal were studied and processed to analyze the activity of the heart. We measured the heart rate and flagged heart abnormalities or arrhythmia by ECG signal analysis.


The Project involved figuring out the most efficient pathway to execute these steps:-

1) Data collection and modification of data.  
2) Filtering the data and Noise using low and high pass filters.  
3) Finding Q,R,S peaks in the plot using MATLAB.  
4) Determining heart rate with the help of peaks.  
5) Classification of heartbeat sample into normal,abnormal,tachycardia, bradycardia based on heartbeat and QRS average value.  



1) Data Collection & Modification- From the Raw Data Taken from [Physionet](https://physionet.org), and the python file "DataExtractor.py" converted it into the proper format.  

2) We designed and optimised a low pass filter and a highpass filter. We implemented a Savitzky-Golay Filter, also, to filter out the noise. Pooling techniques (max- pool filter, average-pool filter) were also experimented with.  

3) From the filtered and smooth data, setting the Threshold values, the minimum Distance and value of the peaks, the R peaks were identified. Using R-peak location data, adjacent Q and S peaks were Identified.  

4) Since our samples were collected for a short duration (10 seconds), calculating the heart rate from the number of peaks was unrelaible method. Instead, the average R-R peak distance was used.

5) From the normal values of parameters like QRS peaks, average RR intervals, Beats Per Minute(BPM) and average QRS intervals, we could classify and label a particular sample as that of one belonging to either a patient with Tachycardia, Bradycardia or Arrhythmia.  


Further Scope:  
• Using concepts of ML/AI we can further increase the accuracy of out model and detect many more abnormalities and diseases related to ECG signal.  
• We can also switch to more complicated algorithms for peak identification for increasing the accuracy and hence making the results more reliable.  
• We can also modify our algorithm slightly to monitor real time data for abnormality detection.  

A team effort by:
Gurarmaan Singh, Kartik Sharma and Shreya Sonone


