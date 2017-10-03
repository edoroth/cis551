import sys

def main():
        print (sys.argv[1][2:]).decode('hex')[::-1]

main()
