import std/strutils
import std/tables
import std/sets

let file = open("input.txt")

const len_body = 10;

var body: array[len_body, array[2, int]];
var j = 1;
while j < len_body:
    body[j] = [0,0];
    inc(j);

var visits = toHashSet(["0 0"]);

let transforms = {"U": [0, 1], "D": [0, -1], "L": [-1, 0], "R": [1,0]}.toTable;

var line: string;
while file.read_line(line):
    let words = split(line);
    
    var i: int = parseInt(words[1]);
    while i > 0:
        body[0][0] += transforms[words[0]][0];
        body[0][1] += transforms[words[0]][1];

        var u = 1;
        while u < len_body:
            let dx = body[u][0]-body[u-1][0];
            let dy = body[u][1]-body[u-1][1];
            if dx >= 2 or dx <= -2 or dy >= 2 or dy <= -2:
                body[u][0] -= (if ((if dx<1:dx else:1)<(-1)):(-1) else: (if dx<1:dx else:1));
                body[u][1] -= (if ((if dy<1:dy else:1)<(-1)):(-1) else: (if dy<1:dy else:1));
            inc(u);
        dec(i);
        visits.incl body[len_body - 1].join(" ");
            
echo "Part 2: ", visits.len;

file.close();