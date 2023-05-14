;I am learning to turn this into 64-bit

DATA SECTION
WRKEEP DD 0

CODE SECTION
START:
  PUSH -11D
  CALL GetStdHandle
  
  PUSH 0, ADDR WRKEEP
  PUSH 31D, 'Hello World! And Hello GoAsm!'
  PUS EAX
  CALL WriteFile
  XOR EAX, EAX
  RET
