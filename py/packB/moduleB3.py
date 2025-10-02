module_global = 2

def mult(x, y):
    ret = x * y
    do_print(f"{x} * {y} = {ret}")
    return ret

def do_print(s): # type: ignore
    print(f"{__file__}: {s}")
