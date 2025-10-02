def runme():
    # pyright/basedpyright autocomplete does NOT like this way
    import packA
    packA.moduleA2.do_print(packA.package_global)
    packA.moduleA2.do_print(packA.moduleA2.module_global)
    
    packA.do_print2(packA.package_global)


    from packA import package_global as pg
    packA.moduleA2.do_print(pg)

    

    from packB import moduleB1, moduleB2, moduleB3
    z = moduleB1.module_global
    moduleB1.add(z,3)
    moduleB2.sub(z,3)
    moduleB3.mult(z,3)

    from packB.packC import moduleC1
    moduleC1.math(z,3)
    moduleC1.module_global = 4
    moduleC1.math(z,3)

    from nopack import utility
    utility.do_thing()

if __name__ == '__main__':
    print(f"run as main, CANNOT use relative imports from {__file__}")
    runme()
else:
    print(f"run as package {__name__},CAN use relative imports from {__file__}")
    runme()
