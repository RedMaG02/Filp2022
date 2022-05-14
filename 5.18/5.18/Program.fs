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
    
[<EntryPoint>]
let main argv =
    Console.WriteLine(method1 15)
    Console.WriteLine(method2 76359 )
    0 // return an integer exit code 14 13 11 8 7 4 2 1 (15 12 10 9 6 5 3 )