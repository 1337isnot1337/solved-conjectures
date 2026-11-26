"use strict";

function countSortable(n) {
    const permutation = Int8Array.from({ length: n }, (_, i) => i + 1);
    const left = new Int8Array(n);
    const right = new Int8Array(n);
    const stack = new Int8Array(n);
    let total = 0;
    let sortable = 0;

    function sortsInBudget() {
        left.set(permutation);
        let input = left;
        let output = right;
        for (let pass = 0; pass <= n - 5; pass++) {
            let ordered = true;
            for (let i = 0; i < n; i++) {
                if (input[i] !== i + 1) {
                    ordered = false;
                    break;
                }
            }
            if (ordered) return true;
            if (pass === n - 5) return false;

            let height = 0;
            let written = 0;
            for (const value of input) {
                while (height && stack[height - 1] < value) {
                    output[written++] = stack[--height];
                }
                stack[height++] = value;
            }
            while (height) output[written++] = stack[--height];
            [input, output] = [output, input];
        }
        throw new Error("Stopped outside the pass budget");
    }

    function enumerate(i) {
        if (i === n) {
            total++;
            if (sortsInBudget()) sortable++;
            return;
        }
        for (let j = i; j < n; j++) {
            const first = permutation[i];
            permutation[i] = permutation[j];
            permutation[j] = first;
            enumerate(i + 1);
            permutation[j] = permutation[i];
            permutation[i] = first;
        }
    }
    enumerate(0);
    return { n, total, sortable };
}

function factorial(n) {
    let product = 1;
    for (let i = 2; i <= n; i++) product *= i;
    return product;
}

const sizes = process.argv.length > 2 ? process.argv.slice(2).map(Number) : [8, 9, 10];
for (const n of sizes) {
    if (!Number.isInteger(n) || n < 8 || n > 11) {
        throw new Error("Choose a size from 8 through 11");
    }
    const result = countSortable(n);
    const polynomial = 60 * n ** 5 - 600 * n ** 4 + 506 * n ** 3
        + 11241 * n ** 2 - 38369 * n + 34236;
    const expected = factorial(n - 5) * polynomial / 60;
    if (result.total !== factorial(n) || result.sortable !== expected) {
        throw new Error(JSON.stringify({ ...result, expected }));
    }
    console.log(JSON.stringify({ ...result, expected }));
}
