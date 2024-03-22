trait Colorable(Copyable,Stringable, EqualityComparable, Movable):
    fn as_fg(self) -> String:
        pass

    fn as_bg(self) -> String:
        pass
