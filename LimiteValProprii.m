function [limita_inf, limita_sup] = LimiteValProprii(d, s)
	t = [];
	n = length(d);
	t(1) = s(1);
	t(n) = s(n-1);
	for i = 2:n-1;
		if(j ~= i)
			t(i) = abs(s(i-1)) + abs(s(i));
		end	
	end
	for i = 1:n
		limi(i)=d(i) - t(i);
		lims(i)=d(i) + t(i);
	end
	limita_inf = min(limi);
	limita_sup = max(lims);
endfunction
