function varargout = dve_rectangleFTEsearch_V2(varargin)
% DVE_RECTANGLEFTESEARCH_V2 MATLAB code for dve_rectangleFTEsearch_V2.fig
%      DVE_RECTANGLEFTESEARCH_V2, by itself, creates a new DVE_RECTANGLEFTESEARCH_V2 or raises the existing
%      singleton*.
%
%      H = DVE_RECTANGLEFTESEARCH_V2 returns the handle to a new DVE_RECTANGLEFTESEARCH_V2 or the handle to
%      the existing singleton*.
%
%      DVE_RECTANGLEFTESEARCH_V2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DVE_RECTANGLEFTESEARCH_V2.M with the given input arguments.
%
%      DVE_RECTANGLEFTESEARCH_V2('Property','Value',...) creates a new DVE_RECTANGLEFTESEARCH_V2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dve_rectangleFTEsearch_V2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dve_rectangleFTEsearch_V2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dve_rectangleFTEsearch_V2

% Last Modified by GUIDE v2.5 17-Aug-2011 14:27:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dve_rectangleFTEsearch_V2_OpeningFcn, ...
                   'gui_OutputFcn',  @dve_rectangleFTEsearch_V2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before dve_rectangleFTEsearch_V2 is made visible.
function dve_rectangleFTEsearch_V2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dve_rectangleFTEsearch_V2 (see VARARGIN)

% Choose default command line output for dve_rectangleFTEsearch_V2
handles.output = hObject;

handles.nden=1e6;         %factor for density
handles.nt  =1e6;         %factor for temperature
handles.nv  =1e3;         %factor for velocity
handles.nb  =1e-9;        %factor for magnetic field
handles.kb  =1.38*1e-23;  %Boltzmann's constant
handles.kb2 = 8.61739*1e-5;   % Boltzmann's constant (eV/K);
handles.miu =4.0*pi*1e-7; %permeability
handles.mp  =1.67*1e-27;  %proton mass
handles.tcf = 24*3600.;   %time conversion factor
handles.dhead = 1;

disp(['handles.nden from OpenFcn=',num2str(handles.nden)])
disp(['handles.nt from OpenFcn=',num2str(handles.nt)])
disp(['handles.nv from OpenFcn=',num2str(handles.nv)])
disp(['handles.nb from OpenFcn=',num2str(handles.nb)])
disp(['handles.kb from OpenFcn=',num2str(handles.kb)])
disp(['handles.kb2 from OpenFcn=',num2str(handles.kb2)])
disp(['handles.miu from OpenFcn=',num2str(handles.miu)])
disp(['handles.mp from OpenFcn=',num2str(handles.mp)])
disp(['handles.tcf from OpenFcn=',num2str(handles.tcf)])
disp(['handles.dhead from OpenFcn=',num2str(handles.dhead)])
% Update handles structure

guidata(hObject, handles);

% UIWAIT makes dve_rectangleFTEsearch_V2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = dve_rectangleFTEsearch_V2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function btn_dphiup_Callback(hObject, eventdata, handles)
handles.dphi=handles.dphi+handles.azi;
set(uicontrol(handles.txt_dphi),'String',num2str(handles.dphi));
set(handles.etxt_dphi,'String',num2str(handles.dphi));
guidata(hObject, handles);

function btn_dphidn_Callback(hObject, eventdata, handles)
handles.dphi=handles.dphi-handles.azi;
set(uicontrol(handles.txt_dphi),'String',num2str(handles.dphi));
set(handles.etxt_dphi,'String',num2str(handles.dphi));
guidata(hObject, handles);

function btn_dthetaup_Callback(hObject, eventdata, handles)
handles.dtheta=handles.dtheta+handles.pol;
set(uicontrol(handles.txt_dtheta),'String',num2str(handles.dtheta));
set(handles.etxt_dtheta,'String',num2str(handles.dtheta));
guidata(hObject, handles);

function btn_dthetadn_Callback(hObject, eventdata, handles)
handles.dtheta=handles.dtheta-handles.pol;
set(uicontrol(handles.txt_dtheta),'String',num2str(handles.dtheta));
set(handles.etxt_dtheta,'String',num2str(handles.dtheta));
guidata(hObject, handles);

function btn_next_Callback(hObject, eventdata, handles)

function btn_prev_Callback(hObject, eventdata, handles)
% PREV AND NEXT don't do anything yet.  

