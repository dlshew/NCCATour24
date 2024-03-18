using CSV, DataFrames, DataFramesMeta, Random, MLJ

Forest = @load RandomForestClassifier pkg=DecisionTree
forest = Forest(max_depth=5, n_trees=250)
Random.seed!(123)

#going to have to read the big CSV later just getting set up with 2023 data 
function ForestWin(DF, Type, model)
    Data = CSV.read(DF, DataFrame)
    shuffle!(Data)
    #show(Data[:, 3:21], allcols=true)

    Train, Test = partition(Data, .70)
    yTrain, XTrain = unpack(Train, ==(:Champ))
    yTest, XTest = unpack(Test, ==(:Champ))
    yTrainP = coerce(yTrain, Multiclass)

    mach = machine(model, XTrain[:, 3:21], yTrainP) |> fit!
    yhat = predict(mach, XTest[:, 3:21])
    #display([yTestPower yhatPower])
    println(log_loss(yhat, yTest))
    MLJ.save("Champ$Type" * "Forest.jlso", mach)
end
println("Champ")
RanksWin = ForestWin("AllYearsRanks.csv", "Ranks", forest)
StatsWin = ForestWin("AllYearsStats.csv", "Stats", forest)
println("")

function ForestFinalFour(DF, Type, model)
    Data = CSV.read(DF, DataFrame)
    shuffle!(Data)
    #show(Data[:, 3:21], allcols=true)

    Train, Test = partition(Data, .70)
    yTrain, XTrain = unpack(Train, ==(:FinalFour))
    yTest, XTest = unpack(Test, ==(:FinalFour))
    yTrainP = coerce(yTrain, Multiclass)

    mach = machine(model, XTrain[:, 3:21], yTrainP) |> fit!
    yhat = predict(mach, XTest[:, 3:21])
    #display([yTestPower yhatPower])
    println(log_loss(yhat, yTest))
    MLJ.save("FinalFour$Type" * "Forest.jlso", mach)
end

println("FinalFour")
ForestFinalFour("AllYearsRanks.csv", "Ranks", forest)
ForestFinalFour("AllYearsStats.csv", "Stats", forest)
println("")


function ForestEliteEight(DF, Type, model)
    Data = CSV.read(DF, DataFrame)
    shuffle!(Data)
    #show(Data[:, 3:21], allcols=true)

    Train, Test = partition(Data, .70)
    yTrain, XTrain = unpack(Train, ==(:EliteEight))
    yTest, XTest = unpack(Test, ==(:EliteEight))
    yTrainP = coerce(yTrain, Multiclass)

    mach = machine(model, XTrain[:, 3:21], yTrainP) |> fit!
    yhat = predict(mach, XTest[:, 3:21])
    #display([yTestPower yhatPower])
    println(log_loss(yhat, yTest))
    MLJ.save("EliteEight$Type" * "Forest.jlso", mach)
end

println("Elite Eight")
ForestEliteEight("AllYearsRanks.csv", "Ranks", forest)
ForestEliteEight("AllYearsStats.csv", "Stats", forest)
