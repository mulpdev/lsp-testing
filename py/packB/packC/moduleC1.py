module_global = 3

def math(x, y):
    ret = (module_global * x) + y 
    do_print(f"({x} * {module_global}) + {y} = {ret}")
    return ret

def do_print(s): # type: ignore
    print(f"{__file__}: {s}")
