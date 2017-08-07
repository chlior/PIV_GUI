%Raw Resaults                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%Input:                                                             %
%location xp,yp in pixels AND velocitys u,v in units [um/s].              %
%fram number #k in the video's frame loop.                                %
%%%%%%%Output:                                                            %
%figure with velocity field vectors on the frame #k background. Add title.%
% save the whole figure in the name '#k raw.bmp'                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [FolderName1]=rawR(k,this_frame0,xp,yp,u,v,PPFolder,display)
  %Raw Resaults
  if strcmp(display,'yes')==1
  hold off; imshow(this_frame0); drawnow; hold on;
  fig=quiver(xp,yp,u,v,10);  drawnow;
  title(sprintf('%d - %d - raw Resaults #%d',k-1,k,k));

 %%%%__save figure__%%%%%%%
  FileName=sprintf('#%d.bmp',k);
  FolderName1 = fullfile(PPFolder,'rawR');
  if exist(FolderName1)==0 mkdir(FolderName1); end
  FullFileName = fullfile(FolderName1, FileName);
  saveas(fig,FullFileName);
 %%%%%%%%%%%%%%%%%%%%%%%%%%
  else FolderName1=[]; end
 
 %%%%__save .mat__%%%%%%%%%
  FileName=sprintf('#%d xp yp u v matrix.mat',k);
  FolderName2 = fullfile(PPFolder,'rawR_mat');
  if exist(FolderName2)==0 mkdir(FolderName2); end
  FullFileName = fullfile(FolderName2, FileName);
  save(FullFileName,'xp','yp','u','v') %save the data as matrix
 %%%%%%%%%%%%%%%%%%%%%%%%%%
  
end