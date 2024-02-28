fn home():
    """
    Move the cursor to the upper left corner.
    """
    print_no_newline("\x1b[H")


fn down(n: Int = 1):
    """
        Move the cursor down.
        Args:
                n: Number of columns to move.
    """
    print_no_newline("\x1b[" + str(n) + "B")


fn up(n: Int = 1):
    """
           Move the cursor up.
    Args:
               n: Number of columns to move.
    """
    print_no_newline("\x1b[" + str(n) + "A")


fn right(n: Int = 1):
    """
        Move the cursor right.

    Args:
        n: Number of columns to move.
    """
    print_no_newline("\x1b[" + str(n) + "C")


fn left(n: Int = 1):
    """
        Move the cursor left.

    Args:
            n: Number of columns to move.
    """
    print_no_newline("\x1b[" + str(n) + "D")


fn erase_line():
    """
    Clear the current line.
    """
    print_no_newline("\x1b[2K")
    home()
    

fn erase_n_lines(n: Int):
    """
    Clear the current line.
    """
    for i in range(n):
        print_no_newline("\x1b[2K")
        up()

    home()
fn move(x: Int, y: Int):
    """
    Move the cursor to the given position.

    Args:
        x: The column to move to.
        y: The row to move to.
    """
    print_no_newline("\x1b[" + str(y) + ";" + str(x) + "H")


fn save():
    """
    Save the cursor position.
    """
    print_no_newline("\x1b[s")


fn restore():
    """
    Restore the cursor position.
    """
    print_no_newline("\x1b[u")


fn hide():
    """
    Hide the cursor.
    """
    print_no_newline("\x1b[?25l")


fn show():
    """
    Show the cursor.
    """
    print_no_newline("\x1b[?25h")