%=============================== Save Button ========================================
function btn_save_Callback(hObject, eventdata, handles)
hgsave(handles.axes1,'handles.axes1.sav');
figpos = [1, 1, 800,600];
% outpos = [1, 1, 900,700];
% figure('Position',figpos, 'OuterPosition', outpos);
figure('Position',figpos);
hgload('handles.axes1.sav');
handles.axesSave=gca;
set(handles.axesSave,'Units','pixels');
axpos=[80,220,400,200];
set(handles.axesSave,'Position',axpos);
disp(' ')
txt_titlex=uicontrol(gcf,'Style','text','Position',[10,170,30,13],'Fontsize',11,'String','x:','BackgroundColor','w','HorizontalAlignment','left');
txt_titley=uicontrol(gcf,'Style','text','Position',[10,155,30,13],'Fontsize',11,'String','y:','BackgroundColor','w','HorizontalAlignment','left');
txt_titlez=uicontrol(gcf,'Style','text','Position',[10,140,30,13],'Fontsize',11,'String','z:','BackgroundColor','w','HorizontalAlignment','left');
txt_titlexs=uicontrol(gcf,'Style','text','Position',[30,185,30,13],'Fontsize',11,'String','xs','BackgroundColor','w');
txt_titleys=uicontrol(gcf,'Style','text','Position',[65,185,30,13],'Fontsize',11,'String','ys','BackgroundColor','w');
txt_titlezs=uicontrol(gcf,'Style','text','Position',[100,185,30,13],'Fontsize',11,'String','zs','BackgroundColor','w');
txt_titlev0=uicontrol(gcf,'Style','text','Position',[140,185,30,13],'Fontsize',11,'String','V0','BackgroundColor','w');
handles.txt_savexx=uicontrol(gcf,'Style','text','Position',[30,170,30,13],'Fontsize',11,'String','x.xxx','BackgroundColor','w','HorizontalAlignment','left');
handles.txt_savexy=uicontrol(gcf,'Style','text','Position',[30,155,30,13],'Fontsize',11,'String','x.xxx','BackgroundColor','w','HorizontalAlignment','left');
handles.txt_savexz=uicontrol(gcf,'Style','text','Position',[30,140,30,13],'Fontsize',11,'String','x.xxx','BackgroundColor','w','HorizontalAlignment','left');
handles.txt_saveyx=uicontrol(gcf,'Style','text','Position',[65,170,30,13],'Fontsize',11,'String','x.xxx','BackgroundColor','w','HorizontalAlignment','left');
handles.txt_saveyy=uicontrol(gcf,'Style','text','Position',[65,155,30,13],'Fontsize',11,'String','x.xxx','BackgroundColor','w','HorizontalAlignment','left');
handles.txt_saveyz=uicontrol(gcf,'Style','text','Position',[65,140,30,13],'Fontsize',11,'String','x.xxx','BackgroundColor','w','HorizontalAlignment','left');
handles.txt_savezx=uicontrol(gcf,'Style','text','Position',[100,170,30,13],'Fontsize',11,'String','x.xxx','BackgroundColor','w','HorizontalAlignment','left');
handles.txt_savezy=uicontrol(gcf,'Style','text','Position',[100,155,30,13],'Fontsize',11,'String','x.xxx','BackgroundColor','w','HorizontalAlignment','left');
handles.txt_savezz=uicontrol(gcf,'Style','text','Position',[100,140,30,13],'Fontsize',11,'String','x.xxx','BackgroundColor','w','HorizontalAlignment','left');
handles.txt_savev0x=uicontrol(gcf,'Style','text','Position',[140,170,30,13],'Fontsize',11,'String','x.xxx','BackgroundColor','w','HorizontalAlignment','left');
handles.txt_savev0y=uicontrol(gcf,'Style','text','Position',[140,155,30,13],'Fontsize',11,'String','x.xxx','BackgroundColor','w','HorizontalAlignment','left');
handles.txt_savev0z=uicontrol(gcf,'Style','text','Position',[140,140,30,13],'Fontsize',11,'String','x.xxx','BackgroundColor','w','HorizontalAlignment','left');
% set(uicontrol(handles.txt_savephi),'String',num2str(handles.savephi, '%3.1f  '));
% set(uicontrol(handles.txt_savetheta),'String',num2str(handles.savetheta, '%3.1f  '));
set(uicontrol(handles.txt_savezx),'String',num2str(handles.zs(1),'%1.3f'));
set(uicontrol(handles.txt_savezy),'String',num2str(handles.zs(2),'%1.3f'));
set(uicontrol(handles.txt_savezz),'String',num2str(handles.zs(3),'%1.3f'));
set(uicontrol(handles.txt_savexx),'String',num2str(handles.xs(1),'%1.3f'));
set(uicontrol(handles.txt_savexy),'String',num2str(handles.xs(2),'%1.3f'));
set(uicontrol(handles.txt_savexz),'String',num2str(handles.xs(3),'%1.3f'));
set(uicontrol(handles.txt_saveyx),'String',num2str(handles.ys(1),'%1.3f'));
set(uicontrol(handles.txt_saveyy),'String',num2str(handles.ys(2),'%1.3f'));
set(uicontrol(handles.txt_saveyz),'String',num2str(handles.ys(3),'%1.3f'));
set(uicontrol(handles.txt_savev0x),'String',num2str(handles.V0(1), '%3.1f  '));
set(uicontrol(handles.txt_savev0y),'String',num2str(handles.V0(2), '%3.1f  '));
set(uicontrol(handles.txt_savev0z),'String',num2str(handles.V0(3), '%3.1f  '));
fig = gcf;
dnm = num2str([handles.yr,handles.month,handles.day]);
thnm = num2str(round(handles.theta));
phnm = num2str(round(handles.phi));
tmnm1 = datestr(handles.ta);
tmnm2 = datestr(handles.tb);
filename = ['gsmap_','th',handles.sc,'_',dnm,'_',tmnm1(13:14),tmnm1(16:17),tmnm1(19:20),'_',tmnm2(13:14),tmnm2(16:17),tmnm2(19:20),'_theta',thnm,'_phi',phnm,'.png'];
saveas(fig,filename,'png');
disp(['File saved as ', filename])
close(figure(fig));
        
