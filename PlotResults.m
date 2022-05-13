clc;clear;close all
global k J__1 J__2 J__3 m__1 m__p L g__1 T A__1 A__2 A__3 A__4;
 J__1=0.03;J__2=0.03;J__3=0.05;m__1=1.6;m__p=0.16;L=1;g__1=10;
 A__1=1.5;A__2=0.75;A__3=2;T=8; A__4=1;
%%
syms t
r1= -A__1*sin(2*pi*t/T) + 1;
r2=A__2*sin(4*pi*t/T);
r3= -2*A__3 + A__3*sin(2*pi*t/T) + 1;
r4= 0.01*t;

d1r1=diff(r1,t);d2r1=diff(d1r1,t);d3r1=diff(d2r1,t);d4r1=diff(d3r1,t);d5r1=diff(d4r1,t);d6r1=diff(d5r1,t);
d1r2=diff(r2,t);d2r2=diff(d1r2,t);d3r2=diff(d2r2,t);d4r2=diff(d3r2,t);d5r2=diff(d4r2,t);d6r2=diff(d5r2,t);
d1r3=diff(r3,t);d2r3=diff(d1r3,t);d3r3=diff(d2r3,t);d4r3=diff(d3r3,t);d5r3=diff(d4r3,t);d6r3=diff(d5r3,t);
d1r4=diff(r4,t);d2r4=diff(d1r4,t);d3r4=diff(d2r4,t);


fid  = fopen('FLControllertmp.m','r');
f=fread(fid,'*char')';
fclose(fid);
f11=strrep(f,'diff(diff(diff(diff(diff(diff(ref__1(t), t), t), t), t), t), t)',strjoin({'(',char(d6r1),')'}));
f12 = strrep(f11,'diff(diff(diff(diff(diff(ref__1(t), t), t), t), t), t)',strjoin({'(',char(d5r1),')'}));
f13 = strrep(f12,'diff(diff(diff(diff(ref__1(t), t), t), t), t)',strjoin({'(',char(d4r1),')'}));
f14 = strrep(f13,'diff(diff(diff(ref__1(t), t), t), t)',strjoin({'(',char(d3r1),')'}));
f15 = strrep(f14,'diff(diff(ref__1(t), t), t)',strjoin({'(',char(d2r1),')'}));
f16 = strrep(f15,'diff(ref__1(t), t)',strjoin({'(',char(d1r1),')'}));
f17 = strrep(f16,'ref__1(t)',strjoin({'(',char(r1),')'}));
f18 = strrep(f17,'FLControllertmp','FLController');


f21=strrep(f18,'diff(diff(diff(diff(diff(diff(ref__2(t), t), t), t), t), t), t)',strjoin({'(',char(d6r2),')'}));
f22 = strrep(f21,'diff(diff(diff(diff(diff(ref__2(t), t), t), t), t), t)',strjoin({'(',char(d5r2),')'}));
f23 = strrep(f22,'diff(diff(diff(diff(ref__2(t), t), t), t), t)',strjoin({'(',char(d4r2),')'}));
f24 = strrep(f23,'diff(diff(diff(ref__2(t), t), t), t)',strjoin({'(',char(d3r2),')'}));
f25 = strrep(f24,'diff(diff(ref__2(t), t), t)',strjoin({'(',char(d2r2),')'}));
f26 = strrep(f25,'diff(ref__2(t), t)',strjoin({'(',char(d1r2),')'}));
f27 = strrep(f26,'ref__2(t)',strjoin({'(',char(r2),')'}));

f31=strrep(f27,'diff(diff(diff(diff(diff(diff(ref__3(t), t), t), t), t), t), t)',strjoin({'(',char(d6r3),')'}));
f32 = strrep(f31,'diff(diff(diff(diff(diff(ref__3(t), t), t), t), t), t)',strjoin({'(',char(d5r3),')'}));
f33 = strrep(f32,'diff(diff(diff(diff(ref__3(t), t), t), t), t)',strjoin({'(',char(d4r3),')'}));
f34 = strrep(f33,'diff(diff(diff(ref__3(t), t), t), t)',strjoin({'(',char(d3r3),')'}));
f35 = strrep(f34,'diff(diff(ref__3(t), t), t)',strjoin({'(',char(d2r3),')'}));
f36 = strrep(f35,'diff(ref__3(t), t)',strjoin({'(',char(d1r3),')'}));
f37 = strrep(f36,'ref__3(t)',strjoin({'(',char(r3),')'}));


f41 = strrep(f37,'diff(diff(diff(ref__4(t), t), t), t)',strjoin({'(',char(d3r4),')'}));
f42 = strrep(f41,'diff(diff(ref__4(t), t), t)',strjoin({'(',char(d2r4),')'}));
f43 = strrep(f42,'diff(ref__4(t), t)',strjoin({'(',char(d1r4),')'}));
f44 = strrep(f43,'ref__4(t)',strjoin({'(',char(r4),')'}));

