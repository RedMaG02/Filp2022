// Learn more about F# at http://docs.microsoft.com/dotnet/fsharp

open System

// Define a function to construct a message to print
let dividers x func init = 
    let rec z14 x func init del = 
        if del = 0 then init 
        else 
            let new_init = if x%del =0 && del>3 then func init del else init
            z14 x func new_init (del-1)
    z14 x func init x


let rec nod x y=
    if x = 0 || y = 0 
    then x + y
    else
        let new_x = if x > y then x % y else x
        let new_y = if x <= y then y % x else y
        nod new_x new_y


let vzaimProst x func init = 
    let rec z15 x func init del = 
        if del = 0 then init 
        else 
            let new_init = if nod x del = 1 && del>3 then func init del else init
            z15 x func new_init (del-1)
    z15 x func init x

[<EntryPoint>]
let main argv =
    Console.WriteLine(dividers 15 (fun x y -> x+y) 0)
    Console.WriteLine(dividers 15 (fun x y -> x*y) 1)
    Console.WriteLine(vzaimProst 15 (fun x y -> x+y) 0)
    Console.WriteLine(vzaimProst 15 (fun x y -> x*y) 1)
    0 // return an integer exit code