%========================== Load Button ===============================
function btn_load_Callback(hObject, eventdata, handles)
    if isfield(handles,'etxt_w') == 0
      handles=catstruct(handles,guihandles);
    end
    guidata(hObject, handles);    

    if isfield(handles, 'dhead') == 0
      handles.nden=1e6;         %factor for density
      handles.nt  =1e6;         %factor for temperature
      handles.nv  =1e3;         %factor for velocity
      handles.nb  =1e-9;        %factor for magnetic field
      handles.kb  =1.38*1e-23;  %Boltzmann's constant
      handles.kb2 = 8.61739*1e-5;   % Boltzmann's constant (eV/K);
      handles.miu =4.0*pi*1e-7; %permeability
      handles.mp  =1.67*1e-27;  %proton mass
      handles.tcf = 24*3600.;   %time conversion factor
      handles.dhead = 1;

      disp(['handles.nden from Load Button=',num2str(handles.nden)])
      disp(['handles.nt from Load Button=',num2str(handles.nt)])
      disp(['handles.nv from Load Button=',num2str(handles.nv)])
      disp(['handles.nb from Load Button=',num2str(handles.nb)])
      disp(['handles.kb from Load Button=',num2str(handles.kb)])
      disp(['handles.kb2 from Load Button=',num2str(handles.kb2)])
      disp(['handles.miu from Load Button=',num2str(handles.miu)])
      disp(['handles.mp from Load Button=',num2str(handles.mp)])
      disp(['handles.tcf from Load Button=',num2str(handles.tcf)])
      disp(['handles.dhead from Load Button=',num2str(handles.dhead)])
    end



    disp('===========================Begin LOAD Button Data=================================')
    dir = '~/Documents/MATLAB/';
    HHi = sscanf(handles.ti,'%2c%0.2*4c');
    MMi = sscanf(handles.ti, '%*3c%2c0%*2c', 2);
    SSi = sscanf(handles.ti, '%*6c%2c0', 2);
    HHf = sscanf(handles.tf,'%2c%0.2*4c');
    MMf = sscanf(handles.tf, '%*3c%2c0%*2c', 2);
    SSf = sscanf(handles.tf, '%*6c%2c0', 2);
    % File 1 %
    fn = strcat(dir,'th',handles.sc,'_',num2str(strcat(handles.yr,handles.month,handles.day)),'_',num2str(strcat(HHi,MMi)),'_',num2str(strcat(HHf,MMf)),'_GSM_v4_',handles.src,'.dat');
    handles.a = importdata(fn,' ',handles.dhead);
    disp(['handles.a is loaded.  Class(handles.a.data)  = ',class(handles.a.data)])
    disp(['                      Size(handles.a.data)  = ', num2str(size(handles.a.data))])
    % File 2 %
    handles.n=113;
    fnsh=strcat(dir,'themis_fte_iaga_2011_msheath.txt')
    %     fnsh=['/FTE/2011/findings/themis_fte_iaga_2011_msheath.txt'];
    mshfid = fopen(fnsh);
    handles.msh = textscan(mshfid, '%s %s %s %s %f %s %s %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f', handles.n);
    fclose(mshfid);
    disp(['handles.msh is loaded.  Class(handles.msh.data)  = ',class(handles.msh)])
    disp(['                      Size(handles.msh.data)  = ', num2str(size(handles.msh))])
    % File 3 %
    ff = strcat(dir,'themis_fte_iaga_2011_clean_final_timeorder_recons.txt');
    %     ff='/FTE/2011/findings/themis_fte_iaga_2011_clean_final_timeorder_recons.txt';
    fid = fopen(ff);
    handles.f = textscan(fid, '%2c %s %s %s %f %s %s %f %f %f', handles.n);
    fclose(fid);
    disp(['handles.f is loaded.  Class(handles.f.data)  = ',class(handles.f)])
    disp(['                      Size(handles.f.data)  = ', num2str(size(handles.f))])
    msh_vx = handles.msh{13}(handles.nev);
    msh_vy = handles.msh{14}(handles.nev);
    msh_vz = handles.msh{15}(handles.nev);
    msh_v = [msh_vx,msh_vy,msh_vz];
    handles.V0=msh_v;
    handles.nV0=handles.V0/norm(handles.V0);
    handles.xsv0 = -handles.nV0;
    handles.secs = handles.a.data(:,1);
    handles.BX=handles.a.data(:,2);
    handles.BY=handles.a.data(:,3);
    handles.BZ=handles.a.data(:,4); 	% Assigns handles.BX, By, Bz (from file - GSM)
    VX=handles.a.data(:,6);
    VY=handles.a.data(:,7);
    VZ=handles.a.data(:,8); 	% Assigns Vx, Vy, Vz (from file - (km/s(GSE))
    handles.Nx=handles.a.data(:,10); 					% assigns plasma N density from file (cm^-3)
    handles.Tx=handles.a.data(:,11); 					% assigns temp from file (K)
    idata=1:length(handles.BX);         

%============%
% TIME STUFF %
%============%
        sdoy = strcat(num2str(handles.yr),'-',num2str(handles.month),'-',num2str(handles.day));
        tstart = strcat(sdoy,'/',handles.ti);
        tstop = strcat(sdoy,'/',handles.tf);
        %-------------------------------------------------%
        % i & f consider only the start/stop time of the  % entire data set (on the scale of
        % hours)         %
        %-------------------------------------------------%
        tsi = datestr(tstart, 'mmmm/dd/yyyy HH:MM:SS:FFF');
        tsf = datestr(tstop, 'mmmm/dd/yyyy HH:MM:SS:FFF');
        vtsi = datevec(tsi, 'mmmm/dd/yyyy HH:MM:SS:FFF');
        vtsf = datevec(tsf, 'mmmm/dd/yyyy HH:MM:SS:FFF');
        dni = datenum(vtsi);
        dnf = datenum(vtsf);
        %---------------------------------%
        % 1 & 2 consider stop/start times % for FTE from the file or array  %
        %---------------------------------%
        t1 = handles.f{2}(handles.nev);
        t2 = handles.f{4}(handles.nev);
        fvts1 = datevec(t1, 'yyyy-mm-dd/HH:MM:SS');
        fvts2 = datevec(t2, 'yyyy-mm-dd/HH:MM:SS');
        fdn1 = datenum(fvts1);
        fdn2 = datenum(fvts2);
        %------------------------------------%
        % a & b consider adjusted FTE window % set by the user input 'w'          %
        %------------------------------------%
        t1f1 = etime(fvts1,vtsi);   % returns number of seconds from start of window to start of FTE
        t1f2 = etime(fvts2,vtsi);   % elapsed time from start of window to stop of FTE (s)
        tstep = handles.a.data(:,1);
        j = tstep >= t1f1 & tstep < t1f2;
        k = find(j);
        handles.w=str2double(get(handles.etxt_w,'String'));
        ns1 = k(1)-handles.w;                % adds two data points to either side
        ns2 = k(end) + handles.w;            % of FTE
        handles.i1 = ns1;
        handles.i2 = ns2;
        secs=handles.secs;
        dwa = secs(ns1);   
        dwb = secs(ns2);
        handles.fdna = addtodate(dni,dwa,'second');
        handles.fdnb = addtodate(dni,dwb,'second');
        disp(['fdna = ',handles.fdna])
        disp(['fdnb = ',handles.fdnb])
        handles.ta=handles.fdna;
        handles.tb=handles.fdnb;
%================%
% TIME STUFF END %
%================%
    handles.bc=[handles.BX(handles.i1:handles.i2) handles.BY(handles.i1:handles.i2) handles.BZ(handles.i1:handles.i2)];				% re-assigns B for some reason, should be the same as above.
    handles.bx = handles.bc(:,1);
    handles.by = handles.bc(:,2);
    handles.bz = handles.bc(:,3);
    handles.ndata = numel(handles.bx);
    handles.vp=[VX(handles.i1:handles.i2) VY(handles.i1:handles.i2) VZ(handles.i1:handles.i2)];
    handles.lenb = length(handles.bc(:,1));  
    % --- Call MVAB Function
    [Kbmax,Kbint,Kbmin,qmva,d1,d2,d3]=MVAB(handles.bc,handles.lenb);
    handles.Kbmax=Kbmax;
    handles.Kbint=Kbint;
    handles.Kbmin=Kbmin;
    handles.ztemp = handles.Kbint;      % 
    handles.ytemp = handles.Kbmax;      % 
    handles.xtemp = handles.Kbmin;      % MP Normal
    handles.nxorig=handles.ztemp(1);
    handles.nyorig=handles.ztemp(2);
    handles.nzorig=handles.ztemp(3);
    % --- (zx0, zy0, zz0)
    disp(['nxorig=',num2str(handles.nxorig)]);
    disp(['nyorig=',num2str(handles.nyorig)]);
    disp(['nzorig=',num2str(handles.nzorig)]);
    handles.zs0 = [handles.nxorig, handles.nyorig, handles.nzorig];
    handles.theta0=acosd(handles.nzorig);
    handles.phi0=atand(abs(handles.nyorig)/abs(handles.nxorig));
    if (handles.nxorig < 0.0) && (handles.nyorig >= 0.0);
      handles.phi0=-handles.phi0+180;
    end
    if (handles.nxorig < 0.0) && (handles.nyorig < 0.0);
      handles.phi0= handles.phi0+180;
    end
    if (handles.nxorig >= 0.0) && (handles.nyorig < 0.0);
      handles.phi0=-handles.phi0+360;
    end

    handles.dphi = 0.0;
    handles.dtheta = 0.0;
    guidata(hObject, handles);
    set(handles.txt_dphi,'String',num2str(handles.dphi, '%3.1f'));
    set(handles.etxt_dphi,'String',num2str(handles.dphi, '%3.1f'));
    set(handles.txt_dtheta,'String',num2str(handles.dtheta, '%3.1f'));
    set(handles.etxt_dtheta,'String',num2str(handles.dtheta,'%3.1f'));
    set(uicontrol(handles.txt_theta0),'String',num2str(handles.theta0, '%3.1f'));
    set(uicontrol(handles.txt_phi0),'String',num2str(handles.phi0, '%3.1f'));
    set(uicontrol(handles.txt_zs0x),'String',num2str(handles.zs0(1), '%1.3f'));
    set(uicontrol(handles.txt_zs0y),'String',num2str(handles.zs0(2), '%1.3f'));
    set(uicontrol(handles.txt_zs0z),'String',num2str(handles.zs0(3), '%1.3f'));
    set(uicontrol(handles.txt_v0x),'String',num2str(handles.V0(1), '%3.1f  '));
    set(uicontrol(handles.txt_v0y),'String',num2str(handles.V0(2), '%3.1f  '));
    set(uicontrol(handles.txt_v0z),'String',num2str(handles.V0(3), '%3.1f  '));
    
    handles.headera = strcat('FTE start: ',datestr(handles.fdna), ' NEV: ', num2str(handles.nev),', w:', num2str(handles.w), ', ny:', num2str(handles.ny));
    handles.headerb = strcat('FTE stop: ',datestr(handles.fdnb), ', sc:', handles.sc, ', src:', handles.src);
    set(uicontrol(handles.txt_headera),'String',handles.headera);
    set(uicontrol(handles.txt_headerb),'String',handles.headerb);
    guidata(hObject, handles);
    disp('======================= End Load Function ===================')
    
%========================== Display Button ============================
function btn_display_Callback(hObject, eventdata, handles)
    % --- Update Headers
    handles.headera = strcat('FTE start: ',datestr(handles.fdna), ' NEV: ', num2str(handles.nev),', w:', num2str(handles.w), ', ny:', num2str(handles.ny));
    handles.headerb = strcat('FTE stop: ',datestr(handles.fdnb), ', sc:', handles.sc, ', src:', handles.src);
    set(uicontrol(handles.txt_headera),'String',handles.headera);
    set(uicontrol(handles.txt_headerb),'String',handles.headerb);
    guidata(hObject, handles);
    % --- Populate GUI
    axes(handles.axes1);
    cla(handles.axes1);
    disp('==================== 1st Coordinate Transform Data ====================')
    disp('Transforming zs from GSM to local, using MVAB Kbint value')
    vza=handles.V0*handles.zs0';
    vzav=vza*handles.zs0;
    vhtsv=handles.V0-vzav;
    vhts=sqrt(vhtsv*vhtsv');
    vhtsn=vhtsv./vhts;
    handles.xs0=-vhtsn;
    handles.ys0=cross(handles.zs0,handles.xs0);
    handles.ys0=handles.ys0./norm(handles.ys0);
    disp(' ')
    nxtest=sind(handles.theta0)*cosd(handles.phi0);
    nytest=sind(handles.theta0)*sind(handles.phi0);
    nztest=cosd(handles.theta0);
    guidata(hObject, handles);
    disp(['nxtest = ', num2str(nxtest)])
    disp(['nytest = ', num2str(nytest)])
    disp(['nytest = ', num2str(nytest)])
    disp(['Starting xs (from V0) = ', num2str(handles.xs0, ' %3.3f')])
    disp(['Starting ys (from X product) = ', num2str(handles.ys0, ' %3.3f')])
    disp(['Starting zs (from MVAB Kbint) = ', num2str(handles.zs0, ' %3.3f')])
    disp(['Dot Product of xs & ys = ', num2str(handles.xs0*handles.ys0')])
    disp(['Dot Product of zs & xs = ', num2str(handles.zs0*handles.xs0')])
    disp(['Dot Product of ys & zs = ', num2str(handles.ys0*handles.zs0')])
    disp('Getting adjustment angles for next rotation...')
    disp('==================== End 1st Coordinate Transform  ====================')
    disp(' ')
    disp(' ')
    disp('=================== 2nd Coordinate Transform ======================')

    % --- get updated angles from interface bold text in "Manual Adjust" Panel
    handles.dphi = str2double(get(uicontrol(handles.txt_dphi), 'String')); 
    handles.dtheta = str2double(get(uicontrol(handles.txt_dtheta), 'String')); 
    %------ set handles.phi and handles.theta ----------
    handles.theta = handles.theta0+handles.dtheta;     %
    handles.phi = handles.phi0+handles.dphi;           %
    %---------------------------------------------------
    guidata(hObject, handles);
    handles.nxp=sind(handles.theta)*cosd(handles.phi);
    handles.nyp=sind(handles.theta)*sind(handles.phi);
    handles.nzp=cosd(handles.theta);
    handles.nitr=[handles.nxp,handles.nyp,handles.nzp];
    handles.zs=handles.nitr;
    vza=handles.V0*handles.zs';
    vzav=vza*handles.zs;
    vhtsv=handles.V0-vzav;
    vhts=sqrt(vhtsv*vhtsv');
    vhtsn=vhtsv./vhts;
    handles.xs=-vhtsn;
    handles.ys=cross(handles.zs,handles.xs);
    handles.ys=handles.ys./norm(handles.ys);
    guidata(hObject, handles);
    disp(['Final xs after all Xforms = ', num2str(handles.xs,' %2.3f')])
    disp(['Final ys after all Xforms = ', num2str(handles.ys,' %2.3f')])
    disp(['Final zs after all Xforms = ', num2str(handles.zs,' %2.3f')])
    disp(' ')
    disp('--------- Orthogonal Test (should be very close to 0.0) ---------')
    disp(['xs dot ys =', num2str(handles.xs*handles.ys')])
    disp(['ys dot zs =', num2str(handles.ys*handles.zs')])
    disp(['xs dot zs =', num2str(handles.xs*handles.zs')])
    disp(' ')
    set(uicontrol(handles.txt_dphi),'String',num2str(handles.dphi, '%3.1f  '));
    set(uicontrol(handles.txt_dtheta),'String',num2str(handles.dtheta, '%3.1f  '));
    set(uicontrol(handles.etxt_dphi),'String',num2str(handles.dphi, '%3.1f  '));
    set(uicontrol(handles.etxt_dtheta),'String',num2str(handles.dtheta, '%3.1f  '));
    set(uicontrol(handles.txt_zsx),'String',num2str(handles.zs(1),'%1.3f'));
    set(uicontrol(handles.txt_zsy),'String',num2str(handles.zs(2),'%1.3f'));
    set(uicontrol(handles.txt_zsz),'String',num2str(handles.zs(3),'%1.3f'));
    set(uicontrol(handles.txt_xsx),'String',num2str(handles.xs(1),'%1.3f'));
    set(uicontrol(handles.txt_xsy),'String',num2str(handles.xs(2),'%1.3f'));
    set(uicontrol(handles.txt_xsz),'String',num2str(handles.xs(3),'%1.3f'));
    set(uicontrol(handles.txt_ysx),'String',num2str(handles.ys(1),'%1.3f'));
    set(uicontrol(handles.txt_ysy),'String',num2str(handles.ys(2),'%1.3f'));
    set(uicontrol(handles.txt_ysz),'String',num2str(handles.ys(3),'%1.3f'));
    set(uicontrol(handles.txt_cphi),'String',num2str(handles.phi, '%3.1f  '));
    set(uicontrol(handles.txt_ctheta),'String',num2str(handles.theta, '%3.1f  '));
    handles.dTim1 = handles.secs(handles.i1:handles.i2)-handles.secs(handles.i1);               % my code (dd, 2011)

    % project B into reconstruction coord.
    handles.bxs=(handles.bc.*handles.nb)*handles.xs';
    handles.bys=(handles.bc.*handles.nb)*handles.ys';
    handles.bzs=(handles.bc.*handles.nb)*handles.zs';
    handles.vxs = -handles.V0*handles.xs';
    handles.xa0=handles.vxs.*handles.dTim1;
    handles.iix = handles.i1:handles.i2;
    handles.dzn=handles.Nx(handles.iix);                    % density reconstruction by matrix
    handles.Tp = handles.Tx(handles.iix)/handles.kb2;
    %Project V into reconstruction coord.
    vxc=zeros(1,handles.ndata);
    vyc=zeros(1,handles.ndata);
    vzc=zeros(1,handles.ndata);
    for i=1:handles.ndata
      vxc(i)=(handles.vp(i,:)-handles.V0)*handles.xs';
      vyc(i)=(handles.vp(i,:)-handles.V0)*handles.ys';
      vzc(i)=(handles.vp(i,:)-handles.V0)*handles.zs';
    end

    % avplx=mean(vxc);
    % avply=mean(vyc);
    % avplz=mean(vzc);
    % set(uicontrol(handles.txt_ysx), 'String',num2str(avplx, '%3.1f'));
    % set(uicontrol(handles.txt_ysy),'String',num2str(avply, '%3.1f '));
    % set(uicontrol(handles.txt_ysz),'String',num2str(avplz, '%3.1f '));

    zsx = strcat(num2str(handles.zs(1),'%1.3f'),',');
    zsy = strcat(num2str(handles.zs(2),'%1.3f'),',');
    zsz = num2str(handles.zs(3),'%1.3f');
    disp(strcat('(zsx,zsy,zsz)=(',zsx,zsy,zsz,')'));
    if exist('v0gsm')==1,
      disp(strcat('v0gsm=',num2str(v0gsm)));
    end

    %Calculate vector potential A along y=0
    ndA=zeros(1,handles.lenb);
    for i=2:handles.lenb                       %
      ndA(i)=-(handles.bys(i)+handles.bys(i-1))*(handles.dTim1(i)-handles.dTim1(i-1))*handles.vxs*handles.nv*0.5;  % Determines A for different
    end
    A1=cumsum(ndA);                   % Area: cumulative sum.  every iteration, we add more area
    A1=A1';                           % transpose A1
    bb=sqrt(handles.bxs.^2+handles.bys.^2+handles.bzs.^2);  % magnitude of total bfield 
    pp=handles.dzn.*handles.Tp*handles.kb*handles.nden;     % new pp factor (without nt)
    bmax=max(bb);                                           % maximum b magnitude
    nmax=max(handles.dzn)*handles.nden;                     % density maximum value
    %Normalized factors
    handles.b0=bmax;                                        % b0 = max total b magnitude
    p0=bmax*bmax/handles.miu;                               % max pressure value
    n0=nmax;                                                % max density value from 5 lines above.
    vv0=sqrt(handles.b0^2/(handles.miu*n0*handles.mp)*1e-6);% max b field divided by max density & constants
    A0=max(abs(A1));                                        % A0 = maximum Area Value
    handles.L0=(A0/bmax)*1e-3;                              % L0 = average B/unit area
    disp(['L0=',num2str(handles.L0)])                       % disp L0
    handles.pbz=pp./p0+((handles.bzs./handles.b0).^2)/2;    % pbz = magnetic pressure in bz?
    handles.An=A1./A0;                                      % normalizes range of area from 0 to 1
    guidata(hObject, handles);
    handles.amax1=max(handles.An);                          % max normalized value (1)
    handles.amin1=min(handles.An);                          % min normalized value (0)
    handles.fS1=polyfit(handles.An,handles.pbz,4);          %Pt(A)   
    handles.fZ1=polyfit(handles.An,handles.bzs/handles.b0,5); %Bz(A)
    %--interpolation--%
    handles.nx=handles.ndata+(handles.ndata-1)*3;               % is this just an approximation for distance?
    handles.xi=handles.xa0(1):(handles.xa0(handles.ndata)-handles.xa0(1))/(handles.nx-1):handles.xa0(handles.ndata);
    bxi=interp1(handles.xa0,handles.bxs./handles.b0,handles.xi,'spline');
    byi=interp1(handles.xa0,handles.bys./handles.b0,handles.xi,'spline');
    ht=0;
    py=0.1/1;
    handles.mid=round(handles.ny/2)+ht;
    handles.x=handles.xi./handles.L0;
    guidata(hObject,handles);
    hx=handles.x(2)-handles.x(1);%uniform grids
    hy=py*hx;
    handles.y = zeros(1,handles.ny);
    for j=1:handles.ny
      handles.y(j)=(j-handles.mid)*hy;
    end
    %---------------------------%
    clear('ndA');
    ndA(1)=0;
    for i=2:handles.nx
      ndA(i)=-(byi(i)+byi(i-1))*(handles.x(i)-handles.x(i-1))*0.5;
    end
    A2=cumsum(ndA);
    handles.u=zeros(handles.ny,handles.nx);
    handles.udy=zeros(handles.ny,handles.nx);
    handles.udx=zeros(handles.ny,handles.nx);
    handles.u(handles.mid,:)=A2;
    handles.udy(handles.mid,:)=bxi;
    handles.udx(handles.mid,:)=byi;
    handles.c1=[handles.nx handles.ny handles.mid hx hy handles.amax1 handles.amin1];
    %--plot limits--
    handles.ymin = min(handles.y*handles.L0);
    handles.ymax = max(handles.y*handles.L0);
    handles.xmin = min(handles.x*handles.L0);
    handles.xmax = max(handles.x*handles.L0);
    handles.hafx = handles.xmax*0.5;
    handles.hafy = handles.ymax*0.5;
    guidata(hObject, handles);

    %-- call plot function
    plotstuff(hObject,eventdata,handles);
    disp('')


function btn_exit_Callback(hObject, eventdata, handles)
gca;
clear all;
close all;
clc;

function pm_doy_Callback(hObject, eventdata, handles)
contents = cellstr(get(hObject,'String'));
handles.doy = contents{get(hObject,'Value')};
disp(['handles.doy from callbackFcn= ', handles.doy])
handles.yr = sscanf(handles.doy,'%4c%*6c',2);
handles.month = sscanf(handles.doy, '%*5c%2c%*3c',2);
handles.day = sscanf(handles.doy, '%*8c%2c',2);
guidata(hObject, handles);

function pm_doy_CreateFcn(hObject, eventdata, handles)

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
contents = cellstr(get(hObject,'String'));
handles.doy = contents{get(hObject,'Value')};
disp(['handles.doy from createFcn= ', handles.doy])
handles.yr = sscanf(handles.doy,'%4c%*6c',2);
handles.month = sscanf(handles.doy, '%*5c%2c%*3c',2);
handles.day = sscanf(handles.doy, '%*8c%2c',2);
guidata(hObject, handles);

function etxt_ti_Callback(hObject, eventdata, handles)
handles.ti=get(hObject,'String');
disp(['handles.ti from callbackFcn= ',handles.ti])
guidata(hObject, handles);

function etxt_ti_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.ti=get(hObject,'String');
disp(['handles.ti from createFcn= ',handles.ti])
guidata(hObject, handles);

function etxt_tf_Callback(hObject, eventdata, handles)
handles.tf=get(hObject,'String');
disp(['handles.tf from callbackFcn= ',handles.tf])
guidata(hObject, handles);

function etxt_tf_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.tf=get(hObject,'String');
disp(['handles.tf from createFcn= ',handles.tf])
guidata(hObject, handles);

function pm_sc_Callback(hObject, eventdata, handles)
contents = cellstr(get(hObject,'String'));
handles.sc = contents{get(hObject,'Value')};
guidata(hObject, handles);
disp(['handles.sc from callbackFcn= ',handles.sc])

function pm_sc_CreateFcn(hObject, eventdata, handles)

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
contents = cellstr(get(hObject,'String'));
handles.sc = contents{get(hObject,'Value')};
guidata(hObject, handles);
disp(['handles.sc from createFcn= ',handles.sc])

function pm_src_Callback(hObject, eventdata, handles)
contents = cellstr(get(hObject,'String'));
handles.src = contents{get(hObject,'Value')};
guidata(hObject, handles);
disp(['handles.src from callbackFcn= ',handles.src])

function pm_src_CreateFcn(hObject, eventdata, handles)

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
contents = cellstr(get(hObject,'String'));
handles.src = contents{get(hObject,'Value')};
guidata(hObject, handles);
disp(['handles.src from createFcn= ',handles.src])

function etxt_w_Callback(hObject, eventdata, handles)
handles.w=str2double(get(hObject,'String'));
disp(['handles.w from callbackFcn= ',num2str(handles.w)])
guidata(hObject, handles);

function etxt_w_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.w=str2double(get(hObject,'String'));
disp(['handles.w from CreateFcn= ',num2str(handles.w)])
guidata(hObject, handles);

function etxt_nev_Callback(hObject, eventdata, handles)
handles.nev=str2double(get(hObject,'String'));
disp(['handles.nev from callbackFcn= ',num2str(handles.nev)])
guidata(hObject, handles);

function etxt_nev_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.nev=str2double(get(hObject,'String'));
disp(['handles.nev from CreateFcn= ',num2str(handles.nev)])
guidata(hObject, handles);

function etxt_dphi_Callback(hObject, eventdata, handles)
handles.dphi=str2double(get(hObject,'String'));
disp(['phi from CallbackFcn= ', num2str(handles.dphi)])
guidata(hObject, handles);
set(uicontrol(handles.txt_dphi),'String',num2str(handles.dphi));
uicontrol(handles.etxt_dtheta);      %set focus to the next field.
guidata(hObject, handles);          %update again

function etxt_dphi_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.dphi=get(hObject,'String');
disp(['handles.dphi from CreateFcn= ', num2str(handles.dphi)])

function etxt_dtheta_Callback(hObject, eventdata, handles)
handles.dtheta=str2double(get(hObject,'String'));
disp(['dtheta from CallbackFcn= ', num2str(handles.dtheta)])
guidata(hObject, handles);          %update handles.
set(uicontrol(handles.txt_dtheta),'String',num2str(handles.dtheta));
uicontrol(handles.etxt_azi);
guidata(hObject, handles);          %update again

function etxt_dtheta_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.dtheta=str2double(get(hObject,'String'));
disp(['handles.dtheta from CreateFcn= ', num2str(handles.dtheta)])
guidata(hObject, handles);

function etxt_azi_Callback(hObject, eventdata, handles)
handles.azi=str2double(get(hObject,'String'));
disp(['handles.azi from CallbackFcn= ', num2str(handles.azi)])
guidata(hObject, handles);
set(uicontrol(handles.txt_dphi),'String',num2str(handles.dphi));
uicontrol(handles.etxt_pol);
guidata(hObject, handles); 

function etxt_azi_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.azi=str2double(get(hObject,'String'));
disp(['handles.azi from CreateFcn= ', num2str(handles.azi)])
guidata(hObject, handles);

function etxt_pol_Callback(hObject, eventdata, handles)
handles.pol=str2double(get(hObject,'String'));
disp(['handles.pol from CallbackFcn= ', num2str(handles.pol)])
guidata(hObject, handles);
set(uicontrol(handles.txt_dtheta),'String',num2str(handles.dtheta));
uicontrol(handles.btn_display);
guidata(hObject, handles);          %update again

function etxt_pol_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.pol=str2double(get(hObject,'String'));
disp(['handles.pol from CreateFcn= ', num2str(handles.pol)])
guidata(hObject, handles);

function etxt_num_Callback(hObject, eventdata, handles)
handles.num=str2double(get(hObject,'String'));
disp(['handles.num from CallbackFcn= ',handles.num])
guidata(hObject, handles);


function etxt_num_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.num=str2double(get(hObject,'String'));
disp(['handles.num from createFcn= ',handles.num])
guidata(hObject, handles);


function txt_dtheta_CreateFcn(thetaObject, eventdata, handles)
handles.txt_dtheta=str2double(get(thetaObject,'String'));
disp(['handles.txt_dtheta from CreateFcn= ',num2str(handles.txt_dtheta)]);
guidata(thetaObject, handles);


function txt_dphi_CreateFcn(phiObject, eventdata, handles)
handles.txt_dphi=str2double(get(phiObject,'String'));
handles.txt_dphi=str2double(get(phiObject,'String'));
disp(['handles.txt_dphi from CreateFcn= ',num2str(handles.txt_dphi)]);
guidata(phiObject, handles);

function plotstuff(hObject, eventdata,handles)
    %----------------------------------------------------------------------------%
    %=============================== SubBlock 1 =================================%
    %----------------------------------------------------------------------------%
    [Aup,Aupdy,Aupdx]=gsup(handles.c1,handles.x,handles.y,handles.u,handles.udy,handles.udx,handles.fS1);
    [Adn,Adndy,Adndx]=gsdn(handles.c1,handles.x,handles.y,handles.u,handles.udy,handles.udx,handles.fS1);
    Aup=Aup+Adn;
    Aup(handles.mid,:)=Aup(handles.mid,:)/2;
    Aupdy=Aupdy+Adndy;
    Aupdy(handles.mid,:)=Aupdy(handles.mid,:)/2;
    Aupdx=Aupdx+Adndx;
    Aupdx(handles.mid,:)=Aupdx(handles.mid,:)/2;
    gg=1:handles.ny;
    Bzup=zeros(handles.ny,handles.nx);
    for j=1:handles.ny
      for i=1:handles.nx
        Bzup(j,i)=polyval(handles.fZ1,Aup(j,i));
        if Aup(j,i)>handles.amax1
          Bzup(j,i)=polyval(handles.fZ1,handles.amax1);
        elseif Aup(j,i)<handles.amin1
          Bzup(j,i)=polyval(handles.fZ1,handles.amin1);
        end
      end
    end
    B3 = Bzup(gg,:)*handles.b0*1e9;              % defines 3rd axis
    pcolor(handles.x*handles.L0,handles.y(gg)*handles.L0,B3);            % displays 3rd axis (bz) in faceted shading
    shading interp                       % changes shading to interpolated
    minb3=min(min(B3));
    maxb3=max(max(B3));
    caxis([minb3 maxb3]);
    handles.zbar=colorbar('vertical');
    set(handles.zbar,'Fontsize',8);
    set(get(handles.zbar,'XLabel'),'String','Bz [nT]','Rotation',0,'HorizontalAlignment','left','Fontsize',10);
    hold on;
    [cc,hh]=contour(handles.x*handles.L0,handles.y(gg)*handles.L0,Aup(gg,:),[-4:0.11:4],'k');
    set(hh,'linewidth',1.0);
    quiv1=quiver(handles.xa0,zeros(1,handles.ndata),handles.bxs',handles.bys',0.3,'w');  % plots white arrows accross middle.
    set(quiv1,'linewidth',2.0);                          % sets linewidth for quiver arrows
    set(handles.axes1,'fontsize',10,'TickDir','out','linewidth',1.0);
    axis equal
    handles.xdist = handles.x*handles.L0;
    % fudge factor for x range.
    if handles.xdist <= 0
      axis([min(handles.x*handles.L0), 0, min(handles.y*handles.L0), max(handles.y*handles.L0)])
    else
      axis([0, max(handles.x*handles.L0), min(handles.y*handles.L0), max(handles.y*handles.L0)])
    end
    xlabel('x [km]','fontsize',12)
    ylabel('y [km]','fontsize',12)
    guidata(hObject, handles);

function etxt_ny_Callback(hObject, eventdata, handles)
handles.ny=str2double(get(hObject,'String'));
disp(['handles.ny from CallbackFcn= ', num2str(handles.ny)])
guidata(hObject, handles);


function etxt_ny_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.ny=str2double(get(hObject,'String'));
disp(['handles.ny from CreateFcn= ', num2str(handles.ny)])
guidata(hObject, handles);


function txt_headera_CreateFcn(hObject, eventdata, handles)
handles.header = str2double(get(hObject,'String'));
guidata(hObject,handles);
