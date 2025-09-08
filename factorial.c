/**
 * The factorial subroutine calculates the factorial of 'base'
 * Arguments:
 *
 *	base	- the base
 *
 * Return value: 'base' factorial
 */
int factorial(int base) {
	if (base < 2) return 1;

	return base * factorial(base - 1);
}
