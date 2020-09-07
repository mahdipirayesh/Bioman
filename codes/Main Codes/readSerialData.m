function readSerialData(src,~)
    data = readasync(obj)(src);
    x(c)=data;
    c=c+1;
    disp(x);
    
end