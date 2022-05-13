open System

let rec mult n =
    if n = 0 then 1
    else (n%10) * mult(n/10)

let rec multDel n = 
    let rec multHvost n acc =
        if n = 0 then acc
        else multHvost (n/10) (acc * (n%10))
    multHvost n 1
    

[<EntryPoint>]
let main argv =
    Console.WriteLine(mult (Convert.ToInt32(Console.ReadLine())))
    Console.WriteLine(multDel (Convert.ToInt32(Console.ReadLine())))
    0

    
