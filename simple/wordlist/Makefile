# 1. Generate parser C files (generates parser.tab.c and parser.tab.h)
bison -d parser.y

# 2. Generate lexer C file (generates lex.yy.c)
flex scanner.l

# 3. Compile all generated C files together
gcc parser.tab.c lex.yy.c -o wordlist

# 4. Run the executable
./wordlist

