// Learn more about F# at http://docs.microsoft.com/dotnet/fsharp

open System

let readStringList n =
    let rec readStringListRec n strings=
        match n with 
        |0 -> strings
        |_ -> 
            let s = Console.ReadLine()
            let newStrings = strings @ [s]
            readStringListRec (n-1) newStrings
    readStringListRec n []

let rec writeList list= 
    List.iter (printfn "%s" ) list

let getASCIICode x = 
    int x - int '0'

let getAverageStringWeight string = 
    let AverageAscii = List.average (List.map (fun x-> (double)(getASCIICode x)) (Seq.toList string))
    AverageAscii

let sortByAverageASCII (strings:'string list) =
    let firstStringWeight = getAverageStringWeight strings.Head
    let sortedList = List.sortBy (fun x-> pown ((getAverageStringWeight x) - firstStringWeight) 2) strings.Tail
    sortedList




let isGlasn (x : char) =
    (x = 'а') || (x = 'и') || (x = 'е') || (x = 'ё') || (x = 'о') || (x = 'у') || (x = 'ы') || (x = 'э') || (x = 'ю') || (x = 'я') || (x = 'a') || (x = 'e') || (x = 'y') || (x = 'u') || (x = 'i') || (x = 'o')

let counts x y =
    if (isGlasn (snd y)) && (not (isGlasn (fst y))) then x + 1
        else if (isGlasn (fst y)) && (not(isGlasn(snd y))) then x - 1
                else x

let countSoch str =
    let unList = Seq.pairwise str
    Seq.fold counts 0 unList

let sortBySoch str_list : string list =
    Seq.toList (Seq.sortBy countSoch str_list)

let choose i=
    match i with 
    |1 -> sortByAverageASCII
    |2 -> sortBySoch
    |_ -> exit(0)

[<EntryPoint>]
let main argv =
    Console.WriteLine("Выберите задачу для решения и введите строку: \n Отсортировать строки в указанном порядке")
    Console.WriteLine("1 В порядке увеличения квадратичного отклонения среднего веса ASCII-кода символа строки от среднего веса ASCII-кода символа первой строки")
    Console.WriteLine("2 В порядке увеличения разницы между количеством сочетаний «гласная-согласная» и «согласная-гласная» в строке")
    let i =
        Convert.ToInt32(Console.ReadLine())
    let n = 
        Convert.ToInt32(Console.ReadLine())
    let stringList = 
        readStringList n
    let newList =
        choose i stringList
    writeList newList
    0 // return an integer exit code