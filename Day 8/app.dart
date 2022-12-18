import "dart:io";

void main() {
    var data = File("input.txt").readAsLinesSync();

    var transforms = [[1,0], [0,1], [0, -1], [-1, 0]];

    var nVisible = 0;
    var best = 0;
    for(var i = 0; i < data.length; i++) {
        String line = data[i];
        for(var j = 0; j < line.length; j++) {
            var tree = line[j];
            
            var visible = false;
            var score = 1;
            for(var t in transforms) {
                var sy = i;
                var sx = j;
                var found = true;
                while(true) {
                    sy += t[1];
                    sx += t[0];

                    if(!((0<=sy && sy<data.length) && (0<=sx && sx<line.length))) break;
                    if(int.parse(data[sy][sx]) >= int.parse(tree)) found = false;
                }
                if(found)
                    visible = found;
                
                var dist = 1;
                sy = i+t[1];
                sx = j+t[0];
                while(true) {
                    if(!((0<=sy && sy<data.length) && (0<=sx && sx<line.length))) {dist--; break;};
                    if(int.parse(data[sy][sx]) >= int.parse(tree)) break;
                    dist++;
                    sy += t[1];
                    sx += t[0];
                }
                score *= dist;
            }
            if(visible) nVisible++;
            best = (score > best) ? score : best;
        };
    }

    print("Part 1: " + nVisible.toString());
    print("Part 2: " + best.toString());
}