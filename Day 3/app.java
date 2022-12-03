import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import java.util.ArrayList;
import java.util.Iterator;
import java.lang.Character;

class App {
    public static void main(String[] args) {
        part1();
        part2();
    }

    private static ArrayList<String> readFile(String filename) {
        ArrayList<String> out = new ArrayList<String>();
        try {
            File f = new File(filename);
            Scanner scanner = new Scanner(f);
            while (scanner.hasNextLine()) {
                out.add(scanner.nextLine());
            }
            scanner.close();
        } catch (FileNotFoundException e) {
            System.out.println("File not found...");
            e.printStackTrace();
        }
        return out;
    }
    
    private static char findCommonChar(String s1, String s2) {
        char common = '\0';
        for (int i = 0; i < s1.length(); i++) {
            char ch1 = s1.charAt(i);
            for (int u = 0; u < s2.length(); u++) {
                char ch2 = s2.charAt(u);

                if (ch1 == ch2) {
                    common = ch1;
                    break;
                }
            }
            if (common != '\0') {
                break;
            }
        }
        return common;
    }

    private static void part1() {
        ArrayList<String> file = readFile("input.txt");
        Iterator<String> iter = file.iterator();

        int pSum = 0;
        while (iter.hasNext()) {
            String data = iter.next();
            int length = data.length();

            String c1 = data.substring(0, length / 2);
            String c2 = data.substring(length / 2);

            char common = findCommonChar(c1, c2);
            
            int bagPriority = ((int) common - 96) + (Character.isUpperCase(common) ? 58 : 0);

            pSum += bagPriority;
        }
        System.out.printf("Part 1: %d\n", pSum);
    }

    private static void part2() {
        ArrayList<String> file = readFile("input.txt");
        Iterator<String> iter = file.iterator();

        int pSum = 0;
        while (iter.hasNext()) {
            String[] bags = { iter.next(), iter.next(), iter.next() };
            char common = '\0';
            for (int i = 0; i < bags[0].length(); i++) {
                char ch1 = bags[0].charAt(i);
                for (int u = 0; u < bags[1].length(); u++) {
                    char ch2 = bags[1].charAt(u);
                    for (int j = 0; j < bags[2].length(); j++) {
                        char ch3 = bags[2].charAt(j);
                        if (ch1 == ch2 && ch1 == ch3) {
                            common = ch1;
                            break;
                        }
                    }
                    if (common != '\0') {
                        break;
                    }
                }
                if (common != '\0') {
                    break;
                }
            }
            int bagPriority = ((int) common - 96) + (Character.isUpperCase(common) ? 58 : 0);
            pSum += bagPriority;
        }

        System.out.printf("Part 2: %d\n", pSum);
    }
}