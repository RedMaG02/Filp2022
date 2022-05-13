// Learn more about F# at http://docs.microsoft.com/dotnet/fsharp

open System

// Define a function to construct a message to print
let obolz14 x func init = 
    let rec z14 x func init del =
        if del = 0 then init
        else 
            let new_init = if x%del = 0 then func init del else init
            z14 x func new_init (del-1) 
    z14 x func init x

[<EntryPoint>]
let main argv =
    Console.WriteLine(obolz14 15 (fun x y -> x+y) 0)
    Console.WriteLine(obolz14 15 (fun x y -> x*y) 1)
    Console.WriteLine(obolz14 15 (fun x y -> if x>y then x else y) 0)
    Console.WriteLine(obolz14 15 (fun x y -> if x<y then x else y) 1)
    0 // return an integer exit code 1 3 5 15