function [uavg]=avg_velocity_line(m ,direction,frame)
% X=x(1,:);
% Y=y(:,1);
display = 'yes'
x = m.x;
y = m.y;
u = m.u(:,:,frame);
v = m.v(:,:,frame);
uTempHor = zeros(1,size(x(1,:),2));
uTempVer = zeros(size(y(:,1),1),1);
row = zeros(size(y(:,1),1),size(x(1,:),2));
colum = zeros(size(y(:,1),1),size(x(1,:),2));

if strcmp(direction,'vertical')==1 
    
    for xi=1:(size(x,2))
     for yi=1:(size(y,1))
         if isnan(u(yi,xi))==0 
          uTempVer(xi) = uTempVer(xi) +  u(yi,xi);
         end
     end
    colum(:,xi)= ones(size(y(:,1),1),1).*uTempVer(xi);
    end
    uavg=colum./size(y,1);
    if strcmp(display,'yes')==1
     plot(x(1,:),uavg(1,:));
     title('Avarage Velocity along y. ''u'' direction');
     
%      surf(x(1,:),y(:,1),uavg,'EdgeColor','none');
%      view(2); c = colorbar; c.Label.String = 'u direction Velocity [um/sec]';
     
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
elseif  strcmp(direction,'horizontal')==1 
    
    for yi=1:(size(y,1))
     for xi=1:(size(x,2))
       if isnan(u(yi,xi))==0 
        uTempHor(yi) = uTempHor(yi) + u(yi,xi);
       end
     end
     row(yi,:)= ones(1,size(x(1,:),2)).*uTempHor(yi);
    end
    uavg=row./size(x,2);
    if strcmp(display,'yes')==1       
     plot(uavg(:,1),y(:,1));  
     Q = trapz(y(:,1),uavg(:,1))/600; % u  avrage
     xlabel('Velocity average [um/sec]');
     ylabel('Position [um]');
     str = sprintf('Avarage Velocity along x.''u'' direction , Vavg= %0.2f [um/sec]' , Q)
     title(str); 
     
%      contour(x(1,:),y(:,1),row)
%      c= colorbar; c.Label.String = 'u direction Velocity [um/sec]';
%      surf(x(1,:),y(:,1),uavg,'EdgeColor','none');
%      view(2); c= colorbar; c.Label.String = 'u direction Velocity [um/sec]';

    end
    end 
end