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

let findMax list = 
    let rec findMaxRec list max = 
        match list with
        |[] -> max
        |head::tail ->
            if head>max then findMaxRec tail head else findMaxRec tail max
    findMaxRec list list.Head

let takeValueByIndex (list : int list) n =
    let rec takeValueByIndexRec (list : int list) i = 
        match i with
        |0 -> list.Head
        |_ -> takeValueByIndexRec list.Tail (i-1)
    takeValueByIndexRec list n

[<EntryPoint>]
let main argv =
    let n = 
        Convert.ToInt32(Console.ReadLine())
    let list = 
        readList n
    let i = 
        Convert.ToInt32(Console.ReadLine())
    if (findMax list) = (takeValueByIndex list i) then Console.WriteLine("Значение по индексу является глобальным максимумом")
        else Console.WriteLine("Значение по индексу не является глобальным максимумом")
    0 // return an integer exit code