# piccolo_blockcypher

Yash Motagi
Uni/school: Esigelec(Rouen) France
email: motagiyash@gmail.com

Design and testing of 64 bit data and 128 bit key piccolo block_cypher.

The project is still work in progress,
As of 22/7/2018 each generate is generating cyphered values.
But the L3 pipe in the "piccoloenc" is producing wrong values.

As of 2/8/2018 
Have figured out the problem , the problem was due to wrong matrix logic , Matrix 
logic is updated , still matrix file has some syntax errors.
Matrix is solved using by Galois field method.
Also made slight changes in wk and rk files.


As of 9/8/2018
Major Update as i added Different logic for round 30 of the piccolo block cypher.
Added file piccoloenc_30.vhd
