open System

let answer n= 
    match n with
    |"f#"| "prolog" -> "Подлиза"
    |"c++" -> "Ну хоть не f#"
    |"c#"| "java" -> "Норм чел, объектно-ориентированный..."
    |_ -> "Не знаю таких..."

[<EntryPoint>]
let main argv =
    Console.WriteLine("Любимый язык программирования?")
    Console.WriteLine(answer (Console.ReadLine()))
    0
