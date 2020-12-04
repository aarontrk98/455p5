function output = hist(f)
    [M,N] = size(f);
    
    for i =1:256
        histogram(i) = 0;
    end
    
    for x = 1:M
        for y = 1:N
            histogram(f(x,y)+1) = histogram(f(x,y)+1) + 1;
        end
    end
    
    output = histogram;