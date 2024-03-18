using CSV, DataFrames, StatsBase, BenchmarkTools, DataFramesMeta

Winner23 = ["Connecticut"]
FinalFour23 =["San Diego St.", "Connecticut", "Miami FL", "Florida Atlantic"]
EliteEight23 = ["San Diego St.", "Connecticut", "Miami FL", "Florida Atlantic", "Gonzaga", "Texas", "Kansas St.", "Creighton"]

Winner22 = ["Kansas"]
FinalFour22 = ["Kansas", "North Carolina", "Duke", "Villanova"]
EliteEight22 = ["Kansas", "North Carolina", "Duke", "Villanova", "Miami FL", "Houston", "Saint Peter's", "Arkansas"]

Winner21 = ["Baylor"]
FinalFour21 = ["Baylor", "Gonzaga", "UCLA", "Houston"]
EliteEight21 = ["Baylor", "Gonzaga", "UCLA", "Houston", "Oregon St.", "Arkansas", "Michigan", "USC"]

Winner19 = ["Virginia"]
FinalFour19 = ["Virginia", "Texas Tech", "Michigan St.", "Auburn"]
EliteEight19 = ["Virginia", "Texas Tech", "Michigan St.", "Auburn", "Kentucky", "Purdue", "Gonzaga", "Duke"]

Winner18 = ["Villanova"]
FinalFour18 = ["Villanova", "Michigan", "Loyola Chicago", "Kansas"]
EliteEight18 = ["Villanova", "Michigan", "Loyola Chicago", "Kansas", "Duke", "Texas Tech", "Florida St.", "Kansas St."]

Winner17 = ["North Carolina"]
FinalFour17 = ["Gonzaga", "South Carolina", "Oregon", "North Carolina"]
EliteEight17 = ["Gonzaga", "South Carolina", "Oregon", "North Carolina", "Kentucky", "Kansas", "Xavier", "Florida"]


function Clean(Summary, Roster, Torvik, Winner, FinalFour, EliteEight, Year)
    Sum = CSV.read(Summary, DataFrame)
    R = CSV.read(Roster, DataFrame)
    Tor = CSV.read(Torvik, DataFrame)


    select!(Sum, :TeamName => :Team, :Season, :seed => :Seed, :AdjTempo, :RankAdjTempo, :OE, :RankOE, :AdjOE, :RankAdjOE, 
       :DE, :RankDE, :AdjDE, :RankAdjDE, :AdjEM, :RankAdjEM
)
    dropmissing!(Sum) 
    Sum = Sum[(Sum.Seed .!= "NULL"), :]
    Sum.Seed = string.(Sum.Seed)
    Sum.Seed = parse.(Int64, Sum.Seed)
    select!(R, :TeamName => :Team, :Size, :SizeRank, :Exp, :ExpRank, :Bench, :BenchRank)


    rename!(Tor, :Column1 => :Team, :Column2 => :ADJOE, :Column3 => :ADJDE, :Column4 => :BARTHAG,
        :Column6 => :Wins, :Column7 => :G, :Column8 => :OEFG, :Column9 => :DEFG, :Column10 => :OFTR,
        :Column11 => :DFTR, :Column12 => :OTOR, :Column13 => :DTOR, :Column14 => :ORB, :Column15 => :DRB,
        :Column27 => :ADJTempo, :Column35 => :WAB) 
        
    Tor.Team = replace.(Tor.Team, "Louisiana Lafayette" => "Louisiana")
    Tor.Team = replace.(Tor.Team, "College of Charleston" => "Charleston")
    Tor.Team = replace.(Tor.Team, "North Carolina St." => "N.C. State")

    Tor.WABRank = competerank(Tor.WAB, rev=true)
    Tor.OEFGRank = competerank(Tor.OEFG, rev=true)
    Tor.DEFGRank = competerank(Tor.DEFG)
    Tor.OFTRRank = competerank(Tor.OFTR, rev=true)
    Tor.DFTRRank = competerank(Tor.DFTR)
    Tor.OTORRank = competerank(Tor.OTOR)
    Tor.DTORRank = competerank(Tor.DTOR, rev=true)
    Tor.ORBRank = competerank(Tor.ORB, rev=true)
    Tor.DRBRank = competerank(Tor.DRB, rev=true)

    select!(Tor, :Team, :WAB, :WABRank, :OEFG, :OEFGRank, :DEFG, :DEFGRank, :OFTR, :OFTRRank, 
        :DFTR, :DFTRRank, :OTOR, :OTORRank, :DTOR,  :DTORRank, :ORB,  :ORBRank, :DRB, :DRBRank)

    
    Cleaned = leftjoin(Sum, R, on=:Team, makeunique=true)
    leftjoin!(Cleaned, Tor, on=:Team, makeunique=true)
    Cleaned.Champ .= 0
    Cleaned.FinalFour .= 0
    Cleaned.EliteEight .= 0

    @. Cleaned.Champ = ifelse(Cleaned.Team ∈ [Winner], 1, Cleaned.Champ) 
    @. Cleaned.FinalFour = ifelse(Cleaned.Team ∈ [FinalFour], 1, Cleaned.FinalFour) 
    @. Cleaned.EliteEight = ifelse(Cleaned.Team ∈ [EliteEight], 1, Cleaned.EliteEight) 

    #println(counts(Cleaned.Champ))
    #println(counts(Cleaned.FinalFour))
    #println(counts(Cleaned.EliteEight))

    CSV.write("Cleaned$Year" * ".csv", Cleaned)
    return Cleaned
