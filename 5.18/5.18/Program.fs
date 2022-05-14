// Learn more about F# at http://docs.microsoft.com/dotnet/fsharp
//Метод 1 Найти количество четных чисел, не взаимно простых с данным
//Метод 2 Найти максимальную цифры числа, не делящуюся на 3
//Метод 3 Найти произведение максимального числа, не взаимно простого
//с данным, не делящегося на наименьший делитель исходно числа, и
//суммы цифр числа, меньших 5

open System

// Define a function to construct a message to print
let rec nod x y=
    if x = 0 || y = 0 
    then x + y
    else
        let new_x = if x > y then x % y else x
        let new_y = if x <= y then y % x else y
        nod new_x new_y


let method1 x = 
    let rec z15 x func init del = 
        if del = 0 then init 
        else 
            let new_init = if nod x del <> 1 && del%2 = 0 then func init del else init
            z15 x func new_init (del-1)
    z15 x (fun x y -> x + 1) 0 x

let method2 x =
    let rec maks3 x _max =
        if x = 0 then _max
        else if (x%10) > _max && (x%10)%3<>0 then maks3 (x/10) (x%10) else  maks3 (x/10) _max
    maks3 x 0      

let minDel x =
    let rec minDelproc x mindel del =
        if del = 1 then mindel 
            else if (x%del) = 0 then minDelproc x del (del-1) else minDelproc x mindel (del-1)
    minDelproc x x (x-1)                                      
    

let rec maks xx  x _max =
    if x = 0 then _max
        else if (x) > _max && (nod xx x) <> 1 && ((x)%(minDel xx))<>0 then maks xx (x-1) (x) else maks xx (x-1) _max
   
let Summm x = 
    let rec Summmproc x (sum:int)=
        if x = 0 then sum
            else if (x%10) < 5 then Summmproc (x/10) (sum+(x%10)) else Summmproc (x/10) sum
    Summmproc x 0

let method3 x =
    (maks x (x-1) 1) * Summm x
    
[<EntryPoint>]
let main argv =
    Console.WriteLine(method1 15) // 12 10 6  = 3
    Console.WriteLine(method2 76359 ) //7 
    Console.WriteLine(method3 15 ) // 12 10 9 6 5 3 -> mindel(15) = 3 -> 10%3 != 0 ->-> 10 * 1 = 10
    0 // return an integer exit code 14 13 11 8 7 4 2 1 (15 12 10 9 6 5 3 )