// Learn more about F# at http://docs.microsoft.com/dotnet/fsharp

open System

// Define a function to construct a message to print
let rec nod x y=
    if x = 0 || y = 0 
    then x + y
    else
        let new_x = if x > y then x % y else x
        let new_y = if x <= y then y % x else y
        nod new_x new_y

let obolz15 x func init = 
    let rec z15 x func init del = 
        if del = 0 then init 
        else 
            let new_init = if nod x del = 1 then func init del else init
            z15 x func new_init (del-1)
    z15 x func init x

let euler x =
        obolz15 x (fun a b -> a + 1) 0
    

[<EntryPoint>]
let main argv =
    Console.WriteLine(obolz15 15 (fun x y -> x+y) 0)
    Console.WriteLine(obolz15 15 (fun x y -> x*y) 1)
    Console.WriteLine(obolz15 15 (fun x y -> if x > y then x else y) 0)
    Console.WriteLine(obolz15 15 (fun x y -> if x<y then x else y) 1)
    Console.WriteLine(obolz15 15 (fun x y -> x+1) 0)
    Console.WriteLine(euler 5)
    0 // return an integer exit code 14 13 11 8 7 4 2 1