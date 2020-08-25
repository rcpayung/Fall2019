program forFun
	implicit none;
	
	character*32 :: args1
	
	if (COMMAND_ARGUMENT_COUNT().NE.1) then
		return;
	endif
	
	call GET_COMMAND_ARGUMENT(1,args1)
	
	if (args1.EQ."linear") then
		call linear()
	else
		print*,"VALID ARGS: 'linear','quadratic','exponential'"
	endif

end program forFun

subroutine linear()
	print*,"LINEAR"
end subroutine linear