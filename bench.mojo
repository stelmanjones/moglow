from random import random_si64, rand
import benchmark as bench
from tensor import TensorSpec
from collections.vector import DynamicVector, InlinedFixedVector
from moglow import Style, FontStyle, ColorRGB, RGBStyle
from moglow.markup.parser import parse


fn main():
    var report = bench.run[bench_moglow](1, 4, 3, 10)
    report.print_full("ms")


fn bench_moglow():
    var STRINGS: DynamicVector[String] = DynamicVector[String]()
    STRINGS.push_back(
        "[italic bright blue]Hello [underline bright red]world [bold yellow]!"
    )
    STRINGS.push_back(
        "[italic bright red]Hello [underline bright blue]world [bold green]!"
    )
    STRINGS.push_back(
        "[italic bright green]Hello [underline bright yellow]world [bold blue]!"
    )
    STRINGS.push_back(
        "[italic bright yellow]Hello [underline bright green]world [bold red]!"
    )
    STRINGS.push_back(
        "[italic bright magenta]Hello [underline bright yellow]world [bold yellow]!"
    )
    STRINGS.push_back(
        "[italic bright yellow]Hello [underline bright magenta]world [bold green]!"
    )
    STRINGS.push_back(
        "[italic bright blue]Hello [underline bright yellow]world [bold red]!"
    )
    STRINGS.push_back(
        "[italic bright red]Hello [underline bright green]world [bold blue]!"
    )
    STRINGS.push_back(
        "[italic bright green]Hello [underline bright blue]world [bold yellow]!"
    )
    STRINGS.push_back(
        " [italic bright yellow]Hello [underline bright red]world [bold magenta]!"
    )
    STRINGS.push_back(
        " [italic bright magenta]Hello [underline bright yellow]world [bold blue]!"
    )
    STRINGS.push_back(
        " [italic bright yellow]Hello [underline bright magenta]world [bold green]!"
    )
    STRINGS.push_back(
        " [italic bright blue]Hello [underline bright yellow]world [bold red]!"
    )
    STRINGS.push_back(
        " [italic bright red]Hello [underline bright green]world [bold yellow]!"
    )
    STRINGS.push_back(
        " [italic bright green]Hello [underline bright blue]world [bold magenta]!"
    )
    STRINGS.push_back(
        " [italic bright yellow]Hello [underline bright red]world [bold yellow]!"
    )
    STRINGS.push_back(
        " [italic bright magenta]Hello [underline bright yellow]world [bold blue]!"
    )
    STRINGS.push_back(
        " [italic bright yellow]Hello [underline bright magenta]world [bold green]!"
    )
    STRINGS.push_back(
        " [italic bright blue]Hello [underline bright yellow]world [bold red]!"
    )
    STRINGS.push_back(
        " [italic bright red]Hello [underline bright green]world [bold yellow]!"
    )
    STRINGS.push_back(
        " [italic bright green]Hello [underline bright blue]world [bold magenta]!"
    )
    STRINGS.push_back(
        " [italic bright yellow]Hello [underline bright red]world [bold yellow]!"
    )
    STRINGS.push_back(
        " [italic bright magenta]Hello [underline bright yellow]world [bold blue]!"
    )
    STRINGS.push_back(
        " [italic bright yellow]Hello [underline bright magenta]world [bold green]!"
    )
    STRINGS.push_back(
        " [italic bright blue]Hello [underline bright yellow]world [bold red]!"
    )
    STRINGS.push_back(
        " [italic bright red]Hello [underline bright green]world [bold yellow]!"
    )
    STRINGS.push_back(
        " [italic bright green]Hello [underline bright blue]world [bold magenta]!"
    )
    STRINGS.push_back(
        " [italic bright yellow]Hello [underline bright red]world [bold yellow]!"
    )
    STRINGS.push_back(
        " [italic bright magenta]Hello [underline bright yellow]world [bold blue]!"
    )
    STRINGS.push_back(
        " [italic bright yellow]Hello [underline bright magenta]world [bold green]!"
    )
    STRINGS.push_back(
        " [italic bright blue]Hello [underline bright yellow]world [bold red]!"
    )
    STRINGS.push_back(
        " [italic bright red]Hello [underline bright green]world [bold yellow]!"
    )
    STRINGS.push_back(
        " [italic bright green]Hello [underline bright blue]world [bold magenta]!"
    )
    STRINGS.push_back(
        " [italic bright yellow]Hello [underline bright red]world [bold yellow]!"
    )
    STRINGS.push_back(
        " [italic bright magenta]Hello [underline bright yellow]world [bold blue]!"
    )
    STRINGS.push_back(
        " [italic bright yellow]Hello [underline bright magenta]world [bold green]!"
    )
    STRINGS.push_back(
        " [italic bright blue]Hello [underline bright yellow]world [bold red]!"
    )
    STRINGS.push_back(
        " [italic bright red]Hello [underline bright green]world [bold yellow]!"
    )
    STRINGS.push_back(
        " [italic bright green]Hello [underline bright blue]world [bold magenta]!"
    )
    STRINGS.push_back(
        " [italic bright yellow]Hello [underline bright red]world [bold yellow]!"
    )
    STRINGS.push_back(
        " [italic bright magenta]Hello [underline bright yellow]world [bold blue]!"
    )
    STRINGS.push_back(
        " [italic bright yellow]Hello [underline bright magenta]world [bold green]!"
    )
    STRINGS.push_back(
        " [italic bright blue]Hello [underline bright yellow]world [bold red]!"
    )
    STRINGS.push_back(
        " [italic bright red]Hello [underline bright green]world [bold yellow]!"
    )
    STRINGS.push_back(
        " [italic bright green]Hello [underline bright blue]world [bold magenta]!"
    )
    STRINGS.push_back(
        " [italic bright yellow]Hello [underline bright red]world [bold yellow]!"
    )
    STRINGS.push_back(
        "[italic bright blue]Hello [underline bright red]world [bold yellow]!"
    )
    STRINGS.push_back(
        "[italic bright red]Hello [underline bright blue]world [bold green]!"
    )
    STRINGS.push_back(
        "[italic bright green]Hello [underline bright yellow]world [bold blue]!"
    )
    STRINGS.push_back(
        "[italic bright yellow]Hello [underline bright green]world [bold red]!"
    )
    STRINGS.push_back(
        "[italic bright magenta]Hello [underline bright yellow]world [bold yellow]!"
    )
    STRINGS.push_back(
        "[italic bright yellow]Hello [underline bright magenta]world [bold green]!"
    )
    STRINGS.push_back(
        "[italic bright blue]Hello [underline bright yellow]world [bold red]!"
    )
    STRINGS.push_back(
        "[italic bright red]Hello [underline bright green]world [bold blue]!"
    )
    STRINGS.push_back(
        "[italic bright green]Hello [underline bright blue]world [bold yellow]!"
    )
    STRINGS.push_back(
        " [italic bright yellow]Hello [underline bright red]world [bold magenta]!"
    )
    STRINGS.push_back(
        " [italic bright magenta]Hello [underline bright yellow]world [bold blue]!"
    )
    STRINGS.push_back(
        " [italic bright yellow]Hello [underline bright magenta]world [bold green]!"
    )
    STRINGS.push_back(
        " [italic bright blue]Hello [underline bright yellow]world [bold red]!"
    )
    STRINGS.push_back(
        " [italic bright red]Hello [underline bright green]world [bold yellow]!"
    )
    STRINGS.push_back(
        " [italic bright green]Hello [underline bright blue]world [bold magenta]!"
    )
    STRINGS.push_back(
        " [italic bright yellow]Hello [underline bright red]world [bold yellow]!"
    )
    STRINGS.push_back(
        " [italic bright magenta]Hello [underline bright yellow]world [bold blue]!"
    )
    STRINGS.push_back(
        " [italic bright yellow]Hello [underline bright magenta]world [bold green]!"
    )
    STRINGS.push_back(
        " [italic bright blue]Hello [underline bright yellow]world [bold red]!"
    )
    STRINGS.push_back(
        " [italic bright red]Hello [underline bright green]world [bold yellow]!"
    )
    STRINGS.push_back(
        " [italic bright green]Hello [underline bright blue]world [bold magenta]!"
    )
    STRINGS.push_back(
        " [italic bright yellow]Hello [underline bright red]world [bold yellow]!"
    )
    STRINGS.push_back(
        " [italic bright magenta]Hello [underline bright yellow]world [bold blue]!"
    )
    STRINGS.push_back(
        " [italic bright yellow]Hello [underline bright magenta]world [bold green]!"
    )
    STRINGS.push_back(
        " [italic bright blue]Hello [underline bright yellow]world [bold red]!"
    )
    STRINGS.push_back(
        " [italic bright red]Hello [underline bright green]world [bold yellow]!"
    )
    STRINGS.push_back(
        " [italic bright green]Hello [underline bright blue]world [bold magenta]!"
    )
    STRINGS.push_back(
        " [italic bright yellow]Hello [underline bright red]world [bold yellow]!"
    )
    STRINGS.push_back(
        " [italic bright magenta]Hello [underline bright yellow]world [bold blue]!"
    )
    STRINGS.push_back(
        " [italic bright yellow]Hello [underline bright magenta]world [bold green]!"
    )
    STRINGS.push_back(
        " [italic bright blue]Hello [underline bright yellow]world [bold red]!"
    )
    STRINGS.push_back(
        " [italic bright red]Hello [underline bright green]world [bold yellow]!"
    )
    STRINGS.push_back(
        " [italic bright green]Hello [underline bright blue]world [bold magenta]!"
    )
    STRINGS.push_back(
        " [italic bright yellow]Hello [underline bright red]world [bold yellow]!"
    )
    STRINGS.push_back(
        " [italic bright magenta]Hello [underline bright yellow]world [bold blue]!"
    )
    STRINGS.push_back(
        " [italic bright yellow]Hello [underline bright magenta]world [bold green]!"
    )
    STRINGS.push_back(
        " [italic bright blue]Hello [underline bright yellow]world [bold red]!"
    )
    STRINGS.push_back(
        " [italic bright red]Hello [underline bright green]world [bold yellow]!"
    )
    STRINGS.push_back(
        " [italic bright green]Hello [underline bright blue]world [bold magenta]!"
    )
    STRINGS.push_back(
        " [italic bright yellow]Hello [underline bright red]world [bold yellow]!"
    )
    STRINGS.push_back(
        " [italic bright magenta]Hello [underline bright yellow]world [bold blue]!"
    )
    STRINGS.push_back(
        " [italic bright yellow]Hello [underline bright magenta]world [bold green]!"
    )
    STRINGS.push_back(
        " [italic bright blue]Hello [underline bright yellow]world [bold red]!"
    )
    STRINGS.push_back(
        " [italic bright red]Hello [underline bright green]world [bold yellow]!"
    )
    STRINGS.push_back(
        " [italic bright green]Hello [underline bright blue]world [bold magenta]!"
    )
    STRINGS.push_back(
        " [italic bright yellow]Hello [underline bright red]world [bold yellow]!"
    )

    for k in range(10):
        for i in range(len(STRINGS)):
            try:
                var markup = parse(STRINGS[i])
            except:
                print("Failed to parse markup: " + STRINGS[i])
                continue
