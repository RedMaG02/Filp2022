// Learn more about F# at http://docs.microsoft.com/dotnet/fsharp

open System
// Define a function to construct a message to print

let checkPalindrome (str:string) =
    let charArray = str.ToCharArray()
    let reversedCharArray = Array.Reverse charArray
    let reversedString = (string)reversedCharArray
    if str = reversedString then true
        else false

let getAmountOfWords (str:string) =
    let strArray = str.Split(" ")
    let amount = Array.length strArray
    amount

let getAmountOfDifferentNumbers (str:string) =
    let charArray = str.ToCharArray()
    let newCharArray = Array.distinct charArray
    let amount = Array.length newCharArray
    amount

[<EntryPoint>]
let main argv =
    let message = from "F#" // Call the function
    printfn "Hello world %s" message
    0 // return an integer exit code