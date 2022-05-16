// Learn more about F# at http://docs.microsoft.com/dotnet/fsharp

open System

// Define a function to construct a message to print
let rec readList n = 
    if n=0 then []
    else
        let Head = Convert.ToDouble(Console.ReadLine())
        let Tail = readList (n-1)
        Head::Tail

let rec writeList list= 
    List.iter (printfn "%d" ) list

let checkType (x:float) =
    if x = (int) x then 0
    else 1

let checkList (list:float list) =
    let mapList = List.map checkType list
    let pairList = List.pairwise mapList
    let sumList = List.map (fun x -> fst x + snd x) pairList
    if List.min sumList = 1 &&  List.max sumList = 1 then true
        else false

[<EntryPoint>]
let main argv =
    let n = 
        Convert.ToInt32(Console.ReadLine())
    let list = 
        readList n
    if checkList list then Console.WriteLine("чередуются")
        else Console.WriteLine("не чередуются")
    0 // return an integer exit code