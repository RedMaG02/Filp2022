// Learn more about F# at http://docs.microsoft.com/dotnet/fsharp

open System

// Define a function to construct a message to print
let from whom =
    sprintf "from %s" whom

let rec proizv x =
    match x with
    |0 -> 1
    |_ -> proizv (x/10) * (x%10)

let obolProizvHvost x = 
     let rec proizvHvost x pr=
         match x with
         |0 -> pr
         |_ -> proizvHvost (x/10)  pr*(x%10)
     proizvHvost x 1

let rec minUp x=
    if x<10 then x
    else if (x%10) < minUp(x/10) then x%10
    else minUp(x/10)

let rec maxUp x=
    if x<10 then x
    else if (x%10) > minUp(x/10) then x%10
    else minUp(x/10)

let minDownObol x=
    let rec minDown x pr =
        match x with
        |0 -> pr
        |_ -> if (x%10<pr) then minDown (x/10) (x%10) else minDown (x/10) pr
    minDown x 9

let maxDownObol x=
    let rec maxDown x pr =
        match x with
        |0 -> pr
        |_ -> if (x%10>pr) then maxDown (x/10) (x%10) else maxDown (x/10) pr
    maxDown x 0

[<EntryPoint>]
let main argv =
    Console.WriteLine(proizv 1256)
    Console.WriteLine(obolProizvHvost 1256)
    Console.WriteLine(minUp 7234327)
    Console.WriteLine(maxUp 7234327)
    Console.WriteLine(minDownObol 7234327)
    Console.WriteLine(maxDownObol 7234327)
    0 // return an integer exit code