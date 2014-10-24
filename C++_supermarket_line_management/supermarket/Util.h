#ifndef _UTIL_H_
#define _UTIL_H_

#include <stdlib.h>     /* srand, rand */
#include <stdio.h>
#include <iostream>
#include <fstream>
#include <vector>
#include <sstream>
using std::cout;
using std::cin;
using std::endl;
using std::ifstream;
using std::string;
using std::stringstream;

// 1min = 60s
// 1h = 60 min = 3600 s
// 1 day = 24h = 1440min  = 86400 s
// time intervals
//0 (meia noite) a 6am (21600s)
// 6am (21600s) a
class Util
{
	public:
	int time;
	int maxWaitLine;
	int minTimeAtCashier;
	int maxTimeAtCachier;
	int *period;
	int *maxCashiers;
	int *minPeopleFlow;
	int *maxPeopleFlow;

	Util(){ time = 0; }
	Util(const char filename[]){ time = 0; readFile(filename);  maxCashiers = new int[7]; }

	void passTime()
	{
		time++;
	}

	int getHour(int t)
	{
		return t / 3600;
	}

    int getMinute(int t)
	{
		return (time - getHour(t) * 3600)/60;
	}

	int getSeconds(int t)
	{
		return (time - getHour(t) * 3600) - getMinute(t) * 60;
	}

	int getRand(int min, int max){
	    int n = max - min + 1;
		int remainder = RAND_MAX % n;
		int x;
		do{
			x = rand();
		}while (x >= RAND_MAX - remainder);
		return min + x % n;
	}

	void printTime()
	{
           cout << "TIME: " << getHour(time) << "h and " << getMinute(time) << " min and "<< getSeconds(time) << "s"<< endl;
	}

	void readFile(const char filename[])
	{
           int *config = new int[24];
           ifstream in_stream;
           string line;
           in_stream.open(filename);

           int i = -1;
           while(!in_stream.eof())
           {
              in_stream >> line;
              string buf; // Have a buffer string
              stringstream ss(line); // Insert the string into a stream

              while (ss >> buf){
                    std::size_t found=buf.find('#');
                    if (found!=std::string::npos) break;
                    config[++i] = atoi(buf.c_str());
              }
           }

           in_stream.close();

           // FILLING CONFIG VARIABLES
           maxWaitLine = config[0];
           minTimeAtCashier = config[1];
           maxTimeAtCachier = config[2];
           i = 3;
           period = new int[7];
           minPeopleFlow = new int[7];
           maxPeopleFlow = new int[7];

           for(int j = 0; j < 7; j++)
           {
                  period[j] =  config[i++];
                  minPeopleFlow[j] = config[i++];
                  maxPeopleFlow[j] = config[i++];
           }

           delete [] config;

	}
};
#endif // _UTIL_H_