fid  = fopen('FLController.m','w');
fprintf(fid,'%s',f44);
fclose(fid);
clear f41 f42 f43 f44 f31 f32 f33 f34 f35 f36 f37 f21
clear f22 f23 f24 f25 f26 f27 f28 f11 f12 f13 f14 f15
clear f16 f17 f18 d1r1 d2r1 d3r1 d4r1 d5r1 d6r1
clear d1r2 d2r2 d3r2 d4r2 d5r2 d6r2 d7r2 d1r3 d2r3
clear d3r3 d4r3 d5r3 d6r3 d1r4 d2r4 d3r4 
%%
A=zeros(20,20);
A(1,2)=1;A(2,3)=1;A(3,4)=1;A(4,5)=1;A(5,6)=1;
A(7,8)=1;A(8,9)=1;A(9,10)=1;A(10,11)=1;A(11,12)=1;
A(13,14)=1;A(14,15)=1;A(15,16)=1;A(16,17)=1;A(17,18)=1;
A(19,20)=1;
B=zeros(20,4);
B(6,1)=1;B(12,2)=1;B(18,3)=1;B(20,4)=1;
Q =1 *diag(ones(20,1));
Q(1,1) =1000000 ;
Q(7,7) =1000000;
Q(13,13) =1000000;
Q(19,19) =1000000;

R = diag(1*[1,1,1,1]);
[k,S,e] = lqr(A,B,Q,R);
p1_0 = -1.2;  p2_0 = 0.2; p3_0 = -1.2;v1_0 = -.01;  v2_0 = .05; v3_0 = 2.1;u1_0=0;u2_0=0;u3_0=0;u4_0=0;
alpha_0 = 3*pi/180; beta_0 = 4*pi/180; alpha_dt_0 = 0.1; beta_dt_0 = 0.05;
fi = 5*pi/180; tet = 4*pi/180;sai = 2*pi/180;fi_dt_0 = 0.2; tet_dt_0 = 0.15;sai_dt_0 = 0.05;
InitialCond=[p1_0;p2_0;p3_0;alpha_0;beta_0;fi;tet;sai;v1_0;v2_0;v3_0;alpha_dt_0;beta_dt_0;fi_dt_0;tet_dt_0;sai_dt_0;u1_0;u2_0;u3_0;u4_0];
[t,x]=ode45(@QuadSuspendedLoad, [0,40],InitialCond);

h1=x(:,1);
h2=x(:,2);
h3=x(:,3);
h4=x(:,8);
t1=t; clear t; syms t;
%%
for i=1:length(x)
    U(i,:)=FLController(x(i,:),t1(i,1));
end
ubar=(-L.*cos(x(:,4)).*cos(x(:,5)).^3.*m__1.*x(:,12).^2 - L.*cos(x(:,4)).*cos(x(:,5)).*m__1.*x(:,13).^2 - (m__1 + m__p).*(x(:,17) - g__1))./(cos(x(:,4)).*((cos(x(:,4)).*cos(x(:,6)).*cos(x(:,7)) - sin(x(:,4)).*(cos(x(:,6)).*sin(x(:,7)).*sin(x(:,8)) - sin(x(:,6)).*cos(x(:,8)))).*cos(x(:,5)) + sin(x(:,5)).*(cos(x(:,6)).*sin(x(:,7)).*cos(x(:,8)) + sin(x(:,6)).*sin(x(:,8)))).*cos(x(:,5)));
%%
%Lets see some figures
%Quad Pos
figure
title('Stabilization: full sys (16^{th}order), DEA alg result')
subplot(3,2,1)
ezplot(r1,[min(t1),max(t1)]);hold on;plot(t1,h1,'.b');
ylabel('X_{Load}(m)')
legend('X_{ref}','h_{1}');
grid on
set(gca,'fontsize', 11,'FontWeight','bold');
%%
subplot(3,2,2)
ezplot(r2,[min(t1),max(t1)]);hold on;plot(t1,h2,'.b');
ylabel('Y_{Load}(m)')
legend('Y_{ref}','h_{2}');
grid on
set(gca,'fontsize', 11,'FontWeight','bold');
%%
subplot(3,2,3)
ezplot(r3,[min(t1),max(t1)]);hold on;plot(t1,h3,'.b');
ylabel('Z_{Load}(m)')
grid on
legend('Z_{ref}','h_{3}');
grid on
set(gca,'fontsize', 11,'FontWeight','bold');
%%
subplot(3,2,4)
ezplot(r4*180/pi,[min(t1),max(t1)]);hold on;plot(t1,h4*180/pi,'.b');
ylabel('Heading^{o}')
grid on
legend('RefHeading_{ref}','h_{4}');
grid on
set(gca,'fontsize', 11,'FontWeight','bold');
%%
%Inputs
subplot(3,2,5)
 plot(t1,ubar,'.r');
 hold on;
 plot(t1,U(:,2),'.b');
 hold on;
 plot(t1,U(:,3),'.g');
 hold on;
 plot(t1,U(:,4),'.g');
ylabel('Input')
grid on
set(gca,'fontsize', 11,'FontWeight','bold');
legend('Ubar','F{1}','F{2}','F{3}')
xlabel('Time(s)')
grid on
set(gca,'fontsize', 11,'FontWeight','bold');

