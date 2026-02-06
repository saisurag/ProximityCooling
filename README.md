# Proximity-Aware Cooling System

An embedded low latency control system for energy-efficient cooling using proximity-based sensing using an STC8051 microcontroller. This project was completed as part of the CPEG300 Embedded Systems Design course at Hamad Bin Khalifa University.

# Motivation

In regions characterized by a dry, subtropical climate for most of the year, such as Qatar, cooling solutions are a necessity in high demand in all environments, whether that is indoors or outdoors. However, what is often overlooked is the substantial power wastage incurred as a result of this, where many leave their cooling systems running continuously. Hence, the objective of this project was to devise a smart approach to tackle this issue, one that alleviates the need of repeatedly turning systems on and off. This approach focuses on energy efficiency through automation, leveraging a simple yet effective design that promotes sustainable practices, catering to the needs of all while minimizing the negative environmental impact.

# Implementation

An STC89C52 module was utilised. Coding was completed via Keil 5 uVision and Embedded C and Assembly. Four modules were used, namely the 8x8 LED display (to showcase the customisable logo of the product), the motor (for cooling system functionality), an ultrasonic module (for proximity-based decision-making), and the seven-segment display (for displaying distance of proximity in metres). In terms of software, knowledge regarding Timer control (including modes, flags, interrupts, etc.), coding using Embedded C, and accurate pin assignment using header and source files were implemented.

# Future Works

Our plans are to incorporate the temperature sensor module of the STC8051, as well as a remote control option, such that the cooling system automatically switches based on ambient temperature, as well as for allowing manual override by the user, respectively.
