# NCCATour24
Attempting to predict the NCAA tournamet using a random forest model. It doesn't do a sim so it doesn't know who is playing who. The predictions are a mix of a random forest with a max depth of 5 and 250 trees. The stats used can be seen in the cleaing file, I'll list them here but just trying to get this up.



[NewT.csv](https://github.com/dlshew/NCCATour24/files/14629852/NewT.csv)
Team,Champ,FinalF,EliteE,ChampOdds,FinalFOdds,EliteEOdds
Connecticut,0.306,0.403,0.787,3.2642491541598,2.4813895781637716,1.2706480304955527
Purdue,0.184,0.25,0.499,5.44805617896185,4.0,2.004008016032064
North Carolina,0.0,0.033,0.08499999999999999,Inf,30.3030303030303,11.764705882352942
Houston,0.039,0.138,0.227,25.7807468311065,7.246376811594202,4.405286343612334
Iowa St.,0.0,0.029,0.077,Inf,34.48275862068965,12.987012987012987
Arizona,0.025,0.05,0.122,39.276617954071,20.0,8.19672131147541
Creighton,0.053,0.09,0.189,18.7338810057257,11.11111111111111,5.291005291005291
Auburn,0.039,0.091,0.17400000000000002,25.8871689026488,10.989010989010989,5.747126436781609
Tennessee,0.0,0.031,0.075,Inf,32.25806451612903,13.333333333333334
Illinois,0.038,0.063,0.139,26.2117729014281,15.873015873015873,7.194244604316546
Baylor,0.018,0.034,0.08600000000000001,55.5380073800738,29.41176470588235,11.627906976744185
Alabama,0.039,0.077,0.148,25.7807468311065,12.987012987012987,6.756756756756757
Marquette,0.0,0.026,0.054,Inf,38.46153846153846,18.51851851851852
Gonzaga,0.0,0.036,0.063,Inf,27.77777777777778,15.873015873015873
Kentucky,0.046,0.075,0.14200000000000002,21.5504009163803,13.333333333333334,7.04225352112676
Duke,0.016,0.038,0.073,63.6666666666667,26.315789473684212,13.698630136986303
Florida,0.036,0.039999999999999994,0.093,28.1428571428571,25.000000000000004,10.75268817204301
Clemson,0.02,0.026000000000000002,0.062,49.25,38.46153846153846,16.129032258064516
Saint Mary's,0.031,0.05,0.096,32.2425021422451,20.0,10.416666666666666
Northwestern,0.0,0.011,0.025,Inf,90.90909090909092,40.0
Kansas,0.0,0.008,0.020999999999999998,Inf,125.0,47.61904761904763
Dayton,0.0,0.013,0.026,Inf,76.92307692307692,38.46153846153846
Texas A&M,0.023,0.028,0.063,43.7777777777778,35.714285714285715,15.873015873015873
Wisconsin,0.01,0.024,0.045000000000000005,98.5,41.666666666666664,22.222222222222218
New Mexico,0.0,0.002,0.012,Inf,500.0,83.33333333333333
Stetson,0.0,0.004,0.013,Inf,250.0,76.92307692307692
BYU,0.018,0.023,0.05,56.0342516753537,43.47826086956522,20.0
Utah St.,0.0,0.005,0.013999999999999999,Inf,200.0,71.42857142857143
Boise St.,0.0,0.002,0.01,Inf,500.0,100.0
Samford,0.0,0.007,0.015,Inf,142.85714285714286,66.66666666666667
Grand Canyon,0.0,0.005,0.013000000000000001,Inf,200.0,76.92307692307692
N.C. State,0.0,0.006,0.014,Inf,166.66666666666666,71.42857142857143
Oregon,0.0,0.006,0.014,Inf,166.66666666666666,71.42857142857143
Colorado,0.0,0.007,0.014,Inf,142.85714285714286,71.42857142857143
Florida Atlantic,0.0,0.017,0.024,Inf,58.8235294117647,41.666666666666664
San Diego St.,0.0,0.005,0.012,Inf,200.0,83.33333333333333
Texas Tech,0.0,0.014,0.021,Inf,71.42857142857143,47.61904761904761
UAB,0.0,0.003,0.01,Inf,333.3333333333333,100.0
TCU,0.0,0.002,0.009000000000000001,Inf,500.0,111.1111111111111
Michigan St.,0.0,0.005,0.012,Inf,200.0,83.33333333333333
Texas,0.0,0.014,0.02,Inf,71.42857142857143,50.0
Washington St.,0.0,0.013,0.019,Inf,76.92307692307692,52.631578947368425
Virginia,0.0,0.007,0.013000000000000001,Inf,142.85714285714286,76.92307692307692
Nevada,0.0,0.004,0.009000000000000001,Inf,250.0,111.1111111111111
Drake,0.0,0.01,0.015,Inf,100.0,66.66666666666667
Long Beach St.,0.0,0.002,0.007,Inf,500.0,142.85714285714286
Saint Peter's,0.0,0.006,0.011,Inf,166.66666666666666,90.90909090909092
South Carolina,0.0,0.013,0.018,Inf,76.92307692307692,55.55555555555556
Mississippi St.,0.0,0.005,0.009000000000000001,Inf,200.0,111.1111111111111
Montana St.,0.0,0.005,0.009000000000000001,Inf,200.0,111.1111111111111
Oakland,0.0,0.004,0.008,Inf,250.0,125.0
Morehead St.,0.0,0.002,0.006,Inf,500.0,166.66666666666666
Howard,0.0,0.004,0.007,Inf,250.0,142.85714285714286
Western Kentucky,0.0,0.003,0.006,Inf,333.3333333333333,166.66666666666666
Nebraska,0.0,0.004,0.007,Inf,250.0,142.85714285714286
Colorado St.,0.0,0.007,0.01,Inf,142.85714285714286,100.0
Vermont,0.0,0.01,0.013000000000000001,Inf,100.0,76.92307692307692
Charleston,0.0,0.008,0.011,Inf,125.0,90.90909090909092
James Madison,0.0,0.005,0.007,Inf,200.0,142.85714285714286
McNeese St.,0.0,0.015,0.017,Inf,66.66666666666667,58.8235294117647
Yale,0.0,0.004,0.006,Inf,250.0,166.66666666666666
Wagner,0.0,0.007,0.009000000000000001,Inf,142.85714285714286,111.1111111111111
South Dakota St.,0.0,0.003,0.004,Inf,333.3333333333333,250.0
Longwood,0.0,0.003,0.004,Inf,333.3333333333333,250.0
Grambling St.,0.0,0.002,0.003,Inf,500.0,333.3333333333333
Duquesne,0.0,0.002,0.003,Inf,500.0,333.3333333333333
Colgate,0.0,0.004,0.004,Inf,250.0,250.0
Akron,0.0,0.003,0.003,Inf,333.3333333333333,333.3333333333333
