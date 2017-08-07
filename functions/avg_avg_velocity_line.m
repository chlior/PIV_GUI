function [avg] = avg_avg_velocity_line(this_frame0,k,x,y,uavg,direction,display)

hor=size(x(1,:),2);
ver=size(y(:,1),1);

avg= zeros(ver,hor);
for i=1:k
    avg=avg+uavg(:,:,k);
end
avg=avg./k;
    if strcmp(display,'yes')==1
     if strcmp(display,'vertical')==1 
         figure; hold on; imshow(this_frame0);   hold on;
         plot(x(1,:),avg(1,:));
         title('Avarage Velocity along y for all frames. ''u'' direction');
     else
        figure; hold on; imshow(this_frame0);   hold on;
        plot(avg(:,1),y(:,1));
        title('Avarage Velocity along x for all frames. ''u'' direction');
     end 
%       figure;
%       surf(x(1,:),y(:,1),avg,'EdgeColor','none'); 
%       view(2); c = colorbar; c.Label.String = 'u direction Velocity [um/sec]';
    end
end