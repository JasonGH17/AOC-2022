import fs from 'fs';

async function readInput() {
	return new Promise((res, rej) => {
		fs.readFile('./input.txt', (err, data) => {
			if (err) reject(err);
			res(data.toString('utf8'));
		});
	});
}

const data = await readInput();

const split = data.split(/\r?\n/);
const elves = [0];
for (let cal of split) {
	if (cal.length != 0) elves[elves.length - 1] += +cal;
	else elves.push(+cal);
}
elves.sort((a, b) => a - b);
elves.reverse();

console.log(`Part 1: ${elves[0]}`);

console.log(`Part 2: ${elves[0] + elves[1] + elves[2]}`)
