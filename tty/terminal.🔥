from python import Python, PythonObject
from .ansi import *


struct TerminalSize(Stringable):
    var width: Int
    var height: Int

    fn __init__(inout self, w: Int, h: Int):
        self.width = w
        self.height = h

    fn __str__(self) -> String:
        return "w:" + str(self.width) + " h:" + str(self.height)


fn get_term_size() raises -> TerminalSize:
    var pyos = Python.import_module("os")
    var size_obj: PythonObject = pyos.get_terminal_size()
    return TerminalSize(int(size_obj[0]), int(size_obj[1]))


fn replace(input_string: String, old: String, new: String, count: Int = -1) -> String:
    if count == 0:
        return input_string

    var output: String = ""
    var start = 0
    var split_count = 0

    for end in range(len(input_string) - len(old) + 1):
        if input_string[end : end + len(old)] == old:
            output += input_string[start:end] + new
            start = end + len(old)
            split_count += 1

            if count >= 0 and split_count >= count and count >= 0:
                break

    output += input_string[start:]
    return output


fn sprintf(text: String, *strs: String) -> String:
    var output: String = text
    for i in range(len(strs)):
        output = replace(output, "%s", strs[i], 1)

    return output


fn sprintf(text: String, *ints: Int) -> String:
    var output: String = text
    for i in range(len(ints)):
        output = replace(output, "%d", String(ints[i]), 1)

    return output


fn sprintf(text: String, *floats: Float64) -> String:
    var output: String = text
    for i in range(len(floats)):
        output = replace(output, "%d", String(floats[i]), 1)

    return output


# Reset the terminal to its default style, removing any active styles.
fn reset_terminal():
    print_no_newline(csi + reset + "m")


fn hyperlink(link: String, name: String) -> String:
    return osc + "8;;" + link + st + name + osc + "8;;" + st
