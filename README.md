<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<p align="center">
  <b> UNIVERSITY OF SÃO PAULO </b>
  <br>
  <b> SCHOOL OF ENGINEERING OF SÃO CARLOS </b>
  <br> <br>
  <img src="https://github.com/joaocolombari/Projeto2023/assets/105496210/b6cf7a10-fe32-4d49-b1be-8d29e147b0ec" width="150">
  <br> <br>
  DEPARTMENT OF ELECTRICAL AND COMPUTER ENGINEERING
  <br>
  <b>Author: </b> João Victor Colombari Carlet <br>
  <b>University ID: </b> 5274502 <br><br>
</p>

<hr>

<h1>Gagabirô Tube Amplifier Project</h1>

<p> This project involves designing, optimizing and building a Tube Power Amplifier. The amplifier is a 14W per channel EL84 amplifier designed in LTspice usign NormanKoren tube models. 
  The optimization is done using CirOp, a Matlab optimizor designed by Professor João Navarro. CirOp uses several algorithms to find best local solutions for a fitting function in which 
  circuit parameters are used as inputs. These parameters are captured in the simulator outputs and new parameters are generated each round up to a best solution or a stop criterion is met.
</p>

<p> For this project, a psychoacoustics based optimization was desired, so the GedLee method was applied. GedLee is a novel method for evaluating distortion in audio amplifiers and its 
  correlation to human subjective perception has been shown. In order to use it, a transfer function T(x) must be input to a formula. Since there is no native LTSpice funtion to determine 
  a trasnfer curve (output x input), a transient simulation is done with a behavioral source with a sine which amplitude riseas every 10ms. For each interval a maximum and minimum values are 
  measured. This data is treated in Matlab and a T(x) is obtained then fed into the GedLee fourmula:
</p>

<p>gm = &radic;<span style="text-decoration:overline;">&int;<sub>-1</sub><sup>1</sup> cos(x &pi; / 2)<sup>2</sup> * (d<sup>2</sup>/dx<sup>2</sup> T(x))<sup>2</sup> dx</span></p>

<h2>Project Structure</h2>

<h3>6L6GC</h3>
<ul>
  <li><b>This directory contains the first design for the amplifier and it uses a 6L6 ouput. This solution has been abandoned due to costy components</b>
  </li>
</ul>

<h3>EL84</h3>
<ul>
  <li><b>This directory contains the current design for the amplifier. This design uses a EL84 output with 12AU7 input and divider stages. The first stage uses local feedback to match the input of the push-pull pair. No global feedback is used</b>
  </li>
</ul>

<h3>EL84_12AX7</h3>
<ul>
  <li><b>This directory contains a design that uses the EL84 and a 12AX7 differential stage only</b>
  </li>
</ul>

<h3>Matlab</h3>
<ul>
  <li><b>This directory contains the Matlab codes that treat the data and applies the GedLee metric</b>
    <ul>
      <li><b>LTspice2Matlab.m</b> is a function that imports the raw data to Matlab. It is not used currently</li>
      <li><b>calculatedGedLee.m.m</b> applies the GedLee method using spline interpolation</li>
      <li><b>calculates_gain.m</b> calculates the gain of the amplifier for a -10dBV input</li>
      <li><b>generate_meas_command.m</b> generates the measure commands accordingly to a number of measures input</li>
      <li><b>plot_ltspice_values.m</b> captures the .log outputs. It first cleans the miserable \x00 ASCII characters that appear there and then searches for the outputs within the text. Then it creates a vector with the outputs and organizes it in a transfer-like manner. It normalizes with the amplifier gain and plots the results</li>
      <li><b>plot_transfer_curve.m</b>plots the transfer curve with the data, its interpoled T(x), and its first and second derivatives</li>
    </ul>
  </li>
</ul>

<h3>lib</h3>
<ul>
  <li><b>LTspice lib files</b>
  </li>
</ul>

<h3>misc</h3>
<ul>
  <li><b>Non-important LTspice files</b>
  </li>
</ul>

<h3>Schatz</h3>
<ul>
  <li><b>Papers and data from Schatz trasnformers</b>
  </li>
</ul>

<h2>Usage</h2>
<ul>
  <li>Ensure you have MATLAB 2022b installed on your machine</li>
  <li>Clone the repository and navigate to the project directory</li>
  <li>Ensure LTspice sees the lib files in control pannel - Sym & Lib Search Paths</li>
  <li>Simulate to generate the .log file</li>
  <li>Run plot_ltpice_values.m</li>
  <li>Use the functions.</li>
</ul>

</body>
</html>
