# Calculator
Simple command-line calculator program written in x86-64 assembly language for Linux.

### Prerequisites

- Linux operating system
- NASM assembler
- LD linker

### Build and Run

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/calculator.git
   cd calculator
   ```

2. Build the program:

  ```bash
  nasm -f elf64 calculator.asm -o calculator.o
  ld calculator.o -o calculator
  ```
3. Run:

  ```bash
  ./calculator
  ```

### Example Output

### Acknowledgements
  1. https://github.com/mjbrusso/util.asm










