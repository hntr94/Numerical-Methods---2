function [valp vecp] = PutereInv(d, s, h, y, maxiter, eps)
	n = length(d);
	k = 0;
	y = y/norm(y);
	e = 2 * eps;
	while e>=eps && k <= maxiter
		k = k+1;
		L = d - h;
		vecp_prim = Thomas(s,L,s,y);
		vecp = vecp_prim';
		vecp = vecp/norm(vecp);
		aux = zeros(n);
		aux(1) = vecp(1) * d(1) + vecp(2) * s(2);
		aux(n) = vecp(n) * d(n) + vecp(n-1) * s(n-1);
		for j = 2:n-1
			aux(j) = vecp(j)*d(j) + vecp(j-1) * s(j-1) + vecp(j+1) * s(j);
		end
		valp = aux' * vecp;
		h = valp;
		y = vecp;
		e = abs(1 - abs(vecp' * y));
	end

endfunction
