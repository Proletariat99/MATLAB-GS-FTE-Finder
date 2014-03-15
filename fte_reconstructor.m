function varargout = dve_rectangleFTEsearch_V9_2(varargin)
% DVE_RECTANGLEFTESEARCH_V9_2 MATLAB code for dve_rectangleFTEsearch_V9_2.fig
%      DVE_RECTANGLEFTESEARCH_V9_2, by itself, creates a new DVE_RECTANGLEFTESEARCH_V9_2 or raises the existing
%      singleton*.
%
%      H = DVE_RECTANGLEFTESEARCH_V9_2 returns the handle to a new DVE_RECTANGLEFTESEARCH_V9_2 or the handle to
%      the existing singleton*.
%
%      DVE_RECTANGLEFTESEARCH_V9_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DVE_RECTANGLEFTESEARCH_V9_2.M with the given input arguments.
%
%      DVE_RECTANGLEFTESEARCH_V9_2('Property','Value',...) creates a new DVE_RECTANGLEFTESEARCH_V9_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dve_rectangleFTEsearch_V9_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dve_rectangleFTEsearch_V9_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dve_rectangleFTEsearch_V9_2

% Last Modified by GUIDE v2.5 21-May-2012 16:01:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dve_rectangleFTEsearch_V9_2_OpeningFcn, ...
                   'gui_OutputFcn',  @dve_rectangleFTEsearch_V9_2_OutputFcn, ...
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


% --- Executes just before dve_rectangleFTEsearch_V9_2 is made visible.
function dve_rectangleFTEsearch_V9_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dve_rectangleFTEsearch_V9_2 (see VARARGIN)

% Choose default command line output for dve_rectangleFTEsearch_V9_2
handles.output = hObject;

handles.nden=1e6;         %factor for density
handles.nt  =1e6;         %factor for temperature
handles.nv  =1e3;         %factor for velocity
handles.nb  =1e-9;        %factor for magnetic field (nT to T)
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

% UIWAIT makes dve_rectangleFTEsearch_V9_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = dve_rectangleFTEsearch_V9_2_OutputFcn(hObject, eventdata, handles) 
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

function btn_svpoly_Callback(hObject, eventdata, handles);


