function output = meanfilter(f,M,N)

for x = 1 : M        
    for y = 1 : N    
        zeroarray(x,y) = 0;
    end
end

for x = 1 : M        
    for y = 1 : N    
        output(x,y) = zeroarray(x,y);
    end
end

for x = 2 : M-1
    for y = 2 : N-1
        for i = -1 : 1
            for j = -1 : 1   
                output(x,y) = uint16(f(x-i,y-j)) + output(x,y);
            end
        end
        output(x,y) = output(x,y) / 9.;
    end
end

output = uint16(output);