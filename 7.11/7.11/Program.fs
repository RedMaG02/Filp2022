// Learn more about F# at http://docs.microsoft.com/dotnet/fsharp

open System

let rec readList n = 
    if n=0 then []
    else
        let Head = Convert.ToInt32(Console.ReadLine())
        let Tail = readList (n-1)
        Head::Tail

let rec writeList list= 
    List.iter (printfn "%d" ) list

// Define a function to construct a message to print
let method4 list =
    let pairList = List.indexed list
    let pairList2 = List.sortByDescending (snd) pairList
    List.map fst pairList2

[<EntryPoint>]
let main argv =
    let n = 
        Convert.ToInt32(Console.ReadLine())
    let list = 
        readList n
    let newList =
        method4 list
    writeList newList
    0 // return an integer exit code