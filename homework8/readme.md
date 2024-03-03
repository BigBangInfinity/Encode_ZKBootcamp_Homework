# Homework 8

## ZKApps

1. Install the zkapp-cli and the dependencies
   
`npm install -g zkapp-cli`

2. Create the example sudoku project

`zk example sudoku`

Make sure you understand the logic flow within the app.

`npm run start` runs the code in `build/src/run.js`

Workflow:

Create an instance of Sudoku smart contract (which doesn't contain any Sudoku at initialization:

`const zkApp = new SudokuZkApp(zkAppAddress);`

Generate a Sudoku puzzle with difficulty 0.5 (difficulties are in [0,1])

`const sudoku = generateSudoku(0.5);`

Update the Sudoku smart contract to include that generated Sudoku.

`zkApp.update(Sudoku.from(sudoku));`

The hash of the Sudoku is stored, see `build/src/sudoku.js`:

`this.sudokuHash.set(sudokuInstance.hash());`

Transaction i sent to updaet Sudoku smart contract

`await tx.sign([zkAppPrivateKey, senderKey]).send();`

Solution is generated:

`let solution = solveSudoku(sudoku);`

Wrong solution is also generated (add +1 to the right solution in position (0,0))

```
let noSolution = cloneSudoku(solution);
noSolution[0][0] = (noSolution[0][0] % 9) + 1;
```

Wrong solution is submitted:

```
zkApp.submitSolution(Sudoku.from(sudoku), Sudoku.from(noSolution));
await tx.prove();
await tx.sign([senderKey]).send();
```

right solution is submitted, transaction succeeds and `isSolved` is set to `true`:

```
tx = await Mina.transaction(sender, () => {
    zkApp.submitSolution(Sudoku.from(sudoku), Sudoku.from(solution));
});
await tx.prove();
await tx.sign([senderKey]).send();
console.log('Is the sudoku solved?', zkApp.isSolved.get().toBoolean());
```

In `build/src/sudoku.js`, the code checks if the submitted solution is valid with the `assertHas1to9` function, if it extends the original Sudoku grid (which is submitted with the solution), and if the hash of the initial Sudoku matches the hash of the Sudoku stored in the smart contract.
