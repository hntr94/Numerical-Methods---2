function r = IntervaleValProprii(d, s , m)
	if m > length(d);
		m = length(d);
	end	
	[r(1) r(m+2)] = LimiteValProprii(d,s);
	for k = m:-1:1
		mij = (r(k+2) + r(1)) / 2;
		h = (r(k+2) - r(1)) / 2;
		numvp = NrValProprii(d, s, mij);
		while numvp != k
			h = h /2;
			if numvp < k
				mij = mij + h;
			else mij = mij - h;
			end
			numvp = NrValProprii(d, s, mij);
		end
		r(k+1) = mij;
	end
	r = r(1:end-1);
endfunction
