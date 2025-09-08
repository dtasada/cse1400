/**
 * The pow subroutine calculates powers
* of non-negative bases and exponents.
* 
* Arguments:
*
*	base	- the exponential base
*	exp		- the exponent
*
* Return value: 'base' raised to the power of 'exp'
*/
int pow(int base, int exp) {
	int total = 1;

	for (int i = 0; i < exp; i++)
		total *= base;

	int rcx = 0;

	if (rcx < limit) {

	}

pow_body: 
		i += 1;

	return total;
}
