function num = choose_different(arr, diff)
    do
        ndx = randi(size(arr,2));
        num = arr(ndx);
    until num != diff,
endfunction
