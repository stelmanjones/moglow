trait Colorable(Copyable,Stringable, EqualityComparable, Movable):
    fn as_fg(self) -> String:
        pass

    fn as_bg(self) -> String:
        pass
trait ANSIable:
    fn sequence(self, escaped: Bool) -> String:
        pass


