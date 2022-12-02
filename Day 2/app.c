#include <stdio.h>
#include <stdint.h>

int main() {
    FILE *f = fopen("input.txt", "r");
    fseek(f, 0, SEEK_END);
    size_t sz = ftell(f);
    fseek(f, 0, SEEK_SET);

    int score1 = 0;
    int score2 = 0;
    for (size_t i = 0; i < (sz + 2) / 5; ++i) {
        char round[3];
        fgets(round, 5, f);

        int enemy = round[0] - 64;
        int player = round[2] - 87;
        
        // Part 1
        int outcome1 = enemy - player == 0 ? 3 : (player - enemy == 2 || player - enemy == -1) ? 0 : 6;
        score1 += player + outcome1;

        // Part 2
        int win[3] = {2, 3, 1};
        int loss[3] = {3, 1, 2};
        int outcome2 = (player - 1) * 3;
        score2 += outcome2 + (outcome2 == 6 ? win[enemy-1] : outcome2 == 0 ? loss[enemy-1] : enemy);
    }
    printf("Step 1:\n\tScore: %d\nStep 2: \n\tScore: %d\n", score1, score2);

    return 0;
}