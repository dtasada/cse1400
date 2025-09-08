/**
 * The decode subroutine decodes the messages
 *
 * Arguments:
 *	address - the address of the message in memory
 *
 * Return value: none
 */
void decode(int address) {
	unsigned char *base_addr = (unsigned char *)address;

	unsigned char *amount_of_times = base_addr + 6;
	unsigned char *character = base_addr + 7;
}