% ############# Version 7 Workaround Below ################
%=============================== Save Button ========================================
% function btn_save_Callback(hObject, eventdata, handles)
% figpos = [1, 1, 800,600];
% fig2=figure('Name', 'fig2','Position',figpos,'NumberTitle','off', 'Renderer', 'Zbuffer','RendererMode','manual');
% dnm = num2str([handles.yr,handles.month,handles.day]);
% thnm = num2str(round(handles.theta));
% phnm = num2str(round(handles.phi));
% tmnm1 = datestr(handles.ta);
% tmnm2 = datestr(handles.tb);
% handles.heada = ['TH',upper(handles.sc),': ',handles.doy,': ',tmnm1(12:20),' to ', tmnm2(12:20)];
% handles.headb = strcat('Theta = ', num2str(handles.theta, '%3.2f'),', Phi = ', num2str(handles.phi, '%3.2f'));
% 
% plotstuff(hObject,eventdata,handles);
% 
% handles.axesSave1=gca;
% set(handles.axesSave1,'Units','pixels');
% axpos=[80,220,400,200];
% set(handles.axesSave1,'Position',axpos);
% disp(['axpos=',num2str(axpos)])
% top = max(handles.y*handles.L0);
% bot = min(handles.y*handles.L0);
% lef = min(handles.x*handles.L0);
% rit = max(handles.x*handles.L0);
% up = 100;
% down = 100;
% left = -650;
% hspace = 450;
% vspace = 200;
% r1 = 2*vspace+down;
% r2 = 3*vspace+down;
% r3 = 4*vspace+down;
% r4 = 5*vspace+down;
% c1 = 1*hspace+left;
% c2 = 2*hspace+left;
% c3 = 3*hspace+left;
% c4 = 4*hspace+left;
% c5 = 5*hspace+left;
% 
% % ================ VECTOR INFO BELOW (COMMENT OUT FOR PAPER) ============
% % text(lef+c1,bot-r2,'x:', 'Fontsize', 12, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
% % text(lef+c1,bot-r3,'y:', 'Fontsize', 12, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
% % text(lef+c1,bot-r4,'z:', 'Fontsize', 12, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
% % text(lef+c2,bot-r1,'xs', 'Fontsize', 12, 'BackgroundColor','w', 'HorizontalAlignment', 'right', 'FontWeight', 'Bold', 'Fontangle', 'italic');
% % text(lef+c3,bot-r1,'ys', 'Fontsize', 12, 'BackgroundColor','w', 'HorizontalAlignment', 'right', 'FontWeight', 'Bold', 'Fontangle', 'italic');
% % text(lef+c4,bot-r1,'zs', 'Fontsize', 12, 'BackgroundColor','w', 'HorizontalAlignment', 'right', 'FontWeight', 'Bold', 'Fontangle', 'italic');
% % text(lef+c5,bot-r1,'V0', 'Fontsize', 12, 'BackgroundColor','w', 'HorizontalAlignment', 'right', 'FontWeight', 'Bold', 'Fontangle', 'italic');
% % text(lef+c2,bot-r2,num2str(handles.xs(1),'%1.3f'), 'Fontsize', 10, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
% % text(lef+c2,bot-r3,num2str(handles.xs(2),'%1.3f'), 'Fontsize', 10, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
% % text(lef+c2,bot-r4,num2str(handles.xs(3),'%1.3f'), 'Fontsize', 10, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
% % text(lef+c3,bot-r2,num2str(handles.ys(1),'%1.3f'), 'Fontsize', 10, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
% % text(lef+c3,bot-r3,num2str(handles.ys(2),'%1.3f'), 'Fontsize', 10, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
% % text(lef+c3,bot-r4,num2str(handles.ys(3),'%1.3f'), 'Fontsize', 10, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
% % text(lef+c4,bot-r2,num2str(handles.zs(1),'%1.3f'), 'Fontsize', 10, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
% % text(lef+c4,bot-r3,num2str(handles.zs(2),'%1.3f'), 'Fontsize', 10, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
% % text(lef+c4,bot-r4,num2str(handles.zs(3),'%1.3f'), 'Fontsize', 10, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
% % text(lef+c5,bot-r2,num2str(handles.V0(1),'%3.1f'), 'Fontsize', 10, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
% % text(lef+c5,bot-r3,num2str(handles.V0(2),'%3.1f'), 'Fontsize', 10, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
% % text(lef+c5,bot-r4,num2str(handles.V0(3),'%3.1f'), 'Fontsize', 10, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
% % ================ VECTOR INFO ABOVE (COMMENT OUT FOR PAPER) ============
% 
% 
% text(lef+c2,top+up,[handles.heada,' / ',handles.headb],'Fontname','arial','Fontsize',10,'BackgroundColor','w','HorizontalAlignment','left');
%     minb3=min(min(handles.B3));
%     maxb3=max(max(handles.B3));
%     caxis([minb3 maxb3]);
%     handles.zbar=colorbar('vertical');
%     set(handles.zbar,'Fontsize',8);
%     set(get(handles.zbar,'XLabel'),'String','Bz [nT]','Rotation',0,'HorizontalAlignment','left','Fontsize',10);
% filename = [handles.dir,'gsmap_','th',handles.sc,'_',dnm,'_',tmnm1(13:14),tmnm1(16:17),tmnm1(19:20),'_',tmnm2(13:14),tmnm2(16:17),tmnm2(19:20),'_theta',thnm,'_phi',phnm,'.png'];
% 
% 
% print(fig2,'-dpng',filename,'-r600');
% % cla;
% % saveas(fig2,filename,'png');
% disp(['File saved as ', filename])
% close(figure(fig2));
% ############# Version 7 Workaround Above ################


% ############### Version 9 Save Below ###################
% ===============For some reason, the following code broke in v9.
% I replaced with a copy/paste from v7.

function btn_save_Callback(hObject, eventdata, handles)
figpos = [1, 1, 800,600];
fig2=figure('Name', 'fig2','Position',figpos,'NumberTitle','off', 'Renderer', 'Zbuffer','RendererMode','manual');
dnm = num2str([handles.yr,handles.month,handles.day]);
thnm = num2str(round(handles.theta));
phnm = num2str(round(handles.phi));
tmnm1 = datestr(handles.ta);
tmnm2 = datestr(handles.tb);
handles.heada = ['TH',upper(handles.sc),': ',handles.doy,': ',tmnm1(12:20),' to ', tmnm2(12:20)];
handles.headb = strcat('Theta = ', num2str(handles.theta, '%3.2f'),', Phi = ', num2str(handles.phi, '%3.2f'));

plotstuff(hObject,eventdata,handles);
handles.axesSave1=gca;
set(handles.axesSave1,'Units','pixels')
xlabel(handles.axesSave1,'x[km]');
ylabel(handles.axesSave1,'y[km]');

axpos=[80,220,400,200];
set(handles.axesSave1,'Position',axpos);
disp(['axpos=',num2str(axpos)])
top = max(handles.y*handles.L0);
bot = min(handles.y*handles.L0);
lef = min(handles.x*handles.L0);
rit = max(handles.x*handles.L0);
up = 100;
down = 100;
left = -650;
hspace = 450;
vspace = 200;
r1 = 2*vspace+down;
r2 = 3*vspace+down;
r3 = 4*vspace+down;
r4 = 5*vspace+down;
c1 = 1*hspace+left;
c2 = 2*hspace+left;
c3 = 3*hspace+left;
c4 = 4*hspace+left;
c5 = 5*hspace+left;
text(lef+c1,bot-r2,'x:', 'Fontsize', 12, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
text(lef+c1,bot-r3,'y:', 'Fontsize', 12, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
text(lef+c1,bot-r4,'z:', 'Fontsize', 12, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
text(lef+c2,bot-r1,'xs', 'Fontsize', 12, 'BackgroundColor','w', 'HorizontalAlignment', 'right', 'FontWeight', 'Bold', 'Fontangle', 'italic');
text(lef+c3,bot-r1,'ys', 'Fontsize', 12, 'BackgroundColor','w', 'HorizontalAlignment', 'right', 'FontWeight', 'Bold', 'Fontangle', 'italic');
text(lef+c4,bot-r1,'zs', 'Fontsize', 12, 'BackgroundColor','w', 'HorizontalAlignment', 'right', 'FontWeight', 'Bold', 'Fontangle', 'italic');
text(lef+c5,bot-r1,'V0', 'Fontsize', 12, 'BackgroundColor','w', 'HorizontalAlignment', 'right', 'FontWeight', 'Bold', 'Fontangle', 'italic');
text(lef+c2,bot-r2,num2str(handles.xs(1),'%1.3f'), 'Fontsize', 10, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
text(lef+c2,bot-r3,num2str(handles.xs(2),'%1.3f'), 'Fontsize', 10, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
text(lef+c2,bot-r4,num2str(handles.xs(3),'%1.3f'), 'Fontsize', 10, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
text(lef+c3,bot-r2,num2str(handles.ys(1),'%1.3f'), 'Fontsize', 10, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
text(lef+c3,bot-r3,num2str(handles.ys(2),'%1.3f'), 'Fontsize', 10, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
text(lef+c3,bot-r4,num2str(handles.ys(3),'%1.3f'), 'Fontsize', 10, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
text(lef+c4,bot-r2,num2str(handles.zs(1),'%1.3f'), 'Fontsize', 10, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
text(lef+c4,bot-r3,num2str(handles.zs(2),'%1.3f'), 'Fontsize', 10, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
text(lef+c4,bot-r4,num2str(handles.zs(3),'%1.3f'), 'Fontsize', 10, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
text(lef+c5,bot-r2,num2str(handles.V0(1),'%3.1f'), 'Fontsize', 10, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
text(lef+c5,bot-r3,num2str(handles.V0(2),'%3.1f'), 'Fontsize', 10, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
text(lef+c5,bot-r4,num2str(handles.V0(3),'%3.1f'), 'Fontsize', 10, 'BackgroundColor','w', 'HorizontalAlignment', 'right');
text(lef+c2,top+up,[handles.heada,' / ',handles.headb],'Fontname','arial','Fontsize',10,'BackgroundColor','w','HorizontalAlignment','left');
    minb3=min(min(handles.B3));
    maxb3=max(max(handles.B3));
    caxis([minb3 maxb3]);
    handles.zbar=colorbar('vertical');
    set(handles.zbar,'Fontsize',8);
    set(get(handles.zbar,'XLabel'),'String','Bz [nT]','Rotation',0,'HorizontalAlignment','left','Fontsize',10);
filename = [handles.dir,'gsmap_','th',handles.sc,'_',dnm,'_',tmnm1(13:14),tmnm1(16:17),tmnm1(19:20),'_',tmnm2(13:14),tmnm2(16:17),tmnm2(19:20),'_theta',thnm,'_phi',phnm,'.png'];
print(fig2,'-dpng',filename,'-r600');

% saveas(fig2,filename,'png');
disp(['File saved as ', filename])
close(figure(fig2));
% ############### Version 9 Save Above ###################


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
    
    ostest = ismac
    if ostest == 1
      handles.dir = '/MATLAB/';
    else
      handles.dir = 'C:\Users\eriksson\My Documents\MATLAB\';
    end
    
    HHi = sscanf(handles.ti,'%2c%0.2*4c');
    MMi = sscanf(handles.ti, '%*3c%2c0%*2c', 2);
    SSi = sscanf(handles.ti, '%*6c%2c0', 2);
    HHf = sscanf(handles.tf,'%2c%0.2*4c');
    MMf = sscanf(handles.tf, '%*3c%2c0%*2c', 2);
    SSf = sscanf(handles.tf, '%*6c%2c0', 2);
    % File 1 data file itself %
    fn = strcat(handles.dir,'th',handles.sc,'_',num2str(strcat(handles.yr,handles.month,handles.day)),'_',num2str(strcat(HHi,MMi)),'_',num2str(strcat(HHf,MMf)),'_GSM_v4_',handles.src,'.dat');
    disp(['fn is', fn])
    handles.a = importdata(fn,' ',handles.dhead);
    disp(['handles.a is loaded.  Class(handles.a.data)  = ',class(handles.a.data)])
    disp(['                      Size(handles.a.data)  = ', num2str(size(handles.a.data))])
    % File 2 msheath data file%
    handles.n=113;
    fnsh=strcat(handles.dir,'themis_fte_iaga_2011_msheath.txt')
    %     fnsh=['/FTE/2011/findings/themis_fte_iaga_2011_msheath.txt'];
    mshfid = fopen(fnsh);
    handles.msh = textscan(mshfid, '%s %s %s %s %f %s %s %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f', handles.n);
    fclose(mshfid);
    disp(['handles.msh is loaded.  Class(handles.msh.data)  = ',class(handles.msh)])
    disp(['                      Size(handles.msh.data)  = ', num2str(size(handles.msh))])
    % File 3 Event File (nev)%
    ff = strcat(handles.dir,'themis_fte_iaga_2011_clean_final_timeorder_recons.txt');
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
%     axes(handles.axes1);
%     cla(handles.axes1);
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
    handles.fS1=polyfit(handles.An,handles.pbz,4);          %Pt(A)   4th deg poly fit
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
    %  disp('B Vector Magnitudes are', num2str(sqrt(handles.bc(:,1).^2+handles.bc(:,2).^2)))
    %-- call plot function
    plotstuff(hObject,eventdata,handles);
    polyplot(hObject,eventdata,handles);
    disp('')
    disp(strcat(handles.doy,'; nev=',num2str(handles.nev),'; ny=',num2str(handles.ny),'; w=', num2str(handles.w),'; dtheta=',num2str(handles.dtheta),'; dphi=',num2str(handles.dphi)))

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

%========================== Plot Stuff ===============================
function plotstuff(hObject, eventdata,handles)
    %----------------------------------------------------------------------------%
    %=============================== SubBlock 1 =================================%
    %----------------------------------------------------------------------------%
    cla(handles.axes1,'reset')
    set(gcf,'CurrentAxes',handles.axes1); 
    xlabel(handles.axes1,'x [km]','fontsize',12);
    ylabel(handles.axes1,'y [km]','fontsize',12);
    [Aup,Aupdy,Aupdx]=gsup(handles.c1,handles.x,handles.y,handles.u,handles.udy,handles.udx,handles.fS1);
    [Adn,Adndy,Adndx]=gsdn(handles.c1,handles.x,handles.y,handles.u,handles.udy,handles.udx,handles.fS1);
    Aup=Aup+Adn;
    Aup(handles.mid,:)=Aup(handles.mid,:)/2;
    Aupdy=Aupdy+Adndy;
    Aupdy(handles.mid,:)=Aupdy(handles.mid,:)/2;
    Aupdx=Aupdx+Adndx;
    Aupdx(handles.mid,:)=Aupdx(handles.mid,:)/2;
    handles.gg=1:handles.ny;
    handles.Bzup=zeros(handles.ny,handles.nx);
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
    handles.B3 = Bzup(handles.gg,:)*handles.b0*1e9;              % defines 3rd axis
    % ################### Begin Big Plot to handles.axes1 on handles.figure1 ####################
    % SET CURRENT AXES HERE (AXES 1)
    disp(get(gca,'Tag'));
    pcolor(handles.x*handles.L0,handles.y(handles.gg)*handles.L0,handles.B3);            % displays 3rd axis (bz) in faceted shading
    shading interp                       % changes shading to interpolated
    minb3=min(min(handles.B3));
    maxb3=max(max(handles.B3));
    caxis([minb3 maxb3]);
    handles.zbar=colorbar('vertical');
    set(handles.zbar,'Fontsize',8);
    set(get(handles.zbar,'XLabel'),'String','Bz [nT]','Rotation',0,'HorizontalAlignment','left','Fontsize',10);
    hold on;
    [cc,hh]=contour(handles.x*handles.L0,handles.y(handles.gg)*handles.L0,Aup(handles.gg,:),[-4:0.11:4],'k');
    set(hh,'linewidth',1.0);
    %----------------quiver----------------
    u = handles.xa0;
    v = zeros(1,handles.ndata);
    x = handles.bxs';
    y = handles.bys';
    scale = 0.3;
    color = 'w';
    quiv1=quiver(u,v,x,y,scale,color);  % plots white arrows accross middle.
    set(quiv1,'linewidth',1.5);                          % sets linewidth for quiver arrows
    set(handles.axes1,'fontsize',10,'TickDir','out','linewidth',1.0);
    axis equal
    handles.xdist = handles.x*handles.L0;
    % fudge factor for x range.
    if handles.xdist <= 0
      axis([min(handles.x*handles.L0), 0, min(handles.y*handles.L0), max(handles.y*handles.L0)])
    else
      axis([0, max(handles.x*handles.L0), min(handles.y*handles.L0), max(handles.y*handles.L0)])
    end

    % ################### End Big Plot to handles.axes1 on handles.figure1 ####################
    

    %------------------plot norm vector on handles.axes1--------    
%     handles.xplotmax = max(get(handles.axes1,'Xlim'));
%     handles.xplotmin = min(get(handles.axes1,'Xlim'));
%     handles.yplotmax = max(get(handles.axes1,'Ylim'));
%     handles.yplotmin = min(get(handles.axes1,'Ylim'));
%     handles.xnt=handles.bxs/handles.nb;
%     handles.ynt=handles.bys/handles.nb;
%     handles.NormVecMagNT=sqrt(handles.xnt'.^2+handles.ynt'.^2);
%     handles.maxnorm = max(handles.NormVecMagNT);
%     handles.minnorm = min(handles.NormVecMagNT);
%     handles.xLocNorm = handles.xplotmin+(0.1*handles.xplotmax);
%     handles.yLocNorm = handles.yplotmin+(0.3*handles.yplotmax);
%     handles.countings = length(handles.NormVecMagNT)
%     handles.y000 = zeros(handles.countings,1);
    %     maxtexts=strcat(num2str(maxnormz*TN,'%3.1f'),' nT');
%     nu = handles.xLocNorm;
%     nv = handles.yLocNorm;
%     nx = handles.maxnorm;
%     ny = 0;
%     scale = 0.3;
%     color = 'w';
%     handles.nquiv=quiver(nu, nv, nx,ny,scale,color, 'linewidth', 1.0);
%     handles.nquiv=quiver(nu, nv, nx,ny, scale,color);
%     set(handles.nquiv, 'linewidth', 1.0)
    
%     handles.nquiv=quiver(handles.axes1, handles.xLocNorm, handles.yLocNorm,...
%         handles.maxnorm, 0,'w','linewidth',2.0);
    % set(handles.figure1,'CurrentAxes',handles.axes1);
    % position annotation on axes1 instead of figure1
    % annotation('textbox', 'string', 'ANNOTATION!' , 'FontSize', 24, 'Color', 'red')
    %-----------------end plot norm vector on handles.axes1 (big window)-----
    guidata(hObject, handles);
    %    text(handles.axes1,'position',[vecy+50,vecx,0],'string','TEXTZ0R');
    %    text(handles.axes1,'position',[vecy+50,vecx],'String',strcat(num2str(maxnormz*TN,'%3.1f'),' nT'),'color','w','fontsize',10.0,'FontWeight','bold');
    %    set(handles.axes1, 'NextPlot', 'add')
    %    text(handles.axes1, (vecy+50),vecx,'String',strcat(num2str(maxnormz*TN,'%3.1f'),' nT'),'color','w','fontsize',10.0,'FontWeight','bold');



%======================= End Plot Stuff ===============================

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


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: place code in OpeningFcn to populate axes2


function btn_testcase_Callback(hObject, eventdata, handles)
% % --- Executes on button press in btn_testcase ---
% % The purpose of the TESTCASE button is to plot the original data from
% % Bdata.dat and Pdata.dat to make sure that it matches the original plots 
% % from the paper.  It does not yet work, but we should do it to make sure 
% % Wai-Leong's concerns are mitigated.
% % hObject    handle to btn_testcase (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% % Moving backwards from plot, we need these from Bdata and Pdata: 
% %xa0, 
% %ndata, 
% % bxs', 
% % bys', 
% % x, 
% % L0, 
% % y,
% % gg, 
% % minb3, 
% % maxb3, 
% % nx, 
% % ny, 
% % mid, 
% % FS1, 
% % udx, 
% % udy, 
% % x, 
% % y, 
% % c1, 
% % u 
% 
% 
% nden=1e6;         %factor for density
% nt  =1e6;         %factor for temperature
% nv  =1e3;	  %factor for velocity
% nb  =1e-9;        %factor for magnetic field
% kb  =1.38*1e-23;  %Boltzmann's constant
% miu =4.0*pi*1e-7; %permeability
% mp  =1.67*1e-27;  %proton mass
% % ostest = ismac;
% %     if ostest == 1
% %       dir = '/MATLAB/';
% %     else
% %       dir = 'C:\Users\eriksson\My Documents\MATLAB\';
% %     end
% str1=strcat(handles.dir, 'Bdata.dat');
% fid1=fopen(str1,'rt');
% fgets(fid1);
% Data1=fscanf(fid1,'%f %f%f%f',[4,inf]);
% fclose(fid1);
% Data1=Data1';
% secb=Data1(:,1); %sec
% BX=Data1(:,2); BY=Data1(:,3); BZ=Data1(:,4); %nT(GSE)
% clear('Data1');
% 
% %Plasma Data Input
% str1=strcat(handles.dir,'Pdata.dat');
% fid1=fopen(str1,'rt');
% fgets(fid1);
% Data1=fscanf(fid1,'%f %f%f%f %f %f',[6,inf]);
% fclose(fid1);
% Data1=Data1';
% secp=Data1(:,1); %sec
% VX=Data1(:,2); VY=Data1(:,3); VZ=Data1(:,4); %km/s(GSE)
% Nx=Data1(:,5); %/cc
% Tx=Data1(:,6); %MK
% clear('Data1');
% idata=1:length(BX);
% %Data Plot
% subplot(3,1,1)
% plot(idata,BX,'k',idata,BY,'b',idata,BZ,'r','linewidth',1.0);
% subplot(3,1,2)
% plot(idata,VX,'k',idata,VY,'b',idata,VZ,'r','linewidth',1.0);
% subplot(3,1,3)
% plot(idata,Nx,'k',idata,Tx,'r','linewidth',1.0);
% %HT and MVAB analysis
% i1=1;
% i2=27;
% bc=[BX(i1:i2) BY(i1:i2) BZ(i1:i2)];
% vp=[VX(i1:i2) VY(i1:i2) VZ(i1:i2)];
% Nc=Nx(i1:i2);
% [EHT,EC,HTR,HTslope,vht]=HTcoef(bc,vp,length(bc(:,1)));
% disp(['VHT= ',num2str(vht,'%2.1f  ')]);
% disp(['[cc_HT,slope]=',num2str([HTR HTslope],'%2.2f ')]);
% disp(' ');
% clear('bc','vp','Nc');
% bc=[BX(i1:i2) BY(i1:i2) BZ(i1:i2)];
% [Kbmax,Kbint,Kbmin,qmva,d1,d2,d3]=MVAB(bc,length(bc(:,1)));
% Kbint=-Kbint;
% disp(['d=',num2str([d1 d2 d3]/d3,'%2.1f  ')]);
% disp(['L= ',num2str(Kbmax,'%2.3f  ')]);
% disp(['M= ',num2str(Kbint,'%2.3f  ')]);
% disp(['N= ',num2str(Kbmin,'%2.3f  ')]);
% disp(' ');
% %------------------------------------
% clear('bc');
% i1=1;
% i2=30;
% iix=i1:i2;
% ndata=length(iix);
% %Initial Data for Reconstruction
% bc=[BX(iix) BY(iix) BZ(iix)];
% vp=[VX(iix) VY(iix) VZ(iix)];
% 
% dzn=Nx(iix);
% Tp =Tx(iix);
% 
% opm=1; %gate for reconstruction
% 
% 
% phi=0.0*pi/180;
% CM=[1 0 0; 0 cos(phi) -sin(phi) ; 0 sin(phi) cos(phi)];
% XZ=[Kbmax;Kbint;Kbmin];
% XZ=CM*XZ;
% 
% theta=40.0*pi/180;
% CM=[cos(theta) -sin(theta) 0 ; sin(theta) cos(theta) 0 ; 0 0 1];
% XZ=[XZ(1,:); XZ(2,:) ; XZ(3,:)];
% XZ=CM*XZ;
% 
% zs=XZ(2,:) %invariant axis
% V0=vht %reference frame velocity
% 
% vza=V0*zs'
% vzav=vza*zs
% vhtsv=V0-vzav
% vhts=sqrt(vhtsv*vhtsv');
% vhtsn=vhtsv./vhts;
% 
% xs=-vhtsn;
% ys=cross(zs,xs); ys=ys./norm(ys);
% 
% theta=0.0*pi/180;
% CM=[cos(theta) -sin(theta) 0 ; sin(theta) cos(theta) 0 ; 0 0 1];
% XZ=[xs;ys;zs];
% XZ=CM*XZ;
% 
% xs=XZ(1,:); xs=xs/norm(xs);
% ys=XZ(2,:); ys=ys/norm(ys);
% 
% vxs=-V0*xs';
% 
% disp(['ndata=',num2str(ndata,'%2.0f')]);
% disp(['zs =',num2str(zs,'%2.3f  ')]);
% disp(['xs =',num2str(xs,'%2.3f  ')]);
% disp(['ys =',num2str(ys,'%2.3f  ')]);
% disp(['vxs=',num2str(vxs,'%2.1f')]);
% 
% 
% bx=bc(:,1);	by=bc(:,2);	bz=bc(:,3);
% vx=vp(:,1);	vy=vp(:,2);	vz=vp(:,3);
% 
% %Project B into reconstruction coord.
% bxs=(bc.*nb)*xs';
% bys=(bc.*nb)*ys';
% bzs=(bc.*nb)*zs';
% 
% %Project V into reconstruction coord.
% for i=1:ndata
%    vxc(i)=(vp(i,:)-V0)*xs';
%    vyc(i)=(vp(i,:)-V0)*ys';
%    vzc(i)=(vp(i,:)-V0)*zs';   
% end
% 
% [cx,cy]=size(secb);
% for i=2:cx
%    dTime(1,i)=secb(1);
% end
% dTime(1,1)=0;
% dTim1=cumsum(dTime);
% 
% %Time to distance
% xa0=vxs.*dTim1;
% 
% %Calculate vector potential A along y=0
% ndA(1)=0;
% len=length(dTim1);
% for i=2:len
%    ndA(i)=-(bys(i)+bys(i-1))*(dTim1(i)-dTim1(i-1))*vxs*nv*0.5;
% end
% A1=cumsum(ndA);
% A1=A1';
% 
% bb=sqrt(bxs.^2+bys.^2+bzs.^2);
% pp=dzn.*Tp*kb*nden*nt;
% 
% bmax=max(bb);
% nmax=max(dzn)*nden;
% 
% %Normalized factors
% b0=bmax;
% p0=bmax*bmax/miu;
% n0=nmax;
% T0=p0/(kb*n0);
% v0=sqrt(b0^2/(miu*n0*mp)*1e-6);
% 
% A0=max(abs(A1));
% L0=(A0/bmax)*1e-3;
% 
% 
% pbz=pp./p0+((bzs./b0).^2)/2;
% An=A1./A0;
% 
% opn=1;
% if opn==1
%    clf;
%    vmg=sqrt((vxc./v0).^2 + (vyc./v0).^2 + (vzc./v0).^2);
%    bmg=sqrt((bxs./b0).^2 + (bys./b0).^2 + (bzs./b0).^2);
%    xm=1:ndata;
%    
%    left=0.1; bottom=0.7; width=0.35; height=0.25; dh=height+0.05; dw=width+0.08;
%    
%    %ha=axes('position',[left bottom width height]);
%    plot(xm,vxc./v0,'k-o',xm,vyc./v0,'b-o',xm,vzc./v0,'r-o','Markersize',3); grid on; 
%    ylabel('V','rotation',0);
%    %set(ha,'ylim',[-1 1],'ytick',[-1:0.25:1],'fontsize',8);
%    %--
%    %ha=axes('position',[left bottom-dh width height]);
%    plot(xm,bxs./b0,'k-o',xm,bys./b0,'b-o',xm,bzs./b0,'r-o','Markersize',3); grid on; 
%    ylabel('B','rotation',0);
%    %set(ha,'ylim',[-1 1],'ytick',[-1:0.25:1],'fontsize',8);
%    %--
%    %ha=axes('position',[left bottom-dh*2 width height]);
%    plot(An,'k-o','Markersize',3);  grid on; 
%    ylabel('A','rotation',0);
%    %set(ha,'ylim',[-1 1],'ytick',[-1:0.25:1],'fontsize',8);
%    %--
%    %Curve Fitting Processing
%    %--        
%    fS1=polyfit(An,pbz,4); %Pt(A)      
%    fZ1=polyfit(An,bzs/b0,5); %Bz(A)
%    
%    amax1=max(An); amin1=min(An);   
%        
%    ax1=amin1:0.01:amax1;
%    
%    df1=polyder(fS1); %dPt/dA   
%    yys1=polyval(fS1,ax1);
%    
%    yyz1=polyval(fZ1,ax1);
%    
%    %ha=axes('position',[left+dw bottom width height]);
%    plot(An,pbz,'ko','Markersize',5); grid on;    
%    hold on;
%    plot(ax1,yys1,'color',[0.5 0.5 0.5],'linewidth',3);    
%    %set(ha,'ylim',[min(pbz)-0.1 max(pbz)+0.1],'ytick',[0:0.1:1],'fontsize',8);
%    ylabel('p_t','rotation',0);
%    xlabel('A')
%    %--
%    %ha=axes('position',[left+dw bottom-dh width height]);
%    plot(ax1,polyval(df1,ax1),'k'); grid on;
%    ylabel('Dpbz');
%    %set(ha,'fontsize',8);
%    %--
%    %ha=axes('position',[left+dw bottom-dh*2 width height]);
%    plot(An,bzs/b0,'ko','Markersize',3); grid on; 
%    hold on;
%    plot(ax1,yyz1,'b','linewidth',3);
%    %set(ha,'ylim',[min(bzs/b0)-0.1 max(bzs/b0)+0.1],'ytick',[-1:0.25:1],'fontsize',8);
%    ylabel('Bz');
%    xlabel('A')
% end
% 
% 
% if opm==1
%    %--interpolation--%
%    nx=ndata+(ndata-1)*3;
%    xi=xa0(1):(xa0(ndata)-xa0(1))/(nx-1):xa0(ndata);
%    
%    bxi=interp1(xa0,bxs./b0,xi,'spline');
%    byi=interp1(xa0,bys./b0,xi,'spline');
%    bzi=interp1(xa0,bzs./b0,xi,'spline');
%          
%    %--------------------------%
%    ny=151;
%    %--------------------------%
%    disp(' ')
%    disp(['nx=',num2str(nx),' ','ny=',num2str(ny)]);
%    
%    ht=0;
%    py=0.1/1;
%    mid=round(ny/2)+ht;
%    
%    x=xi./L0;
%    hx=x(2)-x(1);%uniform grids
%    hy=py*hx;
%    
%    disp(['mid=',num2str(mid,'%2.0f'),' ','nYup=',num2str((ny-mid),'%2.0f')]);
%    disp(['hx =',num2str(hx,'%2.3f'),' ','hy  =',num2str(hy,'%2.3f')]);
%    
%    for j=1:ny
%       y(j)=(j-mid)*hy;
%    end
%    disp(['Ymin=',num2str(y(1)*L0,'%2.0f'),' ','Ymax=',num2str(y(ny)*L0,'%2.0f')]);
%          
%    %---------------------------%
%    clear('ndA');
%    ndA(1)=0;
%    for i=2:nx
%       ndA(i)=-(byi(i)+byi(i-1))*(x(i)-x(i-1))*0.5;
%    end
%    A2=cumsum(ndA);
%          
%    u=zeros(ny,nx);
%    udy=zeros(ny,nx);
%    udx=zeros(ny,nx);
%       
%    u(mid,:)=A2;
%    udy(mid,:)=bxi;
%    udx(mid,:)=byi;
%    
%    c1=[nx ny mid hx hy amax1 amin1];
%    
%    opn=2;      
%    if opn==2
%       
%       [Aup,Aupdy,Aupdx]=gsup(c1,x,y,u,udy,udx,fS1);
%       [Adn,Adndy,Adndx]=gsdn(c1,x,y,u,udy,udx,fS1);
%       
%       Aup=Aup+Adn;
%       Aup(mid,:)=Aup(mid,:)/2;
%       
%       Aupdy=Aupdy+Adndy;
%       Aupdy(mid,:)=Aupdy(mid,:)/2;
%       
%       Aupdx=Aupdx+Adndx;
%       Aupdx(mid,:)=Aupdx(mid,:)/2;            
%       
%       gg=1:ny;
%       
%       Bzup=zeros(ny,nx);
%       for j=1:ny
%           for i=1:nx
%               Bzup(j,i)=polyval(fZ1,Aup(j,i));
%               if Aup(j,i)>amax1
%                   Bzup(j,i)=polyval(fZ1,amax1);
%               elseif Aup(j,i)<amin1
%                   Bzup(j,i)=polyval(fZ1,amin1);
%               end
%           end
%       end
%       
%       close all
%       left=0.15; bottom=0.5; width=0.6; height=0.4;
%       
%       %ha=axes('Position',[left bottom width height]);
%       
%       pcolor(x*L0,y(gg)*L0,Bzup(gg,:)*b0*1e9);
%       shading interp;      
%       caxis([-60 30]);
%       
%       %hbar=colorbar('vertical');
%       %pos=get(hbar,'Position');
%       %set(hbar,'Position',[pos(1)+0.1 pos(2)+0.15 0.01 0.1],'Fontsize',7)
%       %set(get(hbar,'XLabel'),'String','Bz [nT]','Rotation',0,...
%       %    'HorizontalAlignment','left','Fontsize',8);
%       
%       hold on
%       [cc,hh]=contour(x*L0,y(gg)*L0,Aup(gg,:),[-4:0.11:4],'k');
%       set(hh,'linewidth',1.0);
%       
%       hr1=quiver(xa0,zeros(1,ndata),bxs',bys',0.3,'w');
%       set(hr1,'linewidth',1.0);
%       
%       %set(ha,'fontsize',10,'TickDir','out','linewidth',1.0);      
%       %axis equal
%       %%axis([0 max(x*L0) min(y*L0) max(y*L0)])   
%       xlabel('x [km]','fontsize',10)
%       ylabel('y [km]','fontsize',10)
%       
%    end
% 
% end



function polynums(hObject,eventdata, handles)
%% The Purpose of polynums is to calculate and display quantitative
    %% fit values for the poly fit.  It's problematic at best in its
    %% current format.
    %%*********** Check fit and display var/stdev************
    %%         handles.An = norm vector potential (data num = handles.ndata)
    %%         handles.pbz = mag field pressure (data num = handles.ndata)
    %         ax1 =  (101);
    %         yys1 = (101);
    %         
    %         anr = round(handles.An*100)/100;    % rounded handles.An1 (2 dec)
    %         axr = round(ax1*100)/100;           % rounded ax1 (2 decimals)
    %         nd = numel(anr);                    % # elements in 'an' array
    %         ad = numel(axr);                    % # elements in 'ax' array
    %                                             % an = data
    %                                             % ax = fit line
    %         POIs = zeros(2,2,nd);               % empty matrix to hold all relevant data points
    %         POIs(1,1,:) = handles.An;           % x axis from data
    %         POIs(1,2,:) = handles.pbz;          % y axis from data
    %         [tf,indx] = ismember(axr,anr);    % Super Clunky... use intersect
    %         [c,ia,ib] = intersect(axr,anr);     %#ok<*ASGLU> % so fast!
    %%        Intersect doesn't do repeated values... stops after find one.
    %%        use ismember instead:
    %         [tf, loc] = ismember(anr, axr);
    %         POIs(2,1,:) = ax1(loc);              % x axis from fit
    %         POIs(2,2,:) = yys1(loc);              % y axis from fit
    %         pbz = handles.pbz;
    %         yys = yys1;
    %         rzms=sum((pbz-yys(ia)').^2/nd);
    %         result = [POIs(1,2,:),POIs(2,2,:)];
    %         sdev = std2(result);
    %         var = sdev^2;
    %         set(uicontrol(handles.txt_sd),'String',num2str(sdev, '%1.3f'));
    %         set(uicontrol(handles.txt_var),'String',num2str(var*100, '%1.3f'));
    %         for ii = 1:1:nd
    %             disp(['ii = ',num2str(ii)])
    %             for jj = 1:1:ad
    %                 disp(['ii= ',num2str(ii)])
    %                 disp(['jj = ', num2str(jj)])                
    %                 tf = isequal(anr(ii),axr(jj));
    %                 disp(['jj= ',num2str(jj)])
    %                 disp(['tf= ',num2str(tf)])
    %                 disp(['anr(ii)=', num2str(anr(ii))])
    %                 disp(['axr(jj)=', num2str(axr(jj))])
    %                 
    %                                 if tf == 1
    %                                     POIs(2,1,ii) = jj;
    %                                 else
    %                                     POIs(2,1,ii) = 0;
    %                 disp(['nope. moving on', num2str(ii)]);
    %                 end
    %                 disp(['POIs(2,1,ii)=', num2str(POIs(2,1,ii))])
    %             end
    %         end
    %         handles.POIs(1,1,:) = handles.An    % - x axis
    %         handles.POIs(1,2,:) = handles.pbz   % - y axis
    %         handles.POIs(2,1,:) = ax1           % values that match handles.An values
    %         handles.POIs(2,2,:) = yys1          % values at ax1/An points of interest(POIs)
    %         kk = isequal(handles.POIs,1);
    %         handles.POIs(2,2,kk) = yys1(kk);      
%======================= BEGIN PLOT POLY FIT===============================

function polyplot(hObject,eventdata,handles)
    %polycalc(hObject,eventdata,handles)
    % cla(handles.axes2)
    cla(handles.axes2,'reset')
    set(gcf,'CurrentAxes',handles.axes2); 
    handles.ax1=handles.amin1:0.01:handles.amax1;
    handles.df1=polyder(handles.fS1); %dPt/dA        % derivative of the fit 
    handles.yys1=polyval(handles.fS1,handles.ax1);           % value of the function f1
    handles.yyz1=polyval(handles.fZ1,handles.ax1);
    guidata(hObject, handles);
    % ------ plot TOP RIGHT function from WLT's 6 figures
    set(handles.axes2,'NextPlot','replace')
    plot(handles.axes2,handles.An,handles.pbz,'ko','Markersize',5); grid on; 
    set(handles.axes2,'NextPlot','add')
    plot(handles.axes2,handles.ax1,handles.yys1,'color',[0.5 0.5 0.5],'linewidth',3)
    set (handles.axes2,'ylim',[min(handles.pbz)-0.1 max(handles.pbz)+0.1],'ytick',[0:0.1:1],'fontsize',8);
    ylabel(handles.axes2,'p_t','rotation',0);
    xlabel(handles.axes2,'A');
    guidata(hObject, handles);
%===================== END PLOT POLY FIT =================================

function polycalc(hObject, eventdata, handles)
    %handles.amax1=max(handles.An); amin1=min(handles.An);         

