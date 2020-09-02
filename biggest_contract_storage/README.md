# Biggest data storage

`sizes.dat` contains the list of all contracts at block ~8M along with their number of storage slots and the size of their code.

In order to find the top 10 blocks, unzip the file and type:

`cat sizes.dat | ./plusgros.rb`
