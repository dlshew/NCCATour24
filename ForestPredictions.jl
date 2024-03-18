using CSV, DataFrames, DataFramesMeta, MLJ

Forest = @load RandomForestClassifier pkg=DecisionTree
RanksChampForest = machine("ChampRanksForest.jlso")
RanksFinalFourForest = machine("FinalFourRanksForest.jlso")
RanksEliteEightForest = machine("EliteEightRanksForest.jlso")

StatsChampForest = machine("ChampStatsForest.jlso")
StatsFinalFourForest = machine("FinalFourStatsForest.jlso")
StatsEliteEightForest = machine("EliteEightStatsForest.jlso")

function RankForest(Data, Mach)
    Data = CSV.read(Data, DataFrame)
    
    Prediction = predict(Mach, Data[:, 3:21])
    Data.YesRanks .= broadcast(pdf, Prediction, 1)
    Data.YesRanks .= Data.YesRanks ./ sum(Data.YesRanks)

    select!(Data, :Seed, :Team, :YesRanks)
    sort!(Data, :YesRanks, rev=true)

    return Data
end
#just seeing if the code works with 2023
ChampRanks = RankForest("Ranks24.csv", RanksChampForest)
FinalFourRanks = RankForest("Ranks24.csv", RanksFinalFourForest)
EliteEightRanks = RankForest("Ranks24.csv", RanksEliteEightForest)

Ranks = leftjoin(ChampRanks, FinalFourRanks, on=:Team, makeunique=true)
leftjoin!(Ranks, EliteEightRanks, on=:Team, makeunique=true)
select!(Ranks, :Team, :Seed, :YesRanks => :ChampProbR, :YesRanks_1 => :FFProbR, :YesRanks_2 => :EEProbR)
sort!(Ranks, :ChampProbR, rev=true)


ChampStats = RankForest("Stats24.csv", StatsChampForest)
FinalFourStats = RankForest("Stats24.csv", StatsFinalFourForest)
EliteEightStats = RankForest("Stats24.csv", StatsEliteEightForest)

Stats = leftjoin(ChampStats, FinalFourStats, on=:Team, makeunique=true)
leftjoin!(Stats, EliteEightStats, on=:Team, makeunique=true)
select!(Stats, :Team, :Seed, :YesRanks => :ChampProbS, :YesRanks_1 => :FFProbS, :YesRanks_2 => :EEProbS)
sort!(Stats, :ChampProbS, rev=true)


Probs1 = leftjoin(Ranks, Stats, on=:Team, makeunique=true)
Probs1.Champ = (Probs1.ChampProbR .+ Probs1.ChampProbS) ./ 2
Probs1.FinalF = (Probs1.FFProbR .+ Probs1.FFProbS) ./ 2
Probs1.EliteE = (Probs1.EEProbR .+ Probs1.EEProbS) ./ 2

Probs = select(Probs1, :Team, :Champ, :FinalF, :EliteE)
Probs.ChampOdds = 1 ./ Probs.Champ
Probs.FinalFOdds = 1 ./ Probs.FinalF
Probs.EliteEOdds = 1 ./ Probs.EliteE
sort!(Probs, :Champ, rev=true)
show(Probs1, allrows=true)
show(Probs, allrows=true)

CSV.write("Tourney24.csv", Probs)
