data results err_log;

infile 'C:/Users/Michal/Desktop/strategia2.txt';
   input sample;
       if _error_ then output err_log;
       else output results;
run;
title 'Testowanie rozk³adu normalnego';
  proc capability data=results normaltest;
     var sample;
  run;
title 'Dystrybuanta empiryczna ';
  legend1 frame cframe=yellow cborder=black position=center;
proc capability data = results noprint;

     cdfplot sample;
run;



title 'Histogram';
proc capability data = results noprint;
histogram / weibull(color=green w=2);






run;
title 'Probability Plot';
proc capability data = results noprint;
     probplot sample /  exponential(sigma=est theta=est);
     probplot sample /  normal(mu=est sigma=est);
     probplot sample / weibull(theta=0.0 sigma=est c=est color=yellow
w=2);

run;
