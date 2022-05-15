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

let returnNegativeAndPositiveLists list =
    let rec returnNegativeAndPositiveListsRec list positiveList negativeList =
        match list with
        |[] -> positiveList@negativeList
        |head::tail ->
            if head < 0 then  returnNegativeAndPositiveListsRec tail positiveList (head::negativeList)
            else returnNegativeAndPositiveListsRec tail (head::positiveList) negativeList
    returnNegativeAndPositiveListsRec list [] []

[<EntryPoint>]
let main argv =
    let n =
        Convert.ToInt32(Console.ReadLine())
    let list =
        readList n 
    let newList = 
        returnNegativeAndPositiveLists list
    writeList newList
    0 // return an integer exit code