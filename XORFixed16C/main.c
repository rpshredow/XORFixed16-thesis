///////////////////////////////////////
/// 640x480 version!
/// test VGA with hardware video input copy to VGA
// compile with
// gcc pio_test_2.c -o pio2 
///////////////////////////////////////
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/ipc.h> 
#include <sys/shm.h> 
#include <sys/mman.h>
#include <sys/time.h> 
#include <math.h> 
#include <time.h>

// main bus; PIO
#define FPGA_AXI_BASE 	0xC0000000
#define FPGA_AXI_SPAN   0x00001000
// main axi bus base
void *h2p_virtual_base;
volatile unsigned int * axi_pio_ptr = NULL ;
volatile unsigned int * axi_pio_read_ptr = NULL ;

// lw bus; PIO
#define FPGA_LW_BASE 	0xff200000
#define FPGA_LW_SPAN	0x00001000
// the light weight bus base
void *h2p_lw_virtual_base;
// HPS_to_FPGA FIFO status address = 0
volatile unsigned int * lw_pio_ptr = NULL ;
volatile unsigned int * lw_pio_read_ptr = NULL ;

// read offset is 0x10 for both busses
// remember that eaxh axi master bus needs unique address
#define FPGA_PIO_READ	0x10
#define FPGA_PIO_WRITE	0x00


// /dev/mem file id
int fd;	

// timing vars
// timer variables
struct timeval t1, t2;
double elapsedTime;

float sigmoid(float x) {
     float exp_value;
     float return_value;

     /*** Exponential calculation ***/
     exp_value = exp((float) -x);

     /*** Final sigmoid value ***/
     return_value = 1 / (1 + exp_value);

     return return_value;
}

void hpstofpga(int addr, int reg, int data) {
    *(lw_pio_ptr) = ((addr) | (reg << 20) | (1 << 30));
    *(axi_pio_ptr) = data;
}

int fpgatohps(int addr, int reg) {
    *(lw_pio_ptr) = (addr | (reg << 20));
	//while(*(axi_pio_read_ptr) == 0) {}
    return *(axi_pio_read_ptr) ;
}
	
int main(void)
{

	// Declare volatile pointers to I/O registers (volatile 	
	// means that IO load and store instructions will be used 	
	// to access these pointer locations,  
  
	// === get FPGA addresses ==================
    // Open /dev/mem
	if( ( fd = open( "/dev/mem", ( O_RDWR | O_SYNC ) ) ) == -1 ) 	{
		printf( "ERROR: could not open \"/dev/mem\"...\n" );
		return( 1 );
	}
    
	//============================================
    // get virtual addr that maps to physical
	// for light weight AXI bus
	h2p_lw_virtual_base = mmap( NULL, FPGA_LW_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd, FPGA_LW_BASE );	
	if( h2p_lw_virtual_base == MAP_FAILED ) {
		printf( "ERROR: mmap1() failed...\n" );
		close( fd );
		return(1);
	}
	// Get the addresses that map to the two parallel ports on the light-weight bus
	lw_pio_ptr = (unsigned int *)(h2p_lw_virtual_base);
	lw_pio_read_ptr = (unsigned int *)(h2p_lw_virtual_base + FPGA_PIO_READ);
	
	//============================================
	
	// ===========================================
	// get virtual address for
	// AXI bus addr 
	h2p_virtual_base = mmap( NULL, FPGA_AXI_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd, FPGA_AXI_BASE); 	
	if( h2p_virtual_base == MAP_FAILED ) {
		printf( "ERROR: mmap3() failed...\n" );
		close( fd );
		return(1);
	}
    // Get the addresses that map to the two parallel ports on the AXI bus
	axi_pio_ptr =(unsigned int *)(h2p_virtual_base);
	axi_pio_read_ptr =(unsigned int *)(h2p_virtual_base + FPGA_PIO_READ);
	//============================================


	int dataIn1;
	int dataIn2;
	int dataOut;
	float input1;
	float input2;

	float output;
	
	while(1) {
		printf("Enter Number: ");
		scanf("%f", &input1);
		dataIn1 = (int)(input1 * 1024.0);
		hpstofpga(0, 0, dataIn1);
		
		printf("Enter Number: ");
		scanf("%f", &input2);
		dataIn2 = (int)(input2 * 1024.0);
		hpstofpga(1, 0, dataIn2);

		dataOut = fpgatohps(0, 0);
		output = dataOut / 1024.0;
		printf("Output: %f\n", output); 

		dataOut = fpgatohps(1, 0);
		output = dataOut;
		printf("Count: %f\n", output); 
	}
	
    return 0;
} // end main


/// /// ///////////////////////////////////// 
/// end /////////////////////////////////////
