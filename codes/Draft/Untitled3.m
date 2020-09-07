s = serialport("COM8",9600);
global c;
c=1;
configureCallback(s,"terminator",@readSerialData)