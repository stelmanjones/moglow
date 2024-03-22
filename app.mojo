import moglow.tty.terminal
from moglow import Style, Color


fn main() raises:
    var style = Style(Color.Blue, Color.Red)
    var def_style = Style(Color.Default, Color.Default)
    print(def_style("THIS SHOULD BE DEFAULT!"))
    var r_style = Style(Color.Red, Color.Default)
    print(r_style("Hello, This is a direct call!"))
    var s = style.sprintf("Hello, %s!", "World")
    var i = style.sprintf("Hello, %d", 1337)
    var f = style.sprintf("Hello, %d", Float64(1337.1337))

    print(s)
    print(i)
    print(f)
    print(terminal.hyperlink("https://github.com", "GitHub"))
