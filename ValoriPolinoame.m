function P = ValoriPolinoame(d,s,val_lambda)
	n = length(d);
	P = zeros(1,n+1);
	
	P(1) = 1;
	P(2) = d(1)-val_lambda;
	for i = 3:n+1
		P(i) = (d(i-1) - val_lambda)*P(i-1) - ((s(i-2))^2) * P(i-2);
	end
endfunction
