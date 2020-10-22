 area     appcode, CODE, READONLY
     export __main
	 ENTRY 
__main  function		 
           VLDR.F32   S30, = 0.5 ;Given value of x for log(1+x)
	      MOV R2,#10 ;Counter variable for no of iterations
           VLDR.F32      S1, = 1   ;S1 and S2 to calculate the denominator value of 2,3,4 etc.,
           VLDR.F32      S2, = 2   ;
	   VMOV.F32	 S3,S30   ;Copying x to S3
	   VMOV.F32	 S4,S30   ;Copying x to S4
	   VMOV.F32	 S5,S30   ;Final value after each iteration is stored in S5
	   
LOOP   VDIV.F32	S6,S3,S2  ;Division operation for (x/2 , (x^2)/3 , .....)
	   VFMS.F32	S5,S4,S6  ;Calculate new iteration value (S5 = S5 - (S4*S6)) 
	   VADD.F32	S2,S1  ;Calculation of denominator Value of 3,4,5 .....
	   VNMUL.F32 S3,S4  ;
	   SUB		R2,#1   ;Decrementing iteration value
	   CMP		R2,#0	;compare if maximum iteration is reached 
	   BNE 		LOOP	;Goto Next iteration if maximum iteration is not reached
STOP	   B STOP 
	   

     endfunc
     end
