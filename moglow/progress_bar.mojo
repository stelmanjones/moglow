from os.atomic import Atomic
from moglow.tty import get_term_size
from moglow import tty
from moglow import Color, Style

let PROGRESS: String = "━"


struct ProgressBar:
    var char: String
    var width: Int
    var value: Float64
    var max: Int
    var started: Bool
    var style: Style
    var transient: Bool

    fn __init__(
        inout self,
        width: Int = 0,
        max: Int = 100,
        color: Color = Color.Default,
        transient: Bool = False,
        char: String = "━",
    ) raises:
        self.char = char
        if width == 0:
            self.width = int(get_term_size().width * 0.8)
        else:
            self.width = width
        self.value = 0
        self.max = max
        self.started = False
        self.style = Style(fg=color)
        self.transient = transient

    fn reset(inout self):
        _ = self.value = 0

    fn increment(inout self, n: Int = 1) raises:
        let res = self.value + n
        if res > self.max:
            self.style = Style(fg=Color.Red)
            self.render()
            raise Error("\n n cannot be greater than max.")
        else:
            self.value = res
        self.render()

    fn set(inout self, n: Int) raises:
        if n > self.max:
            raise Error("\n n cannot be greater than max.")
        else:
            self.value = n

    fn render(self):
        var s: String = ""
        for i in range(self.width):
            if i < int(self.value * self.width / self.max):
                s += self.char
            else:
                s += " "
        let p = int(self.value * 100 / self.max)
        tty.erase_line()
        print_no_newline(self.style.string_render(s) + " " + str(p) + "%")

    fn string_render(self) -> String:
        var s: String = ""
        for i in range(self.width):
            if i < int(self.value * self.width / self.max):
                s += self.char
            else:
                s += " "

        let p = int(self.value * 100 / self.max)
        return self.style.string_render(s) + " " + str(p) + "%"
