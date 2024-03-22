from moglow import Style, FontStyle, Color

# import stdlib_extensions as stdlib
# from stdlib_extensions.pathlib import Path


fn parse(s: String) raises -> String:
    """
    ## WARNING: EXPERIMENTAL.

    Parses a string into tokens.

    """
    var length = len(s)
    var i = 0
    var output: String = ""
    while i < length:
        var start = i

        while i < length:
            if s[i] == "[" or s[i] == "]":
                break
            else:
                i += 1
                continue

        var end_index = i
        var unescape_brace = False
        if i + 1 < length and s[i + 1] == s[i]:
            unescape_brace = True
            end_index += 1
            i += 2

        if start != end_index:
            output = output + s[start:end_index]

        if unescape_brace:
            continue

        if i >= length:
            break
        if s[i] == "]":
            raise Error("Missing opening brace")

        i += 1

        var token_start = i

        while i < length and s[i] != "]":
            i += 1

        var token_end = i
        if i >= length:
            raise Error("Missing closing brace")
        i += 1

        var tokens = s[token_start:token_end]
        var token_list = tokens.split(" ")
        var style = Style()
        var bright = False
        for j in range(len(token_list)):
            if token_list[j] == "bright":
                bright = True
                continue

            if token_list[j] == "/":
                output = output + "\x1b[0m"
            else:
                parse_token(token_list[j], bright, style)

        output = output + style.sequence()
    return output


fn parse_token(token: String, inout bright: Bool, inout style: Style) raises:
    if token == "bold":
        style.set_style(FontStyle.Bold)
    elif token == "italic":
        style.set_style(FontStyle.Italic)
    elif token == "underline":
        style.set_style(FontStyle.Underline)
    elif token == "strike":
        style.set_style(FontStyle.Strikethrough)
    elif token == "black":
        style.set_fg(Color(0, bright))
    elif token == "red":
        style.set_fg(Color(1, bright))
    elif token == "green":
        style.set_fg(Color(2, bright))
    elif token == "yellow":
        style.set_fg(Color(3, bright))
    elif token == "blue":
        style.set_fg(Color(4, bright))
    elif token == "magenta":
        style.set_fg(Color(5, bright))
    elif token == "cyan":
        style.set_fg(Color(6, bright))
    elif token == "white":
        style.set_fg(Color(7, bright))
    elif token == "default":
        style.set_fg(Color.Default)
    elif token == "bg-black":
        style.set_bg(Color(0, bright))
    elif token == "bg-red":
        style.set_bg(Color(1, bright))
    elif token == "bg-green":
        style.set_bg(Color(2, bright))
    elif token == "bg-yellow":
        style.set_bg(Color(3, bright))
    elif token == "bg-blue":
        style.set_bg(Color(4, bright))
    elif token == "bg-magenta":
        style.set_bg(Color(5, bright))
    elif token == "bg-cyan":
        style.set_bg(Color(6, bright))
    elif token == "bg-white":
        style.set_bg(Color(7, bright))
    elif token == "bg-default":
        style.set_bg(Color.Default)

    else:
        raise Error("Unknown literal: " + token)
    bright = False


fn pprint(s: String) raises:
    print(parse(s))


fn pprint(s: StringLiteral) raises:
    print(parse(s))


fn pprint(s: StringRef) raises:
    print(parse(s))
