function IMA = grating(m,n,varargin)
%  
%       grating(512,512,'direction','rad','Velocity',5000,'color','rgb');
%       grating(512,512,'Velocity',20,'maxgrayval',200)
%       grating(512,512,'direction','ver','Velocity',40)
%       grating(512,512,'Velocity',20,'maxgrayval',200,'direction','cir')
% close all;
% clear;
if nargin < 2
    error('??????');
end
[Direction,Vel,Ang,Col,MaxGrayVal] = parseInputs(varargin{:});

if strncmpi(Direction,'hor',3)
    x = (1:m)';
    Theta = x*pi/Vel;
    Theta = repmat(Theta,[1,n]);
elseif strncmpi(Direction,'ver',3)
    x = 1:n;
    Theta = x*pi/Vel;
    Theta = repmat(Theta,[m,1]);
elseif strncmpi(Direction,'cir',3)
    x = repmat((1:n),[m,1])-n/2;
    y = repmat((1:m)',[1,n])-m/2;
    D = sqrt(x.^2 + y.^2);
    Theta = D*pi/Vel;
elseif strncmpi(Direction,'rad',3)
    x = repmat((1:n),[m,1])-n/2;
    y = repmat((1:m)',[1,n])-m/2;
    Theta = atan2(y,x);
    Theta = Theta*Vel;
else
    error('???????Horizontal?Vertical?Circle, Radiated ??');
end

if strncmpi(Col,'gra',3)
    I = cos(Theta + Ang);
    I = mat2gray(I);
    IM = uint8(MaxGrayVal*I);
elseif strncmpi(Col,'rgb',3)
    I = zeros(m,n);
    IM = uint8(zeros(m,n,3));
    for i = 1:3
        I = cos(Theta + i*Ang);
        IM(:,:,i) = uint8(MaxGrayVal*mat2gray(I));
    end
else
    error('???????Gray, Rgb ??');
end
if nargout == 0
    figure;
    imshow(IM);
else
    IMA = IM;
end

figure(9)
KK=abs(fftshift(IM));
imshow(KK);
%--------------------------------------------------------------------------
%  ??????
%--------------------------------------------------------------------------
function [Direction,Vel,Ang,Col,MaxGrayVal] = parseInputs(varargin)

if mod(nargin,2)~=0
    error('???????????????');
end
pnames = {'direction','velocity','angle' 'color','maxgrayvalue'};
dflts =  {'horizontal',30,pi/3,'gray',255};
[Direction,Vel,Ang,Col,MaxGrayVal] = ...
    internal.stats.parseArgs(pnames, dflts, varargin{:});

validateattributes(Direction,{'char'},{'nonempty'},mfilename,'direction');
validateattributes(Vel,{'numeric'},{'scalar','nonempty'},mfilename,'velocity');
validateattributes(Ang,{'numeric'},{'scalar','nonempty'},mfilename,'angle');
validateattributes(Col,{'char'},{'nonempty'},mfilename,'color');
validateattributes(MaxGrayVal,{'numeric'},{'scalar','nonempty'},mfilename,'maxgrayvalue');