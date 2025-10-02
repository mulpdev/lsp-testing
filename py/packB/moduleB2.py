def sub(x, y):
    ret = x - y
    do_print(f"{x} - {y} = {ret}")
    return x + y

def do_print(s): # type: ignore
    print(f"{__file__}: {s}")
