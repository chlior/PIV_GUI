function [m] = video_rawData(video, piv, playback, folder, handles)
wins = piv.wins;
deltaT = piv.deltaT;
overlap = piv.overlap;
woco = piv.woco;
maskfile = piv.maskfile;
method = piv.method;
sizeFactor = piv.sizeFactor;

%     %%%%%%%%%%%%%%%%___CHOOSE YOUR ACTION___%%%%%%%%%%%%ctrl+R%%%ctrl+T%%%%%%
%     %   %%%%___PIV of one pair___%%%%%%%%%%%
%     %   [xp,yp,up,vp,snr,pkh] = matpiv(this_frame0,this_frame1,wins,T,0.5,met,[],maskfile);
%     %   %%%%___Filters Choosing Guide:___%%%
%     %   filter_sub_plot(this_frame0,this_frame1,wins,T,0.5,met,[],maskfile);
%     %   %%%%___Post Processing:___%%%%%%%%%%
%     [xp,yp,up,vp]=post_process(this_frame0,this_frame1,wins,T,0.5,met,[],maskfile,PPFolder);
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     [x,y,u,v] = pix2unit(xp,yp,up,vp,cal);   %calibration to [um]
%     rawFolder=rawR(k,this_frame0,xp,yp,u,v,PPFolder,'yes');  %raw date vectors      diplay:'yes'/'no'
%     vmFolder=vm(k,x,y,u,v,PPFolder,'yes');                  %Velocity magnitude     diplay:'yes'/'no'  
%     [uavg(:,:,k)] = avg_velocity_line(x,y,u,v,'horizontal','no'); % 'horizontal'/'vertical'   diplay:'yes'/'no'
%      
%     %make 2nd image to 1st image next analysis
%     this_frame0 = this_frame1;    
% end

%%%%__aditional processing__%%%%%%%%
% [uavg]=avg_avg_velocity_line(this_frame0,NumberOfFrames,x,y,uavg,'horizontal','yes');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vidObj = VideoReader(video);
fps = playback.fps;
stime = playback.stime;
etime = playback.etime;
if isempty(etime)
    eframe=vidObj.NumberOfFrames;
else
    eframe = round(etime*fps);        
end
vidObj = VideoReader(video);
vidObj.CurrentTime = stime;
sframe = round(stime*fps)+1;
set(handles.text_frame ,'string',sframe); drawnow;

 writerObj = VideoWriter('YourAVI.avi');
 open(writerObj)
figure(1);
m = matfile('Raw_Data.mat', 'Writable', true);
this_frame0 = readFrame(vidObj);
imshow(this_frame0); drawnow
k=sframe;
while k < eframe  & hasFrame(vidObj)     
    this_frame1 = readFrame(vidObj); % next frame
    imshow(this_frame1); drawnow;  hold on;
    str = sprintf('# %d, Remine %d',k,eframe-k);
    set(handles.text_frame ,'string',str); drawnow;
    [x,y,u,v,snr,pkh] = matpiv(this_frame0,this_frame1,wins,deltaT,overlap,method,[],maskfile);
     % figure('visible','off'); 
    fig=quiver(x,y,u,v,sizeFactor); %handles.figure1

    %%%%__save figure__%%%%%%%
  FileName=sprintf('#%d.bmp',k);
  FolderName = fullfile(folder,'Raw Data');
  if exist(FolderName)==0 mkdir(FolderName); end
  FullFileName = fullfile(FolderName, FileName);
  saveas(fig,FullFileName);
  frame = imread(FullFileName);
  writeVideo(writerObj, frame);

 %%%%%%%%%%%%%%%%%%%%%%%%%%
     if k == sframe;
        m.x = x;
        m.y = y;
        NumberOfFrames = eframe-sframe;
        m.u = repmat(u,1,1,NumberOfFrames);
        m.v = repmat(v,1,1,NumberOfFrames);
    else
        m.u(:,:,k) = u;
        m.v(:,:,k) = v;        
    end
    
    this_frame0 = this_frame1; 
    k=k+1
end
myVideo.FrameRate = fps;  % Default 30
myVideo.Quality = 100;    % Default 75
close(writerObj);
close(figure(1));
end

