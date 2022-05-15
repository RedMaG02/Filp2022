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

let getAmount list a b =
    let check x =
        x > a && x < b
    List.fold (fun s x -> if check x then s + 1 else s ) 0 list

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
    Console.WriteLine(getAmount list a b )
    0 // return an integer exit code