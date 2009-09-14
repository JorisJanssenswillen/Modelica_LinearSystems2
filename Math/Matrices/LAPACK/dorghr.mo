within Modelica_LinearSystems2.Math.Matrices.LAPACK;
function dorghr
  "generates a real orthogonal matrix Q which is defined as the product of IHI-ILO elementary reflectors of order N, as returned by DGEHRD"

  input Real A[:,size(A, 1)];
  input Integer ilo=1
    "lowest index where the original matrix had been Hessenbergform - ilo must have the same value as in the previous call of DGEHRD";
  input Integer ihi=size(A, 1)
    "highest index where the original matrix had been Hessenbergform  - ihi must have the same value as in the previous call of DGEHRD";
  input Real tau[size(A, 1) - 1] "scalar factors of the elementary reflectors";
  output Real Aout[size(A, 1),size(A, 2)]=A
    "Orthogonal matrix as a result of elementary reflectors";
  output Integer info;
protected
  Integer n=size(A, 1);
  Integer lda=max(1, n);
  Integer lwork=max(1, 2*(ihi - ilo));
  Real work[lwork];

  annotation (Documentation(info=" 
 
   Purpose  
   =======  
 
   DGEHRD reduces a real general matrix A to upper Hessenberg form H by  
   an orthogonal similarity transformation:  Q' * A * Q = H .  
 
   Arguments  
   =========  
 
   N       (input) INTEGER  
           The order of the matrix A.  N >= 0.  
 
   ILO     (input) INTEGER  
   IHI     (input) INTEGER  
           It is assumed that A is already upper triangular in rows  
           and columns 1:ILO-1 and IHI+1:N. ILO and IHI are normally  
           set by a previous call to DGEBAL; otherwise they should be  
           set to 1 and N respectively. See Further Details.  
           1 <= ILO <= IHI <= N, if N > 0; ILO=1 and IHI=0, if N=0.  
 
   A       (input/output) DOUBLE PRECISION array, dimension (LDA,N)  
           On entry, the N-by-N general matrix to be reduced.  
           On exit, the upper triangle and the first subdiagonal of A  
           are overwritten with the upper Hessenberg matrix H, and the  
           elements below the first subdiagonal, with the array TAU,  
           represent the orthogonal matrix Q as a product of elementary  
           reflectors. See Further Details.  
 
   LDA     (input) INTEGER  
           The leading dimension of the array A.  LDA >= max(1,N).  
 
   TAU     (output) DOUBLE PRECISION array, dimension (N-1)  
           The scalar factors of the elementary reflectors (see Further  
           Details). Elements 1:ILO-1 and IHI:N-1 of TAU are set to  
           zero.  
 
   WORK    (workspace/output) DOUBLE PRECISION array, dimension (LWORK)  
           On exit, if INFO = 0, WORK(1) returns the optimal LWORK.  
 
   LWORK   (input) INTEGER  
           The length of the array WORK.  LWORK >= max(1,N).  
           For optimum performance LWORK >= N*NB, where NB is the  
           optimal blocksize.  
 
           If LWORK = -1, then a workspace query is assumed; the routine  
           only calculates the optimal size of the WORK array, returns  
           this value as the first entry of the WORK array, and no error  
           message related to LWORK is issued by XERBLA.  
 
   INFO    (output) INTEGER  
           = 0:  successful exit  
           < 0:  if INFO = -i, the i-th argument had an illegal value.  
 
   Further Details  
   ===============  
 
   The matrix Q is represented as a product of (ihi-ilo) elementary  
   reflectors  
 
      Q = H(ilo) H(ilo+1) . . . H(ihi-1).  
 
   Each H(i) has the form  
 
      H(i) = I - tau * v * v'  
 
   where tau is a real scalar, and v is a real vector with  
   v(1:i) = 0, v(i+1) = 1 and v(ihi+1:n) = 0; v(i+2:ihi) is stored on  
   exit in A(i+2:ihi,i), and tau in TAU(i).  
 
   The contents of A are illustrated by the following example, with  
   n = 7, ilo = 2 and ihi = 6:  
 
   on entry,                        on exit,  
 
   ( a   a   a   a   a   a   a )    (  a   a   h   h   h   h   a )  
   (     a   a   a   a   a   a )    (      a   h   h   h   h   a )  
   (     a   a   a   a   a   a )    (      h   h   h   h   h   h )  
   (     a   a   a   a   a   a )    (      v2  h   h   h   h   h )  
   (     a   a   a   a   a   a )    (      v2  v3  h   h   h   h )  
   (     a   a   a   a   a   a )    (      v2  v3  v4  h   h   h )  
   (                         a )    (                          a )  
 
   where a denotes an element of the original matrix A, h denotes a  
   modified element of the upper Hessenberg matrix H, and vi denotes an  
   element of the vector defining H(i).  
 
   =====================================================================  
"));
external "Fortran 77" dorghr(
    n,
    ilo,
    ihi,
    Aout,
    lda,
    tau,
    work,
    lwork,
    info) annotation(Library = {"lapack"});

end dorghr;