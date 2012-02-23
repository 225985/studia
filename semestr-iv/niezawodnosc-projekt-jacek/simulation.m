function [] = simulation(lambda, czasnaprawy, weibul, time, filename, chartname)	
	
	lambda *= 60;	
	f = fopen(filename, 'w');
    
    	begin = floor(wblrnd(lambda, weibul));
    	problemEnd = begin + floor(czasnaprawy*rand(1,1))+1;
    	fprintf(f, "%d %d\n", begin, problemEnd);
    	
	do
	        begin = problemEnd + floor(wblrnd(lambda, weibul)); 
	        problemEnd = begin + floor(czasnaprawy*rand(1,1))+1;
	        if(problemEnd < time & begin < time)
	            fprintf(f, "%d %d\n", begin, problemEnd);
        	endif
    	until(problemEnd > time | begin > time);
	fclose(f);
end
