open System
[<EntryPoint>]
let main argv =
    let answer n= 
        match n with
        |"f#"| "prolog" -> "Подлиза"
        |"c++" -> "Ну хоть не f#"
        |"c#"| "java" -> "Норм чел, объектно-ориентированный..."
        |_ -> "Не знаю таких..."
    let printx (x:string) =
        Console.WriteLine(x)
    let c = 
        Console.WriteLine("Любимый язык программирования?")
        Console.ReadLine();


    (answer>>printx) c


    Console.ReadLine() |> answer |> Console.WriteLine
    0