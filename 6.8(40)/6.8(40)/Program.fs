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

let findMin list = 
    let rec findMinRec list min = 
        match list with
        |[] -> min
        |head::tail ->
            if head<min then findMinRec tail head else findMinRec tail min
    findMinRec list list.Head

let deleteNotChetn list =
    let rec deleteNotChetnRec list newList =
        match list with
        |[] -> newList
        |head::tail ->
            if head%2 =0 then deleteNotChetnRec tail (head::newList)
                else deleteNotChetnRec tail newList
    deleteNotChetnRec list []

[<EntryPoint>]
let main argv =
    let n =
        Convert.ToInt32(Console.ReadLine())
    let list =
        readList n 
    let newList = 
        deleteNotChetn list
    if newList = [] then Console.WriteLine("Четных нет!")
        else Console.WriteLine(findMin newList)
    0 // return an integer exit code