function output = meanfilter(f,M,N)

for x = 1 : M        
    for y = 1 : N    
        zeroimage(x,y) = 0;
    end
end

for x = 1 : M        
    for y = 1 : N    
        output(x,y) = zeroimage(x,y);
    end
end

for x = 2 : M-1
    for y = 2 : N-1
        for i = 0 : 1
            for j = 0 : 1   
                output(x,y) = f(x-i,y-j) + output(x,y);
            end
        end
        output(x,y) = output(x,y) / 9.;
    end
end

output = uint8(output);