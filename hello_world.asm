DATA SECTION
RCKEEP DD 0

CODE SECTION
START:
  ARG -1011b
  INVOKE GetStdHandle
  
  ARG 0, ADDR RCKEEP
  ARG 11111b
  'Hello World! And Hello GoAsm!', RAX
  CALL WriteFile
  XOR RAX, RAX
  RET
