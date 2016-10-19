function numvp = NrValProprii(d, s, val_lambda)
	P = ValoriPolinoame(d, s, val_lambda);
	n = length(P);
	numvp = 0;	
	for i = 1:n-1
		if P(i)*P(i+1) < 0
			numvp++;
		else if P(i+1) == 0
			numvp++;
			end
		end
	end
endfunction
