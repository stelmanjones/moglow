




# Text formatting sequences
alias reset = "0"
alias bold = "1"
alias faint = "2"
alias italic = "3"
alias underline = "4"
alias blink = "5"
alias reverse = "7"
alias crossout = "9"
alias overline = "53"

# ANSI Operations
alias escape = chr(27)  # Escape character
alias bel = "\a"  # Bell
alias csi = escape + "["  # Control Sequence Introducer
alias osc = escape + "]"  # Operating System Command
alias st = escape + chr(
    92
)  # String Terminator - Might not work, haven't tried. 92 should be a raw backslash

# clear terminal and return cursor to top left
alias clear = escape + "[2J" + escape + "[H"


alias cursor_up_seq = "%dA"
alias cursor_down_seq = "%dB"
alias cursor_forward_seq = "%dC"
alias cursor_back_seq = "%dD"
alias cursor_next_line_seq = "%dE"
alias cursor_previous_line_seq = "%dF"
alias cursor_horizontal_seq = "%dG"
alias cursor_position_seq = "%d;%dH"
alias erase_display_seq = "%dJ"
alias erase_line_seq = "%dK"
alias scroll_up_seq = "%dS"
alias scroll_down_seq = "%dT"
alias save_cursor_position_seq = "s"
alias restore_cursor_position_seq = "u"
alias change_scrolling_region_seq = "%d;%dr"
alias insert_line_seq = "%dL"
alias delete_line_seq = "%dM"

## Explicit values for EraseLineSeq.
alias erase_line_right_seq = "0K"
alias erase_line_left_seq = "1K"
alias erase_entire_line_seq = "2K"

## Mouse
alias enable_mouse_press_seq = "?9h"  # press only (X10)
alias disable_mouse_press_seq = "?9l"
alias enable_mouse_seq = "?1000h"  # press, release, wheel
alias disable_mouse_seq = "?1000l"
alias enable_mouse_hilite_seq = "?1001h"  # highlight
alias disable_mouse_hilite_seq = "?1001l"
alias enable_mouse_cell_motion_seq = "?1002h"  # press, release, move on pressed, wheel
alias disable_mouse_cell_motion_seq = "?1002l"
alias enable_mouse_all_motion_seq = "?1003h"  # press, release, move, wheel
alias disable_mouse_all_motion_seq = "?1003l"
alias enable_mouse_extended_mode_seq = "?1006h"  # press, release, move, wheel, extended coordinates
alias disable_mouse_extended_mode_seq = "?1006l"
alias enable_mouse_pixels_mode_seq = "?1016h"  # press, release, move, wheel, extended pixel coordinates
alias disable_mouse_pixels_mode_seq = "?1016l"

## Screen
alias restore_screen_seq = "?47l"
alias save_screen_seq = "?47h"
alias alt_screen_seq = "?1049h"
alias exit_alt_screen_seq = "?1049l"

## Bracketed paste.
## https:#en.wikipedia.org/wiki/Bracketed-paste
alias enable_bracketed_paste_seq = "?2004h"
alias disable_bracketed_paste_seq = "?2004l"
alias start_bracketed_paste_seq = "200~"
alias end_bracketed_paste_seq = "201~"

## Session
alias set_window_title_seq = "2;%s" + bel
alias set_foreground_color_seq = "10;%s" + bel
alias set_background_color_seq = "11;%s" + bel
alias set_cursor_color_seq = "12;%s" + bel
alias show_cursor_seq = "?25h"
alias hide_cursor_seq = "?25l"

