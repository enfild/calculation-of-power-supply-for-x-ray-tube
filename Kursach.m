%%%%%%%%%%  ������ ��������������� ����������
U1min = 450; % 
Un1 = 62.5 * (10^3); %���������� �� ������
In = 80 * (10^(-3)); % ��� �� ������
f = 30 * (10^3);
Kp = 0.1; % ���������� �������� ��������� �� ������

m = 1; % ����� ����������� ����������������� 6 = ������, �������� ����������
%��������, ���������� � �������� ����� �������� ����� ��������������� �����������
Pn1 = Un1 * In;

B = 1;
D = 2.1;
A = 0.2;
F = 6.2;

U21 = 0.5 * Un1 * B;

I2 = 1.41 * D * In;

Uvobr = Un1 * 1.41 * B;

Ivsr = In;

Ivampl = In * F;

Ptgab = 0.7 * B * D * 2 * Pn1;
%� �������� �������� � ����� ����������� ���������� �������������� ������ 2� 108�.
Ustobrm = 6000; % �� ����

Nv = Uvobr / Ustobrm;
% ���-�� ���������� �������
Nv = ceil(Nv);
Upr = 10; % �� ����

Ipr = 180 * (10^(-3)); % �� ����
% ������������� ������� � �������� ���������
rv = Nv *(Upr/Ipr);
%� ����������� ��� ����� ������
Kr = 0.9;
fr = f;
%� ��������� ��������� ��������
Bm = 0.25;
%����� �������� ��������������
s = 2;
%��������������� ������������� ������� ��������������
rt = Kr * ((2 * Un1)/(In * fr * Bm)) * (((s * fr * Bm)/(Un1 * In))^(1/4));
% �������� ����������� �������������
rb = (2 * Un1)/(In * 100);
% �������� ������������� ���� �����������
r = rt + (2 * rv) + rb;
% ��������� ��������� � ������ ����: Un1 * m
A = (In * pi * r)/(Un1 * m);

B = 0.9;
D = 2.47;
F = 7.4;
% ���������� �� ��������� ������� ��������������
U21 = 0.5 * Un1 * B;
%�������� ���� ��������� �������
I2 = 1.41 * D * In;
%�������� ���������� �� �������
Uvobr = Un1 * 1.41 * B;
%����������� �������� ���� �������
Ivampl = In * F;
% ���������� �������� �������������� � ������ ���������
%��������:
Ptgab = 0.7 * B * D * 2 * Pn1;
% ��������������� ����. ��� ������� ���������, �� ����� 400��
H400 = 28; 

Hworkfreq = H400 / (fr * 400);
% ������� ������������ �����������
C = Hworkfreq / (r * Kp);
% ������������ ���������� �� ������������
Ucmax = Un1/2 + (rb / 2) * In;

% ��������� ���������� � �������
kf = 1.11;
j = 5;
k0 = 0.25;
% ������������ �������� ��������� ��������
Bmmax = 0.2;
% ������������ ������� ������� �������������� � ������� ����������� �������
Scomm = Ptgab * (10^2) / 2 * kf * fr * Bmmax * j * k0;

Scomm = 136.8; %% ������� ��� ���������� ���� �� �����
%��������� ������� ������� ��������������
Scsumm = 5.1 * (10^(-4));
% ����� ������ � ��������� ������� ��������������
W1 = U1min / (4 * kf * fr * Bmmax * Scsumm);

nT = 0.95;
%��� ��������������
n = Ucmax / (U1min * nT);

W21 = W1 * n;
W22 = W21;
% �������� �������� ��������������
P2 = 2 * U21 * I2; 
% ������� ��������
P1 = P2/nT; 
% ��� � ��������� �������
I1 = P1 / U1min; 
% ������� �������
d1 = 1.13 * sqrt(I1 / (2 * j));

d2 = 1.13 * sqrt(I2 / j);

kiz = 1.1; % ����������� ����������� ������� �������� ������� ���������� ������� ��������
kiz2 = 1.2;
% ������ ���� ����������
h = 28; 
% ����� ����� ��������� �������
m1 = (W1 * d11 * kiz) / (2 * h);
m1 = ceil(m1);
% ����� ����� ��������� �������
m2 = (W21 * d2 * kiz2) / (2 * h);
m2 = ceil(m2);
%������� ��������� �������
del1 = m1 * d1;
%������� ��������� �������
del2 = m2 * d2;
%������� �������� ����� ���������
del12 = 2 * (10^(-3));
% ������ �������
hn = h * 2;
%����� �������� ����� �������
lsr = 1;
%��������� ������������� �������
mu0 =  4 * pi * (10^(-7));
%������������� ��������� ��������������
Ls = (mu0 * lsr * W1 * W1) / (2 * hn) * (del12 + ((del1 + del2)/3)); 
%%%%%%%% ����� 4.2 ������ ����������������� ������������ ���������

