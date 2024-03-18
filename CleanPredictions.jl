using CSV, DataFrames, StatsBase

New = CSV.read("NewTourney24.csv", DataFrame)

New.Champ =  round.(New.Champ, digits=3) 
New.FinalF = round.(New.FinalF, digits=3) 
New.EliteE = round.(New.EliteE, digits=3) 
New.FinalF = New.FinalF .+ New.Champ
New.EliteE = New.EliteE .+ New.FinalF .+ New.Champ
New.FinalFOdds = 1 ./ New.FinalF
New.EliteEOdds = 1 ./ New.EliteE
sort!(New, :FinalF, rev=true)
show(New, allrows=true)

CSV.write("NewT.csv", New)
