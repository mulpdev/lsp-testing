module_global = 10

def add(x, y):
    ret = x + y
    do_print(f"{x} + {y} = {ret}")
    return ret

def do_print(s): # type: ignore
    print(f"{__file__}: {s}")
