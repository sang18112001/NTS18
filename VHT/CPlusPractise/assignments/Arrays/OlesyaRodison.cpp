#include <iostream>
#include <math.h>
using namespace std;
using ll = long long;

ll numberAndDivisor(ll n, int t) {
    ll start = pow(10, n-1);
    ll end = pow(10, n);
    
    while (start < end) { 
        if (start % t == 0) { 
            return start;
        }
        start += 1;
    }
    return -1;
}

int main (){
    ll n; int t; cin >> n >> t;
    cout << numberAndDivisor(n, t) << endl;
    return 0;
}