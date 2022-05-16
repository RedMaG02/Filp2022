// Learn more about F# at http://docs.microsoft.com/dotnet/fsharp

open System

// Define a function to construct a message to print
let writeArray array =
    Array.iter (printf "%d ") array

let arrayDividedBy3 array =
    Array.filter (fun x -> x % 3 = 0) array

[<EntryPoint>]
let main argv =
    [|1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12|] |> arrayDividedBy3 |> writeArray
    0 // return an integer exit code