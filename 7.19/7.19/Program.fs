// Learn more about F# at http://docs.microsoft.com/dotnet/fsharp

open System
// Define a function to construct a message to print

let checkPalindrome (str:string) =
    let charArray = str.ToCharArray()
    let reversedCharArray = Array.Reverse charArray
    let reversedString = (string)reversedCharArray
    if str = reversedString then 1
        else 0

let getAmountOfWords (str:string) =
    let strArray = str.Split(" ")
    let amount = Array.length strArray
    amount

let getAmountOfDifferentNumbers (str:string) =
    let charArray = str.ToCharArray()
    let newCharArray = Array.distinct charArray
    let amount = Array.length newCharArray
    amount

let choose x (str:string)=
    match x with 
    |1 -> checkPalindrome str
    |2 -> getAmountOfWords str
    |3 -> getAmountOfDifferentNumbers str
    |_ -> exit(0)

[<EntryPoint>]
let main argv =
    Console.WriteLine("Выберите задачу для решения и введите строку:")
    Console.WriteLine("1 проверить на палиндром")
    Console.WriteLine("2 посчитать количество строк")
    Console.WriteLine("3 посчитать количество уникальных символов в числе")
    let n =
        Convert.ToInt32(Console.ReadLine())
    let str =
        Console.ReadLine()
    Console.WriteLine(choose n str)
    0 // return an integer exit code