#include "mex.h"

/* [val] = v2val(V)
 *
 * V = [X,Y,Z] is the vector containing the voxel position
 * 
 * Return
 *  val, a vector containing values corresponding to the merged bits of X, Y and Z
 *  val = binaire( bz^N,by^N,bx^N,...,bz^0,by^0,bx^0 )
 */
void mexFunction(int nlhs, mxArray *plhs[],
				 int nrhs, const mxArray *prhs[])
{
    if( nrhs!=1 )
        mexErrMsgTxt("Expected 1 input");
    if( nlhs>1 )
        mexErrMsgTxt("Expected 1 output");
    if( mxGetN(prhs[0])!=3 )
        mexErrMsgTxt("Input should have 3 columns");
    if( mxGetClassID(prhs[0])!=mxDOUBLE_CLASS )
        mexErrMsgTxt("Input should be DOUBLE");
    
    size_t M = mxGetM(prhs[0]);
    plhs[0]  = mxCreateNumericMatrix(M,1,mxUINT64_CLASS,mxREAL);
    
    double              *VX = mxGetPr(prhs[0]), *VY = VX+M, *VZ = VY+M;
    unsigned long long int   *val = (unsigned long long int *) mxGetPr(plhs[0]);
    unsigned long long int   vx,vy,vz;
    
    for(size_t i=0; i<M; i++)
    {
        vx = *(VZ++);
        vy = *(VY++);
        vz = *(VX++);
        
        val[i] =
                ((0x000001 & vx)    ) + ((0x000001 & vy)<< 1) + ((0x000001 & vz)<< 2) +
                ((0x000002 & vx)<< 2) + ((0x000002 & vy)<< 3) + ((0x000002 & vz)<< 4) +
                ((0x000004 & vx)<< 4) + ((0x000004 & vy)<< 5) + ((0x000004 & vz)<< 6) +
                ((0x000008 & vx)<< 6) + ((0x000008 & vy)<< 7) + ((0x000008 & vz)<< 8) +
                ((0x000010 & vx)<< 8) + ((0x000010 & vy)<< 9) + ((0x000010 & vz)<<10) +
                ((0x000020 & vx)<<10) + ((0x000020 & vy)<<11) + ((0x000020 & vz)<<12) +
                ((0x000040 & vx)<<12) + ((0x000040 & vy)<<13) + ((0x000040 & vz)<<14) +
                ((0x000080 & vx)<<14) + ((0x000080 & vy)<<15) + ((0x000080 & vz)<<16) +
                ((0x000100 & vx)<<16) + ((0x000100 & vy)<<17) + ((0x000100 & vz)<<18) +
                ((0x000200 & vx)<<18) + ((0x000200 & vy)<<19) + ((0x000200 & vz)<<20) +
                ((0x000400 & vx)<<20) + ((0x000400 & vy)<<21) + ((0x000400 & vz)<<22) +
                ((0x000800 & vx)<<22) + ((0x000800 & vy)<<23) + ((0x000800 & vz)<<24) +
                ((0x001000 & vx)<<24) + ((0x001000 & vy)<<25) + ((0x001000 & vz)<<26) +
                ((0x002000 & vx)<<26) + ((0x002000 & vy)<<27) + ((0x002000 & vz)<<28) +
                ((0x004000 & vx)<<28) + ((0x004000 & vy)<<29) + ((0x004000 & vz)<<30) +
                ((0x008000 & vx)<<30) + ((0x008000 & vy)<<31) + ((0x008000 & vz)<<32) +
                ((0x010000 & vx)<<32) + ((0x010000 & vy)<<33) + ((0x010000 & vz)<<34) +
                ((0x020000 & vx)<<34) + ((0x020000 & vy)<<35) + ((0x020000 & vz)<<36) +
                ((0x040000 & vx)<<36) + ((0x040000 & vy)<<37) + ((0x040000 & vz)<<38) +
                ((0x080000 & vx)<<38) + ((0x080000 & vy)<<39) + ((0x080000 & vz)<<40) +
                ((0x100000 & vx)<<40) + ((0x100000 & vy)<<41) + ((0x100000 & vz)<<42);
    }
}
