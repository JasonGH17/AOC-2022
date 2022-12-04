from io import TextIOWrapper

def main(file: TextIOWrapper):
    inside = 0
    overlaps = 0
    for line in file:
        groups = line.split(",")
        groups[0] = groups[0].split("-")
        groups[1] = groups[1].split("-")

        if int(groups[0][0]) >= int(groups[1][0]) and int(groups[0][1]) <= int(groups[1][1]) or int(groups[1][0]) >= int(groups[0][0]) and int(groups[1][1]) <= int(groups[0][1]):
            inside += 1
        
        if int(groups[0][1]) >= int(groups[1][0]) and int(groups[0][0]) <= int(groups[1][1]):
            overlaps += 1

    print(f"Part 1: {inside}")
    print(f"Part 2: {overlaps}")

if __name__ == "__main__":
    with(open("input.txt", "r")) as file:
        main(file)