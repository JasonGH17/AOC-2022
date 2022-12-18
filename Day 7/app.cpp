#include <fstream>
#include <sstream>
#include <string>
#include <iostream>
#include <vector>
#include <map>
#include <numeric>
#include <climits>

using namespace std;

#define MAX_USED 40000000

#define getNextWord() iss >> word;

int main()
{
    ifstream file("input.txt");

    vector<string> dir;
    map<string, int> fs;

    string line;
    while (getline(file, line))
    {
        istringstream iss(line);
        string word;

        getNextWord();
        if (word == "$")
        {
            getNextWord();
            if (word == "cd")
            {
                getNextWord();
                if (word == "..")
                    dir.pop_back();
                else
                {
                    dir.push_back(word);
                }
            }
        }
        else
        {
            if (word != "dir")
            {
                for (int i = 0; i < dir.size(); i++)
                {
                    vector<string>::iterator e = dir.begin();
                    advance(e, i + 1);
                    string path = accumulate(next(dir.begin()), e, dir[0], [](string a, string b)
                                             { return a + "/" + b; });
                    fs[path] += stoi(word);
                }
            }
        }
    }

    size_t delTargetSz = fs["/"] - MAX_USED;
    size_t out = 0;
    size_t del = INT_MAX;
    for (auto const &[key, val] : fs)
    {
        if(val >= delTargetSz) {
            del = val > del ? del : val;
        }
        if (val <= 100000)
            out += val;
    };

    cout << "Part 1: " << out << "\n";    
    cout << "Part 2: " << del << "\n";
    return 0;
};