end

Cleaned24 = Clean("Sum24PreT.csv", "Roster24PreT.csv", "Tor24PreT.csv", Winner23, FinalFour23, EliteEight23, 23)
Cleaned23 = Clean("Sum23PreT.csv", "Roster23PreT.csv", "Tor23PreT.csv", Winner23, FinalFour23, EliteEight23, 23)
Cleaned22 = Clean("Sum22PreT.csv", "Roster22PreT.csv", "Tor22PreT.csv", Winner22, FinalFour22, EliteEight22, 22)
Cleaned21 = Clean("Sum21PreT.csv", "Roster21PreT.csv", "Tor21PreT.csv", Winner21, FinalFour21, EliteEight21, 21)
Cleaned19 = Clean("Sum19PreT.csv", "Roster19PreT.csv", "Tor19PreT.csv", Winner19, FinalFour19, EliteEight19, 19)
Cleaned18 = Clean("Sum18PreT.csv", "Roster18PreT.csv", "Tor18PreT.csv", Winner18, FinalFour18, EliteEight18, 18)
Cleaned17 = Clean("Sum17PreT.csv", "Roster17PreT.csv", "Tor17PreT.csv", Winner17, FinalFour17, EliteEight17, 17)



function Ranks(Clean, Year)
    Ranks = select(Clean, :Team, :Season, :Seed, :RankAdjTempo, :RankOE, :RankAdjOE, :RankDE, :RankAdjDE,
        :RankAdjEM, :SizeRank, :ExpRank, :BenchRank, :WABRank, :OEFGRank, :DEFGRank, :OFTRRank, :DFTRRank,
        :OTORRank, :DTORRank, :ORBRank, :DRBRank, :Champ, :FinalFour, :EliteEight)
    CSV.write("Ranks$Year" * ".csv", Ranks)
    return Ranks
end

Ranks24 = Ranks(Cleaned24, 24)
Ranks23 = Ranks(Cleaned23, 23)
Ranks22 = Ranks(Cleaned22, 22)
Ranks21 = Ranks(Cleaned21, 21)
Ranks19 = Ranks(Cleaned19, 19)
Ranks18 = Ranks(Cleaned18, 18)
Ranks17 = Ranks(Cleaned17, 17)


#do a norm function and fix the ranks names 
function Stats(Clean)
    Stats = select(Clean, :Team, :Season, :Seed, :AdjTempo, :OE, :AdjOE, :DE, :AdjDE,
    :AdjEM,  :Size, :Exp, :Bench, :WAB, :OEFG, :DEFG, :OFTR, :DFTR,
    :OTOR, :DTOR, :ORB, :DRB, :Champ, :FinalFour, :EliteEight)

    return Stats
end

Stats24 = Stats(Cleaned24)
Stats23 = Stats(Cleaned23)
Stats22 = Stats(Cleaned22)
Stats21 = Stats(Cleaned21)
Stats19 = Stats(Cleaned19)
Stats18 = Stats(Cleaned18)
Stats17 = Stats(Cleaned17)


function Stacking(DF23, DF22, DF21, DF19, DF18, DF17, Type)
    Stacked = vcat(DF23, DF22)
    Stacked = vcat(Stacked, DF21)
    Stacked = vcat(Stacked, DF19)
    Stacked = vcat(Stacked, DF18)
    Stacked = vcat(Stacked, DF17)
    CSV.write("AllYears$Type" * ".csv", Stacked)
    return Stacked
end
AllYearsRanks = Stacking(Ranks23, Ranks22, Ranks21, Ranks19, Ranks18, Ranks17, "Ranks")
AllYearsStats = Stacking(Stats23, Stats22, Stats21, Stats19, Stats18, Stats17, "Stats")

CSV.write("Stats24.csv", Stats24)
CSV.write("Ranks24.csv", Ranks24)

