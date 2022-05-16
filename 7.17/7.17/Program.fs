// Learn more about F# at http://docs.microsoft.com/dotnet/fsharp

open System

// Define a function to construct a message to print
let rec readList n = 
    if n=0 then []
    else
        let Head = Convert.ToInt32(Console.ReadLine())
        let Tail = readList (n-1)
        Head::Tail

let writeList list =
    let print x =
        match x with
        (s1, s2, s3) -> printf "(%d, %d, %d)\n" s1 s2 s3
    List.iter print list

let getAll3elmList list =
    let pairList = List.allPairs list list
    let (pairPairList:(int*(int*int)) list) = List.allPairs list pairList // тут убогий список получился (х,(х,х))
    pairPairList

let third (_,(_,x)) = x
let second (_,(x,_)) = x

let getPifagorList (list:(int*(int*int)) list) =
    let pifList = List.filter (fun x -> if (fst x) * (fst x) + (second x) * (second x) = (third x) * (third x) then true else false) list
    pifList
    

// в ответе получить список (a,b,c) значит мой костыль не подходит............

let getABC (x:(int*(int*int))) =
    let (a,b,c) = fst x, second x, third x
    (a,b,c)

let getABCList (list:(int*(int*int)) list) =
    List.map getABC list

[<EntryPoint>]
let main argv =
    let n = 
        Convert.ToInt32(Console.ReadLine())
    let list = 
        readList n
    let get3elList =
        getAll3elmList  list
    let pifList =
        getPifagorList get3elList
    let abcList =
        getABCList pifList
    writeList abcList
    0 // return an integer exit code


    //let getABC (x:(int*(int*int))) =
        //let (a,b,c) = fst x, second x, third x
        //(a,b,c)
    
    //let getABCList (list:(int*(int*int)) list) =
        //List.map getABC list