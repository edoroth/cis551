import sys

def main():
	word = sys.argv[1][2:]
	newWord = word[:-1] + str(int(word[-1]) + 3)
	print (word[:-1] + str(int(word[-1]) + 3))[:12].decode('hex')[::-1]

main()
