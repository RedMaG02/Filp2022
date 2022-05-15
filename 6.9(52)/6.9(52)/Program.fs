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

let isProst x =
    let rec isProstRec x i count=
        if i = 1 then if count>1 then false else true
        else if x%i = 0 then isProstRec x (i-1) (count+1) else isProstRec x (i-1) count
    isProstRec x x 0

let  amountOfDividedByProst x pr =
    let rec amountOfDividedByProstRec x pr (i:int) counti (pow:float) =
        if pow > x then counti
        else 
            if x% Math.Pow(pr,i)= 0 then amountOfDividedByProstRec x pr (i+1) i (Math.Pow(pr,i)) else amountOfDividedByProstRec x pr (i+1) counti (Math.Pow(pr,i))
    amountOfDividedByProstRec x pr 1 1 pr       

let addToList (list:int list) x i =
    let rec addToListRec (list:int list) x i =
        if i = 0 then list
            else addToListRec (x::list) x (i-1)
    addToListRec list x i

let method60 x =
    let rec method60Rec x i (list:int list) =
        if i = 1 then (1::list)
        else if (x%i = 0) && (isProst i)  then method60Rec x (i-1) (addToList list i (amountOfDividedByProst ((float)x) i)) else method60Rec x (i-1) list
    method60Rec x x []

[<EntryPoint>]
let main argv =
    let x = 
        Convert.ToInt32(Console.ReadLine())
    writeList (method60 x)
    0 // return an integer exit code