#!/usr/local/bin/python3

test_file = "test.log"

def main():
    with open(test_file, "r") as f:
        # read log file
        data = f.read()
        print(len(data.split("KDebug> 1 Step(s) Taken.\nKDebug> p\ns")))

# split on
'''
KDebug> 1 Step(s) Taken.
KDebug> p
s
'''
# write the separate parts to separate files
# (eventually) print number of files or write that to a separate file somewhere

if __name__ == "__main__":
    main()