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

let findIndexByMax list = 
    let rec findMaxRec list max i curMaxI= 
        match list with
        |[] -> curMaxI
        |head::tail ->
            if head>max then findMaxRec tail head (i+1) i else findMaxRec tail max (i+1) curMaxI
    findMaxRec list list.Head 0 0

let findIndexByMin list = 
    let rec findMinRec list min i curMinI= 
        match list with
        |[] -> curMinI
        |head::tail ->
            if head<min then findMinRec tail head (i+1) i else findMinRec tail min (i+1) curMinI
    findMinRec list list.Head 0 0

let findAmountElementsBetween ab =
    if (fst ab) > (snd ab) then ((fst ab)-(snd ab) - 1) 
        else ((snd ab) - (fst ab) - 1)

[<EntryPoint>]
let main argv =
    let n =
        Convert.ToInt32(Console.ReadLine())
    let list =
        readList n
    let pair =
        (findIndexByMax list,findIndexByMin list)
    Console.WriteLine(findAmountElementsBetween pair)
    0 // return an integer exit code