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

let method11 list func =
    let rec method11rec list func new_list =
        match list with
        | [] -> new_list
        | head::t ->

            let head2 = if t <> [] then t.Head else 1
            let head3 = if t <> [] then (if t.Tail <> [] then t.Tail.Head else 1) else 1
            let procedure = func head head2 head3

            let redusedList = if t <> [] then (if t.Tail <> [] then t.Tail.Tail else []) else []

            method11rec redusedList func (procedure::new_list)

    method11rec list func []


[<EntryPoint>]
let main argv =
    let n = 
        Convert.ToInt32(Console.ReadLine())
    let list =
        readList n
    let newList =
        method11 list (fun x y z -> x+y+z)
    writeList newList
    0 // return an integer exit code