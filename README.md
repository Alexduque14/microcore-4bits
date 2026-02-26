# 🕹️ microcore-4bits

<div align="center">
  <img src="https://img.shields.io/badge/Hardware-Verilog-orange?style=for-the-badge&logo=cpu" alt="Verilog">
  <img src="https://img.shields.io/badge/Tools-Quartus_Prime-blue?style=for-the-badge" alt="Quartus">
  <img src="https://img.shields.io/badge/Status-Em_Desenvolvimento-green?style=for-the-badge" alt="Status">
</div>

## 📝 Sobre o Projeto
O **microcore-4bits** é um projeto de arquitetura de computadores focado no desenvolvimento de um processador funcional de 4 bits. Este repositório contém a descrição de hardware (HDL) necessária para implementar os módulos fundamentais de um microprocessador.

Este projeto faz parte dos meus estudos na **UNIFEI** (Universidade Federal de Itajubá).

## 🛠️ Estrutura do Hardware
O processador é composto pelos seguintes módulos principais:
* **ULA (Unidade Lógica e Aritmética):** Responsável pelas operações de cálculo.
* **Registradores:** Armazenamento temporário de dados.
* **Contador de Programa (PC):** Gerenciamento do fluxo de instruções.
* **Memória ROM:** Armazenamento das instruções do programa.
* **FSM (Máquina de Estados Finitos):** Controle central do ciclo de instrução.

## 📂 Arquivos Principais
* `top_module.v`: Módulo principal que conecta todos os componentes.
* `ula_4bit_sync.v`: Implementação da ULA sincronizada.
* `instruction_register.v`: Registrador para armazenamento da instrução atual.
* `fsm.v`: Lógica de controle do processador.

## 🚀 Como Visualizar
Para abrir o projeto, você precisará do **Intel Quartus Prime**:
1. Clone o repositório:
   ```bash
   git clone [https://github.com/SEU-USUARIO/microcore-4bits.git](https://github.com/SEU-USUARIO/microcore-4bits.git)
