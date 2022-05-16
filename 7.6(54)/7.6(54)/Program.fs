// Learn more about F# at http://docs.microsoft.com/dotnet/fsharp

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

let checkMoreThan3 list = 
    let countedList = List.countBy id list
    let filteredList = List.filter (fun x -> if snd x > 3 then true else false) countedList
    List.map fst filteredList

[<EntryPoint>]
let main argv =
    let n = 
        Convert.ToInt32(Console.ReadLine())
    let list = 
        readList n
    let newList =
        checkMoreThan3 list
    writeList newList
    0 // return an integer exit code