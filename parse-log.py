#!/usr/local/bin/python3

import os

test_file = "test.log"
dir_path = "semantics/lambda/debugger-output/lets"

def main():
    with open(test_file, "r") as f:
        # read, clean, and separate log file
        entries = f.read() \
                   .split("KDebug> p\ns\n", 1)[-1] \
                   .split("KDebug> Attempted 1 step(s). Took 0 steps(s).\nFinal State Reached", 1)[0] \
                   .split("KDebug> 1 Step(s) Taken.\nKDebug> p\ns")
        if not os.path.exists(dir_path):
            os.mkdir(dir_path)

        for (i, e) in enumerate(entries):
            with open(dir_path + "/" + str(i) + ".json", 'w') as e_file:
                e_file.write(e)

# write the separate parts to separate files
# (eventually) print number of files or write that to a separate file somewhere

if __name__ == "__main__":
    main()