Pnm = Ptgab;
Inm = I1;
Evhnom = 514;
%  ���������e ������ ��������� ���������
Ui1 = (Evhnom * 2 * sqrt(2))/ pi;
%��� ���������
URnom = Ui1;
%����������� �������� �������� ����
Ivh = (Inm * 2 * sqrt(2)) / pi;

%� �������� ������� ������ �������� ������������� ������ 
%IGBT ����� SEMITRANS: SKM50 GB 123D

%�������� ������������� �������� ���������
Rnm = Ui1 / Inm;
%����������� 
Q = 1;
%������� ������������ �������������� �������
C = 1 / (2 * pi * fr * Q * Rnm);
%������������� ������������ �������
Lk = (Q * Rnm) / (2 * pi * fr);
Ls = 15.5 * (10^(-6));
% ������������� �������� � ����������� ����
Ldr = Lk - Ls;
%� �������� ��������� ���������� �������� �������� ����������� �� � 140
mu = 120;
Brab = 0.6;
%V = 5.417 * (10^(-6));
% ������� ������������� ���������� ����
Hrab = Brab / (mu * mu0);
%������������ ������� ��������
Wl = (Ldr * Inm) / 2;
% ����� ���������� ��������
V = (2 * Wl) / (Brab * Hrab);
%�������� ��������� ��������� �55-32-11,7
%��������� ������� ����������� ������� ���������� Sc * 2
Sc = 117 * (10^(-6));
%����� ����������
lc = 130 * (10^(-3));
%������� ����
Sok = 804.3;
%����� ������ ��������
Omega = sqrt((Ldr * lc)/(2 * Sc * mu0 * mu));
%������� �������
d = 1.13 * sqrt(Inm / j);
%������� ����������� �������
Spr = Inm / j;
% �������� ������ ���� ��� - 2 ��������� 2,26 �� � ��������
Spr = 4.012;
Spr = Spr * 3;
% ����������� ���������� ���� �����
Kok = (4 * Spr * Omega) / Sok;

%%%%%%%%%%%%%%4.3. ������ �������� ����������� �����������
Uvh = 380; %�������
fs = 50; % �������
Un = Evhnom;
Inagr = Inm;
% ������������ ���� ������
Ufmax = 242;
%����������� ��������� ���������� �� ������ �����������
Uvmax = Ufmax *3 * sqrt(6) / pi;
%����������� ��������� ���������� �� ������ �����������
Udmax = Uvmax * pi / 3;
%������� �������� ���� ����� ����
Idsr = Inagr / 3;
%�������� ����� ���� DO-203AA, � ��������:
Uaobr = 1000;
Iapr = 12;
deltaUpr = 1.26;
%������������� �������� �����������
Rn = Un / Inagr;
%���� �� �����������
Iamax = 80;
Iamin = 25;
%������������ �������� �������� �����������
Rnmax = Rn * (Iamax / Iamin);
Lcrit = (2 * Rnmax) / ((m * m - 1) * m * 2 * pi * fs);
% ��������� �������� ������������� ��������
Ldros = 2 * (10^(-3));
%������� ������� 
q = 4;
%���������� ������� ������������ �������
Cf = (q + 1) / (Ldros * m * m * ((2 * pi * fs)^2));
%�������� �� ����������� ����������� ���� �50 � 32 � 600� � 470 ��� (��� ������������ ���������� �����������).


% �������������� ������ �������� �������
% ���������� ������������������ ����� 3424
%� ���� �������
Bml = 1.7;
jl = 2 * (10^6);
kok = 0.3;
kc = 0.9;
L = 2 * (10^(-3));
%������������ ������� ���� �� ������� ������� ���������� (Sok * Ssc)
Sprokserd = (L * (Inm * Inm)) / (Bm * jl * kok * kc);
%�������� ��������� ���� ��25-50-65
kok = 0.25;
%������� ������� ����������
Ssc = 11.25 * (10^(-4));
%���������� ����� ������ ������� ��������
W = (L * Inm) / (Bml * Ssc * kc);
%������� ������� ������� � ������� �������
Sprdr = Inm / j;
%������� �������
dprdr = 1.13 * sqrt(Sprdr);
%�������� ������ ���� ���-2 ��������� 2,26 ��. ������ ������� � ���������
% �� ��������� �����
delta = (mu0 * Ssc * kc * (W * W)) / L;


