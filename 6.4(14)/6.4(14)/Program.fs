// Learn more about F# at http://docs.microsoft.com/dotnet/fsharp

open System

let rec readList n = 
    if n=0 then []
    else
        let Head = Convert.ToInt32(Console.ReadLine())
        let Tail = readList (n-1)
        Head::Tail

let rec writeList list= 
    match list with
    | [] -> ()
    | head::tail -> 
        printfn "%O" head
        writeList tail

let getAmountBetweenAandB list a b =
    let rec getAmountBetweenAandBRec list a b count=
        match list with
        |[] -> count
        |head::tail ->
            if head>a && head<b then getAmountBetweenAandBRec tail a b (count+1)
            else getAmountBetweenAandBRec tail a b count
    getAmountBetweenAandBRec list a b 0

[<EntryPoint>]
let main argv =
    let a =
        Convert.ToInt32(Console.ReadLine())
    let b =
        Convert.ToInt32(Console.ReadLine())
    let n =
        Convert.ToInt32(Console.ReadLine())
    let list =
        readList n
    Console.WriteLine(getAmountBetweenAandB list a b)
    0