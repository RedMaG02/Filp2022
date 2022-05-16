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

let getElements list a b =
    let check x =
        x >= a && x <= b
    List.filter check  list

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
        getElements list a b
    writeList newList
    0 // return an integer exit code