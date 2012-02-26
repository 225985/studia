function v = square (t,duty)

  v = ones(size(t));
  v(t-floor(t) >= duty) = -1;

endfunction
