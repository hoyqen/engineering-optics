function GratingMono3(n,h)
% Function called by GratingOrder.m
% Re-draws the graph when the order slider is adjusted.
% Tom O'Haver, July 2006
global alphar
global angle0
global d
global lambda
global m

m=round(n);
axes(h);

r=pi/2;% Constant used below

angle0 = asin(-sin(alphar));xi=-cos(r-alphar);yi=sin(r-alphar); % Incident beam
x0=-cos(r-angle0);y0=sin(r-angle0); % Zero order

angle1 = asin(m*lambda/d-sin(alphar));if imag(angle1)==0;x1=-cos(r-angle1);y1=sin(r-angle1);else x1=0;y1=0;end;

subplot(2,1,1)
plot([0 xi],[0 yi],'k',[0 x0],[0 y0],'k--',...
    [0 x1],[0 y1],'k:')
text(xi,yi,'Incident beam');
AngularDispersison=asin(m*(lambda+1)/d-sin(alphar))-asin(m*lambda/d-sin(alphar));
text(-.4,1.4,['Angular Dispersion = '  num2str(AngularDispersison*360/(2*pi)) ' degrees/nm']);
if imag(angle0)==0;text(x0/2,y0/2,'Order 0');end;
if imag(angle1)==0;text(x1,y1,['Order ' num2str(m)]);end;

title('Diffraction grating with monochromatic incident beam, single selected order shown.');
xlabel(['Angle = ' num2str(round(alphar*360/(2*pi))) ' degrees.   Wavelength = '  num2str(round(lambda)) ' nm.  Lines/mm = ' num2str(round(1000000/d)) '   Order = ' num2str(m)])


axis([-1 1 0 1.5]); % Update plot

subplot(2,1,2)
%lambdamatrix=[300 5 700];
mmatrix=linspace(1,401,81);
C=rand(81);
AngularDispersisonMatrix=asin(mmatrix.*(lambda+1)/d-sin(alphar))-asin(mmatrix.*lambda/d-sin(alphar));
pcolor(mmatrix,abs(AngularDispersisonMatrix),C)