﻿// Learn more about F# at http://docs.microsoft.com/dotnet/fsharp

open System

// Define a function to construct a message to print
let rec readList n = 
    if n=0 then []
    else
        let Head = Convert.ToInt32(Console.ReadLine())
        let Tail = readList (n-1)
        Head::Tail

let rec writeList list= 
    List.iter (printfn "%d" ) list

let get2maximum list = 
    let pairList = List.indexed list
    let maxPair = List.maxBy snd pairList
    let maxIndex = fst maxPair
    let removeMaxList = List.removeAt maxIndex pairList
    let max2 = List.max removeMaxList
    (snd maxPair, snd max2)


[<EntryPoint>]
let main argv =
    let n = 
        Convert.ToInt32(Console.ReadLine())
    let list = 
        readList n
    let pair =
        get2maximum list
    printfn "%A %A" snd pair, snd pair
    0 // return an integer exit code