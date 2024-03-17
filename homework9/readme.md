1. Does sudoku.ts solve the puzzle ?

No, sudoku.ts defines the Sudoku smart contract which can store the hash of a Sudoku and verify the solution. The solver the `solveSudoku` function is in `sudolu-lib.js`.

2. Which lines in sudoku.ts indicate that a solution is correct

The `assertHas1To9` function in lines 66, 71, 80 check if the solution is correct. 

3. Is it possible to submit a correct solution, but have the proof rejected as false ?

In `submitSolution(sudokuInstance: Sudoku, solutionInstance: Sudoku)`, if `solutionInstance` is correct but `sudokuInstance` does not match the original Sudoku, then the proof would be rejected as false.

4. If the prover altered the code, could they cheat and claim they had a solution, when in fact they didn't ?

not sure which code should be altered. Assuming the Sudoku smart contract is already deployed, it should be impossible to cheat.
