import std/strutils
import std/tables
import std/sets

let file = open("input.txt")

var head = [0,0];
var tail = [0,0];
var last_head = [0, 0];

var visits = toHashSet([tail.join(" ")]);

let transforms = {"U": [0, 1], "D": [0, -1], "L": [-1, 0], "R": [1,0]}.toTable;

var line: string;
while file.read_line(line):
    let words = split(line);
    
    var i: int = parseInt(words[1]);
    while i > 0:
        last_head = head;

        head[0] += transforms[words[0]][0];
        head[1] += transforms[words[0]][1];
        dec(i);

        let dx = head[0]-tail[0];
        let dy = head[1]-tail[1];
        if dx >= 2 or dx <= -2 or dy >= 2 or dy <= -2:
            tail = last_head;
            visits.incl tail.join(" ");
            
echo "Part 1: ", visits.len; 

file.close();