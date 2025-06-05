# Simple General Purpose Processor
This lab was completed for COE 328 (Digital Systems) course.

The general-purpose processing unit (GPU) consists of a storage unit, control unit and the
Arithmetic Logic Unit (ALU). The GPU takes two 8-bit input values, A and B, which in this lab
were (25)16 and (95)16 respectively.

The ALU performs the selected arithmetic operation and
generates the value of the operation as the output. The two storage units are two positive level D
latches which store the values of A and B and returns them as the output on the high level of the
clock. The output values from the storage units are passed on as inputs to the ALU. 

To select
which operation is performed in the ALU, there is a control unit which consists of a finite state
machine (FSM) and a 4 to 16 decoder. This component selects which microcode is sent to the
ALU through the output signal, OP, based on the current state of the FSM. Each microcode is
assigned a unique arithmetic operation in the ALU, therefore the selected operation in the ALU
depends on the microcode it received from the control unit. The ALU is the component which
performs the arithmetic operations on the A and B inputs based on the OP signal. After the
arithmetic operation is performed, the result is displayed on two seven segment displays.

All the components were written in VHDL using Quartus. Three different iterations of the ALU were designed. For each ALU, the block diagam was constructed and the results were verified using the waveform simulation.
