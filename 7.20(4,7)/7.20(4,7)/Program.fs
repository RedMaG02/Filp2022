// Learn more about F# at http://docs.microsoft.com/dotnet/fsharp

open System

let readStringList n =
    let rec readStringListRec n strings=
        match n with 
        |0 -> strings
        |_ -> 
            let s = Console.ReadLine()
            let newStrings = strings @ [s]
            readStringListRec (n-1) newStrings
    readStringListRec n []

let rec writeList list= 
    List.iter (printfn "%s" ) list

let getASCIICode x = 
    int x - int '0'

let getAverageStringWeight string = 
    let AverageAscii = List.average (List.map (fun x-> (double)(getASCIICode x)) (Seq.toList string))
    AverageAscii

let sortByAverageASCII (strings:'string list) =
    let firstStringWeight = getAverageStringWeight strings.Head
    let sortedList = List.sortBy (fun x-> pown ((getAverageStringWeight x) - firstStringWeight) 2) strings.Tail
    sortedList

[<EntryPoint>]
let main argv =

    0 // return an integer exit code