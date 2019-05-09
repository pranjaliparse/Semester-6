data=load("data.txt")
[m n]=size(data);
alpha=0.1;
theta0=0;
theta1=0;
estimated_y=zeros(1,5);
actual_y=data(:,2);
Cost=0;
theta=[theta0 theta1];
x=[ones(5,1) data(:,1)]'
g=zeros(1,5);
theta11=zeros(100,2);
Cost1=zeros(100,1);
for i=1:100
   g=1./(1+e.^-(theta*x))
   if(g>=0.5)
   estimated_y=1;
   else
   estimated_y=0;
   endif
   Cost=-1/m*(actual_y'*log(g)'+(1-actual_y)'*log(1-g)')
   %surf(theta0,theta1,Cost);
   %hold on;
   if(Cost<0.1)
   break;
   endif
   theta11(i,1)=theta0;
   theta11(i,2)=theta1;
   theta0=theta0-alpha*(g-actual_y')*x(1,:)';
   theta1=theta1-alpha*(g-actual_y')*x(2,:)';
   theta=[theta0 theta1]
   Cost1(i)=Cost;
endfor

%plot(data(:,1),data(:,2),'rx','MarkerSize',10);
%hold on;
%plot(x,theta0+theta1*x);
%axis([0 6 -1 6]);
contour(theta11(:,1),theta11(:,2),Cost1);