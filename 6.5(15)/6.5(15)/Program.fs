// Learn more about F# at http://docs.microsoft.com/dotnet/fsharp
// ЭТО 16 А НЕ 15!!!!!!!!!!!!!!
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


let findIndexByMaxAndPrevMax list = 
    let rec findMaxRec list max prevMax i curMaxI curPrevMaxI= 
        match list with
        |[] -> (curMaxI,curPrevMaxI)
        |head::tail ->
            if head>max then findMaxRec tail head max (i+1) i curMaxI 
                else if  head<max && head > prevMax then findMaxRec tail max head (i+1) curMaxI i
                    else    findMaxRec tail max prevMax (i+1) curMaxI curPrevMaxI
    findMaxRec list list.Head list.Head 0 0 0

let findAmountElementsBetween ab =
    if (fst ab) > (snd ab) then ((fst ab)-(snd ab) - 1) 
        else ((snd ab) - (fst ab) - 1)

[<EntryPoint>]
let main argv =
    let n = 
        Convert.ToInt32(Console.ReadLine())
    let list = 
        readList n
    findIndexByMaxAndPrevMax list |> findAmountElementsBetween |> printfn "Кол-во элементов: %d" 
    0 // return an integer exit code 