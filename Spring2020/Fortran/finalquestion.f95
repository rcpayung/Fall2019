program run
	integer :: n, answer, EvenSum;
	
	read(5,*) n;
	
	answer = EvenSum(n);
	
	print*,answer;
end program run

recursive function EvenSum(n) result (a)
	implicit none;
	!variable dec
	integer :: n, a;
	if (MOD(n,2) .eq. 1) n = n-1;
	if (n .eq. 0) return;
	
	a = n + EvenSum(n-2);
	

end function EvenSum


