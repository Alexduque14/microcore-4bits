# 🕹️ microcore-4bits

## 📝 About the Project
**microcore-4bits** is a computer architecture project focused on developing a functional 4-bit processor. This repository contains the Hardware Description Language (HDL) code required to implement the fundamental modules of a microprocessor.

This project is part of my studies at **UNIFEI** (Federal University of Itajubá).

## 🛠️ Hardware Structure
The processor consists of the following core modules:
* **ALU (Arithmetic Logic Unit):** Responsible for calculation operations.
* **Registers:** Temporary data storage.
* **Program Counter (PC):** Manages the instruction flow.
* **ROM Memory:** Stores the program instructions.
* **FSM (Finite State Machine):** Central control for the instruction cycle.

## 📂 Core Files
* `top_module.v`: Main module connecting all components.
* `ula_4bit_sync.v`: Implementation of the synchronized ALU.
* `instruction_register.v`: Register for storing the current instruction.
* `fsm.v`: Control logic for the processor.

## 🚀 How to Run
To open and simulate this project, you will need **Intel Quartus Prime**:
1. Clone the repository:
   ```bash
   git clone [https://github.com/alexduque/microcore-4bits.git](https://github.com/alexduque/microcore-4bits.git)

## 👥 Authors
* **Alex Alvarez Duque** - [GitHub](https://github.com/alexduque)

* **Pedro Lucas Pereira Ferreira** - [GitHub](https://github.com/pedrolucas)
