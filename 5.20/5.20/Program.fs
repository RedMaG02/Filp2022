// Learn more about F# at http://docs.microsoft.com/dotnet/fsharp

open System

// Define a function to construct a message to print
let rec nod x y=
    if x = 0 || y = 0 
    then x + y
    else
        let new_x = if x > y then x % y else x
        let new_y = if x <= y then y % x else y
        nod new_x new_y


let NumberOfChetnNotVzaimProstWithX x = 
    let rec z15 x func init del = 
        if del = 0 then init 
        else 
            let new_init = if nod x del <> 1 && del%2 = 0 then func init del else init
            z15 x func new_init (del-1)
    z15 x (fun x y -> x + 1) 0 x

let MaksCifrChislaNotDividedBy3 x =
    let rec maks3 x _max =
        if x = 0 then _max
        else if (x%10) > _max && (x%10)%3<>0 then maks3 (x/10) (x%10) else  maks3 (x/10) _max
    maks3 x 0      

let minDel x =
    let rec minDelproc x mindel del =
        if del = 1 then mindel 
            else if (x%del) = 0 then minDelproc x del (del-1) else minDelproc x mindel (del-1)
    minDelproc x x (x-1)                                      
    

let rec MaksWhichNodWithXNot1AndNotDividedByMinimalDiviDerOfXX xx  x _max =
    if x = 0 then _max
        else if (x) > _max && (nod xx x) <> 1 && ((x)%(minDel xx))<>0 then MaksWhichNodWithXNot1AndNotDividedByMinimalDiviDerOfXX xx (x-1) (x) else MaksWhichNodWithXNot1AndNotDividedByMinimalDiviDerOfXX xx (x-1) _max
   
let SumOfNumversWhichLowerThan5 x = 
    let rec Summmproc x (sum:int)=
        if x = 0 then sum
            else if (x%10) < 5 then Summmproc (x/10) (sum+(x%10)) else Summmproc (x/10) sum
    Summmproc x 0

let method3 x =
    (MaksWhichNodWithXNot1AndNotDividedByMinimalDiviDerOfXX x (x-1) 1) * SumOfNumversWhichLowerThan5 x
    
let GetMethod x  =
    match x with 
    | 1 -> NumberOfChetnNotVzaimProstWithX 
    | 2 -> MaksCifrChislaNotDividedBy3 
    | 3 -> method3 
    |_ -> exit(0) 


let print (x:int) =
      Console.WriteLine(x)

[<EntryPoint>]
let main argv =
        let input = (Console.ReadLine() |> Int32.Parse, Console.ReadLine() |> Int32.Parse)        
        print (GetMethod (fst input) (snd input))     // Оператор каррирования    
        (GetMethod (fst input) >> print) (snd input)  // Оператор суперпозиции   
        0