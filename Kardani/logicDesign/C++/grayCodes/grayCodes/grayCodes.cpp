//This is a test code for generate Binary code to Gray code to conversion test code in any process
//for get every more info from WHAT IS GRAY CODE AND WHY A SYSTEM SHOULD USE THAT? please read my homework
//and get data from Logic Design Course!
//Alireza Soltani Neshan
//Software engineer
// GitHub+

#include <iostream>
using namespace std;

int main()
{
	string binaryCode{ "" }, grayCode{ "" };

	cout << "Enter your Binary code:" << " ";
	cin >> binaryCode;

	// Initialized MSB bit [1]000
	grayCode = binaryCode[0];
	for (int i = 0; i < binaryCode.length() - 1; i++)
	{
		if (binaryCode[i] == binaryCode[i + 1]) {
			grayCode += "0";
		}
		else {
			grayCode += "1";
		}
	}
	cout << "Your Gray code is:" << " " << grayCode << endl;


	return 0;
}
