open System
open System.Windows.Forms
open System.Drawing
open System.IO

let form = new Form(Width=1920, Height = 1080, Text = "F# LAB9.5")
let picture1 = new PictureBox(SizeMode = PictureBoxSizeMode.AutoSize, Top = 0,Width=100,Height=100)
let button1 = new Button(Text="Убрать Аниме",Top=900,Width=200,Height=30,Left = 1500)


let list = ["J:\FILP\Filp2022\LAB9.5AAAAAAAA\LAB9.5AAAAAAAA\image1.png";"J:\FILP\Filp2022\LAB9.5AAAAAAAA\LAB9.5AAAAAAAA\image2.png";"J:\FILP\Filp2022\LAB9.5AAAAAAAA\LAB9.5AAAAAAAA\image3.png"]
let mutable n = 0
picture1.ImageLocation<-"J:\FILP\Filp2022\LAB9.5AAAAAAAA\LAB9.5AAAAAAAA\image1.png"


form.Controls.Add(picture1)
form.Controls.Add(button1)

let ClickButton _ = 
    if n > 1 then n <- -1
    n<-n+1
    picture1.ImageLocation<-List.item n list

let _ = button1.Click.Add(ClickButton)


Application.Run(form)
