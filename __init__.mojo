from collections.dict import Dict
from .collections import StringKey
from testing import assert_true
from .tty import replace
from moglow.traits import Colorable, ANSIable


fn convert_base16_to_base10(value: String) raises -> Int:
    """Converts a base 16 number to base 10.
    https://www.catalyst2.com/knowledgebase/dictionary/hexadecimal-base-16-numbers/#:~:text=To%20convert%20the%20hex%20number,16%20%2B%200%20%3D%2016).
    """
    var mapping = Dict[StringKey, Int]()
    mapping["0"] = 0
    mapping["1"] = 1
    mapping["2"] = 2
    mapping["3"] = 3
    mapping["4"] = 4
    mapping["5"] = 5
    mapping["6"] = 6
    mapping["7"] = 7
    mapping["8"] = 8
    mapping["9"] = 9
    mapping["a"] = 10
    mapping["b"] = 11
    mapping["c"] = 12
    mapping["d"] = 13
    mapping["e"] = 14
    mapping["f"] = 15

    var length = len(value)
    var sum: Int = 0
    for i in range(length - 1, -1, -1):
        var exponent = length - 1 - i
        sum += mapping[value[i]] * (16**exponent)

    return sum


@value
struct ColorType(Stringable):
    var value: Int

    alias Foreground = ColorType(3)
    alias Background = ColorType(4)
    alias BrightForeground = ColorType(9)
    alias BrightBackground = ColorType(10)

    fn __str__(self) -> String:
        return self.value


@value
struct ColorRGB(Colorable):
    var r: UInt8
    var g: UInt8
    var b: UInt8

    fn __init__(inout self, r: UInt8, g: UInt8, b: UInt8):
        self.r = r
        self.g = g
        self.b = b

    fn __copyinit__(inout self, other: ColorRGB):
        self.r = other.r
        self.g = other.g
        self.b = other.b

    fn __eq__(self, other: ColorRGB) -> Bool:
        return self.r == other.r and self.g == other.g and self.b == other.b

    fn __str__(self) -> String:
        return "38;2;{" + str(self.r) + "};{" + self.g + "};{" + self.b + "}"

    fn as_fg(self) -> String:
        return "38;2;" + str(self.r) + ";" + self.g + ";" + self.b

    fn as_bg(self) -> String:
        return "48;2;" + str(self.r) + ";" + self.g + ";" + self.b

    @staticmethod
    fn from_hex(self, value: String) raises -> ColorRGB:
        """Converts a hex color to RGB.

        Args:
            self: ColorRGB.
            value: Hex color value.

        Returns:
            RGB color.
        """

        var hex = value[1:]
        var indices: DynamicVector[Int] = DynamicVector[Int]()
        indices.append(0)
        indices.append(2)
        indices.append(4)

        var results: DynamicVector[Int] = DynamicVector[Int]()
        for i in range(len(indices)):
            var base_10 = convert_base16_to_base10(hex[indices[i] : indices[i] + 2])
            results.append(atol(base_10))

        return ColorRGB(results[0], results[1], results[2])


@value
struct FontStyle(Stringable, Intable):
    var value: Int

    alias Bold = FontStyle(1)
    alias Dim = FontStyle(2)
    alias Italic = FontStyle(3)
    alias Underline = FontStyle(4)
    alias Blinking = FontStyle(5)
    alias Inverse = FontStyle(7)
    alias Hidden = FontStyle(8)
    alias Strikethrough = FontStyle(9)

    fn __str__(self) -> String:
        return self.value

    fn __int__(self) -> Int:
        return self.value

    fn __eq__(self, other: FontStyle) -> Bool:
        return self.value == other.value


@value
struct Color(Colorable):
    var value: Int
    var bright: Bool

    alias Black = Color(0)
    alias Red = Color(1)
    alias Green = Color(2)
    alias Yellow = Color(3)
    alias Blue = Color(4)
    alias Magenta = Color(5)
    alias Cyan = Color(6)
    alias White = Color(7)
    alias Default = Color(9)
    alias BrightBlack = Color(0, True)
    alias BrightRed = Color(1, True)
    alias BrightGreen = Color(2, True)
    alias BrightYellow = Color(3, True)
    alias BrightBlue = Color(4, True)
    alias BrightMagenta = Color(5, True)
    alias BrightCyan = Color(6, True)
    alias BrightWhite = Color(7, True)

    fn __init__(inout self, value: Int, bright: Bool = False):
        self.value = value
        self.bright = bright

    fn __copyinit__(inout self, other: Color):
        self.value = other.value
        self.bright = other.bright

    fn __gt__(self, other: Color) -> Bool:
        return self.value > other.value

    fn __lt__(self, other: Color) -> Bool:
        return self.value < other.value

    fn __str__(self) -> String:
        return self.value

    fn __int__(self) -> Int:
        return self.value

    fn __eq__(self, other: Color) -> Bool:
        return self.value == other.value

    fn as_fg(self) -> String:
        var prefix: String
        if self.bright:
            prefix = "9"
        else:
            prefix = "3"
        return prefix + str(self.value)

    fn as_bg(self) -> String:
        var prefix: String
        if self.bright:
            prefix = "10"
        else:
            prefix = "4"
        return prefix + str(self.value)


