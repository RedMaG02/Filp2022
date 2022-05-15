// Learn more about F# at http://docs.microsoft.com/dotnet/fsharp

open System

let rec readList n = 
    if n=0 then []
    else
        let Head = Convert.ToInt32(Console.ReadLine())
        let Tail = readList (n-1)
        Head::Tail

let rec writeList list= 
    match list with
    | [] -> ()
    | head::tail -> 
        printfn "%O" head
        writeList tail

let getListBetweenAandB list a b =
    let rec getListAmountBetweenAandBRec list a b newList=
        match list with
        |[] -> newList
        |head::tail ->
            if head>a && head<b then getListAmountBetweenAandBRec tail a b (head::newList)
            else getListAmountBetweenAandBRec tail a b newList
    getListAmountBetweenAandBRec list a b []

let findMax list = 
    let rec findMaxRec list max = 
        match list with
        |[] -> max
        |head::tail ->
            if head>max then findMaxRec tail head else findMaxRec tail max
    findMaxRec list list.Head

[<EntryPoint>]
let main argv =
    let n = 
        Convert.ToInt32(Console.ReadLine())
    let list =
        readList n
    let a =
        Convert.ToInt32(Console.ReadLine())
    let b =
        Convert.ToInt32(Console.ReadLine())
    let newList =
        getListBetweenAandB list a b

    Console.WriteLine(findMax newList)
    0 // return an integer exit code