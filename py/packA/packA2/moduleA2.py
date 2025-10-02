module_global = 'Hello Module!'

def do_print(s): # type: ignore
    print(f"{__file__}: {s}")

def do_print2(s): # type: ignore
    print(f"Yeehaw {__file__}: {s}")
