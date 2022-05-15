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
    match list with
    | [] -> ()
    | head::tail -> 
        printfn "%O" head
        writeList tail


let findIndexByMax list = 
    let rec findMaxRec list max i curMaxI= 
        match list with
        |[] -> curMaxI
        |head::tail ->
            if head>max then findMaxRec tail head (i+1) i else findMaxRec tail max (i+1) curMaxI
    findMaxRec list list.Head 0 0


let findMin list = 
    let rec findMinRec list min = 
        match list with
        |[] -> min
        |head::tail ->
            if head<min then findMinRec tail head else findMinRec tail min
    findMinRec list list.Head


let findMax list = 
    let rec findMaxRec list max = 
        match list with
        |[] -> max
        |head::tail ->
            if head>max then findMaxRec tail head else findMaxRec tail max
    findMaxRec list list.Head


let reverseList list = 
    let rec reverseListRec list newList = 
        match list with
        | [] -> newList
        |_ -> reverseListRec list.Tail (list.Head::newList)
    reverseListRec list []


let setMinElementToIndex (list:int list) i (min:int)=
    let rec setMinElementToIndexRec (list:int list) i curI (headList:int list) (min:int)=
        if i = curI then  ((reverseList headList)@(min::list.Tail))
        else setMinElementToIndexRec list.Tail i (curI+1) (list.Head::headList) min
    setMinElementToIndexRec list i 0 [] min


let createListIndexDescending list =
    let rec createListIndexDescendingRec list indexList min=
        if findMax list = min then indexList
            else 
            let index =findIndexByMax  list
            createListIndexDescendingRec (setMinElementToIndex list index min) (index::indexList) min
    createListIndexDescendingRec list [] ((findMin list) - 1)


[<EntryPoint>]
let main argv =
    let n =
        Convert.ToInt32(Console.ReadLine())
    let list =
        readList n
    let IndexList =
        reverseList(createListIndexDescending list)
    writeList IndexList
    0 // return an integer exit code