# NCCATour24
Attempting to predict the NCAA tournamet using a random forest model. It doesn't do a sim so it doesn't know who is playing who. The predictions are a mix of a random forest with a max depth of 5 and 250 trees. The stats used can be seen in the cleaing file, I'll list them here but just trying to get this up. The obvious erros with this model seems to be that teams have a better chance of winning the tournament than making that final four or elite eight. I beleive this comes from what Ken Barkely always says only a few teams can win but almost anyone can win 4. Since this model doesn't do a sim it doens't know its a tournament so its givig a lot of teams a chance to go far so the probablites are off. I would look at those columns for the order they are in not the probablites or odds and use that for your brackets or bets or whatever.

[NewT.csv](https://github.com/dlshew/NCCATour24/files/14629576/NewT.csv)
Team,Champ,FinalF,EliteE,ChampOdds,FinalFOdds,EliteEOdds
Connecticut,0.306349164164031,0.097,0.078,3.264,10.341,12.791
Purdue,0.183551704892763,0.066,0.065,5.448,15.164,15.322
North Carolina,0.0,0.033,0.052,Inf,30.296,19.239
Houston,0.0387886358200229,0.099,0.05,25.781,10.07,19.891
Iowa St.,0.0,0.029,0.048,Inf,35.071,20.844
Arizona,0.025460440641029,0.025,0.047,39.277,40.682,21.103
Creighton,0.0533792223669174,0.037,0.046,18.734,27.33,21.692
Auburn,0.0386291758577617,0.052,0.044,25.887,19.242,22.549
Tennessee,0.0,0.031,0.044,Inf,31.855,22.688
Illinois,0.0381507959709783,0.025,0.038,26.212,39.662,26.042
Baylor,0.0180056874053206,0.016,0.034,55.538,63.849,29.408
Alabama,0.0387886358200229,0.038,0.032,25.781,26.614,31.245
Marquette,0.0,0.026,0.028,Inf,37.87,36.319
Gonzaga,0.0,0.036,0.027,Inf,27.756,36.976
Kentucky,0.0464028490179924,0.029,0.021,21.55,35.071,48.402
Duke,0.0157068062827225,0.022,0.019,63.667,45.931,51.386
Florida,0.0355329949238579,0.004,0.017,28.143,237.318,57.323
Clemson,0.0203045685279188,0.006,0.016,49.25,165.578,63.679
Saint Mary's,0.0310149626597922,0.019,0.015,32.243,51.591,65.161
Northwestern,0.0,0.011,0.014,Inf,92.464,73.932
Kansas,0.0,0.008,0.013,Inf,128.278,75.033
Dayton,0.0,0.013,0.013,Inf,77.81,76.378
Texas A&M,0.0228426395939086,0.005,0.012,43.778,200.561,86.458
Wisconsin,0.0101522842639594,0.014,0.011,98.5,71.194,93.252
New Mexico,0.0,0.002,0.01,Inf,445.0,103.704
Stetson,0.0,0.004,0.009,Inf,233.431,107.611
BYU,0.0178462274430595,0.005,0.009,56.034,192.417,113.124
Utah St.,0.0,0.005,0.009,Inf,184.928,115.989
Boise St.,0.0,0.002,0.008,Inf,490.985,124.12
Samford,0.0,0.007,0.008,Inf,134.332,124.427
Grand Canyon,0.0,0.005,0.008,Inf,219.054,126.298
N.C. State,0.0,0.006,0.008,Inf,178.0,127.197
Oregon,0.0,0.006,0.008,Inf,180.251,128.495
Colorado,0.0,0.007,0.007,Inf,148.321,133.896
Florida Atlantic,0.0,0.017,0.007,Inf,60.592,140.161
San Diego St.,0.0,0.005,0.007,Inf,215.738,140.945
Texas Tech,0.0,0.014,0.007,Inf,70.146,141.738
UAB,0.0,0.003,0.007,Inf,365.119,144.097
TCU,0.0,0.002,0.007,Inf,474.636,151.835
Michigan St.,0.0,0.005,0.007,Inf,200.561,153.687
Texas,0.0,0.014,0.006,Inf,73.4,164.108
Washington St.,0.0,0.013,0.006,Inf,79.547,168.397
Virginia,0.0,0.007,0.006,Inf,139.594,172.431
Nevada,0.0,0.004,0.005,Inf,254.286,185.536
Drake,0.0,0.01,0.005,Inf,100.991,186.912
Long Beach St.,0.0,0.002,0.005,Inf,459.34,206.558
Saint Peter's,0.0,0.006,0.005,Inf,177.982,212.66
South Carolina,0.0,0.013,0.005,Inf,74.943,218.964
Mississippi St.,0.0,0.005,0.004,Inf,209.4,222.837
Montana St.,0.0,0.005,0.004,Inf,215.738,236.23
Oakland,0.0,0.004,0.004,Inf,229.67,245.221
Morehead St.,0.0,0.002,0.004,Inf,490.985,259.09
Howard,0.0,0.004,0.003,Inf,245.492,286.556
Western Kentucky,0.0,0.003,0.003,Inf,384.834,294.942
Nebraska,0.0,0.004,0.003,Inf,273.825,325.041
Colorado St.,0.0,0.007,0.003,Inf,139.605,351.871
Vermont,0.0,0.01,0.003,Inf,103.93,361.981
Charleston,0.0,0.008,0.003,Inf,128.287,383.528
James Madison,0.0,0.005,0.002,Inf,192.417,447.653
McNeese St.,0.0,0.015,0.002,Inf,64.721,510.308
Yale,0.0,0.004,0.002,Inf,233.431,566.667
Wagner,0.0,0.007,0.002,Inf,145.297,579.704
South Dakota St.,0.0,0.003,0.001,Inf,339.0,698.861
Longwood,0.0,0.003,0.001,Inf,384.834,708.69
Grambling St.,0.0,0.002,0.001,Inf,593.333,1186.713
Duquesne,0.0,0.002,0.001,Inf,593.333,1700.0
Colgate,0.0,0.004,0.0,Inf,249.794,3646.0
Akron,0.0,0.003,0.0,Inf,384.834,Inf
