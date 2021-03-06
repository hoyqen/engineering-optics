function Interference2(n,h)
% Function called by Interference.
% Re-draws the graph for Interference when pld is changed

global N 
global pld  

pld=n;  % Path Length Difference between reflections from adjacent grooves
axes(h);
x=[0:.1:pi]; % x-axis for plot
z=zeros(size(x));
a=0;
  for j=1:N, 
     y=sin(3.*x+a);
     z=z+y;   % z is waveform (sine) resulting from superimposition
     S(j,:)=y;
     a=a+pld;
  end
  %plot3(x,y,z);
  subplot(3,1,1)
 plot(x,S,'k',x,z./N,'r')
  title('Black lines: Electric vectors of the separate waves from each groove')

 subplot(3,1,2)
 S1=fft(S);
 plot(abs(S1))
  subplot(3,1,3)
  plot(angle(S1))
 % title('Black lines: Electric vectors of the separate waves from each groove')
  xlabel('Red line: electric vector of light waveform reaching the detector')
    text(0,1.1,['    Grating has ' num2str(N) ' grooves.   Path length difference = ' num2str(pld./(2*pi)) ' wavelengths'])
  intensity=sum(z.*z)./N^2;  % calculates mean amplitude
  text(0,-1.1,['               Total intensity of sum of all waves:' num2str(intensity) ])
axis([0 3 -1.2 1.2]);