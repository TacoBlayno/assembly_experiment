;I am learning to turn this into 64-bit

DATA SECTION
WRKEEP DD 0

CODE SECTION
START:
  PUSH -1011b
  CALL GetStdHandle
  
  PUSH 0, ADDR WRKEEP
  PUSH 11111b, 'Hello World! And Hello GoAsm!'
  PUS EAX
  CALL WriteFile
  XOR EAX, EAX
  RET