struct Style[T: Colorable, U: Colorable](ANSIable, Stringable):
    var fg: T
    var bg: U
    var style: FontStyle

    fn __init__(
        inout self,
        fg: T = Color.Default,
        bg: U = Color.Default,
        style: FontStyle = FontStyle(0),
    ):
        self.fg = fg
        self.bg = bg
        self.style = style

    fn sequence(self, escaped: Bool = False) -> String:
        """
        Return the ANSI escape sequence for this style.
        If `escaped` is `True`, the sequence will be escaped for use in a string literal.
        """

        var csi: String

        if escaped:
            csi = "\\x1b["
        else:
            csi = "\x1b["
        return (
            csi + str(self.style) + ";" + self.fg.as_fg() + ";" + self.bg.as_bg() + "m"
        )

    fn __str__(self) -> String:
        var csi = "\x1b["
        return (
            csi + str(self.style) + ";" + str(self.fg) + ";" + "4" + str(self.bg) + "m"
        )

    fn __call__(self, s: String) -> String:
        """
        Return the given string with this style applied.
        """
        return self.sequence() + s + self.reset()

    fn reset(self) -> String:
        """
        Return the ANSI reset sequence.
        """
        return "\x1b[0m"

    fn set_fg(inout self, color: Color, bright: Bool = False):
        """
        Set the foreground color to the given value.
        """
        self.fg = color

    fn set_bg(inout self, color: Color, bright: Bool = False):
        """
        Set the background color to the given value.
        """
        self.bg = color

    fn set_style(inout self, style: FontStyle):
        """
        Set the font style to the given value.
        """
        self.style = style

    fn set_fg(inout self, index: Int):
        """
        Set the foreground color to the given value.
        """

        try:
            assert_true(index >= 0 and index <= 255, "")
        except:
            print("Color index must be between 0 and 255")
            return
        self.fg = Color(index)

    fn set_bg(inout self, index: Int):
        """
        Set the background color to the given value.
        """
        try:
            assert_true(index >= 0 and index <= 255, "")
        except:
            print("Color index must be between 0 and 255")
            return
        self.fg = Color(index)
        self.bg = Color(index)

    # Comptime

    fn print[s: String, newline: Bool = True](self):
        if not newline:
            print_no_newline(self.sequence() + s + self.reset())
        else:
            print(self.sequence() + s + self.reset())

    fn print[s: StringLiteral, newline: Bool = True](self):
        if not newline:
            print_no_newline(self.sequence() + s + self.reset())
        else:
            print(self.sequence() + s + self.reset())

    # Runtime
    fn print(self, s: String, newline: Bool = True):
        if not newline:
            print(self.sequence() + s + self.reset())
        else:
            print(self.sequence() + s + self.reset())

    fn print(self, s: StringLiteral, newline: Bool = True):
        if not newline:
            print_no_newline(self.sequence() + s + self.reset())
        else:
            print(self.sequence() + s + self.reset())

    fn print(self, s: StringRef, newline: Bool = True):
        if not newline:
            print_no_newline(self.sequence() + s + self.reset())
        else:
            print(self.sequence() + s + self.reset())

    # Comptime
    fn sprint[s: String](self) -> String:
        return self.sequence() + s + self.reset()

    fn sprint[s: StringLiteral](self) -> String:
        return self.sequence() + s + self.reset()

    # Runtime
    fn sprint(self, s: String) -> String:
        return self.sequence() + s + self.reset()

    fn sprint(self, s: StringLiteral) -> String:
        return self.sequence() + s + self.reset()

    fn sprint(self, s: StringRef) -> String:
        return self.sequence() + s + self.reset()

    fn sprintf(self, text: String, *strs: String) -> String:
        var output: String = text
        for i in range(len(strs)):
            output = replace(output, "%s", strs[i], 1)

        return self.sequence() + output + self.reset()

    fn sprintf(self, text: String, *ints: Int) -> String:
        var output: String = text
        for i in range(len(ints)):
            output = replace(output, "%d", String(ints[i]), 1)

        return self.sequence() + output + self.reset()

    fn sprintf(self, text: String, *floats: Float64) -> String:
        var output: String = text
        for i in range(len(floats)):
            output = replace(output, "%d", String(floats[i]), 1)

        return self.sequence() + output + self.reset()

    fn printf(self, text: String, *strs: String, newline: Bool = True):
        var output: String = text
        for i in range(len(strs)):
            output = replace(output, "%s", strs[i], 1)

        if newline:
            print(self.sequence() + output + self.reset())
        else:
            print_no_newline(self.sequence() + output + self.reset())

    fn printf(self, text: String, *ints: Int, newline: Bool = True):
        var output: String = text
        for i in range(len(ints)):
            output = replace(output, "%d", String(ints[i]), 1)
        if newline:
            print(self.sequence() + output + self.reset())
        else:
            print_no_newline(self.sequence() + output + self.reset())

    fn printf(self, text: String, *floats: Float64, newline: Bool = True):
        var output: String = text
        for i in range(len(floats)):
            output = replace(output, "%d", String(floats[i]), 1)
        if newline:
            print(self.sequence() + output + self.reset())
        else:
            print_no_newline(self.sequence() + output + self.reset())
