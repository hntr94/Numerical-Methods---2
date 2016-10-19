function vp = CalculezValProprii(d, s, m, eps)
	n = length(d);
	if(m > n)
		m = n;
	end
	r = IntervaleValProprii(d, s, m);
	
	for i = 1:m
		a = r(i);
		b = r(i+1);		
		Fa = ValoriPolinoame(d,s,r(i));
		Fb = ValoriPolinoame(d,s,r(i+1));
		Xs = (a+b)/2;
		FXs = ValoriPolinoame(d,s,Xs);
		%maxiter = ceil((log10(b-a)-log10(eps)) / log10(2));
	 	maxiter = floor(log2((b - a)/eps));
		%maxiter = floor(maxiter);		
		%for j = 1:maxiter;
		%j = 1;
		%for j = 1:maxiter-15
		while abs(FXs(end)) >= eps
			%Fa = ValoriPolinoame(d,s,a);
			%Fb = ValoriPolinoame(d,s,b);
			if Fa(end)*FXs(end) < 0
				b = Xs;
				Fb = FXs;
			else
				a = Xs;
				Fa = FXs;
			end
			Xs = (a+b)/2;
			FXs = ValoriPolinoame(d,s,Xs);
		end
		vp(i) = Xs;
	end	
endfunction
