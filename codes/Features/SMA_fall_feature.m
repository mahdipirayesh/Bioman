for i=1:size(x)
    ax_preimpact=abs(x(i,1:200,1));
    ay_preimpact=abs(x(i,1:200,2));
    az_preimpact=abs(x(i,1:200,3));
    
    ax_impact=abs(x(i,201:400,1));
    ay_impact=abs(x(i,201:400,2));
    az_impact=abs(x(i,201:400,3));
    
    ax_postimpact=abs(x(i,401:600,1));
    ay_postimpact=abs(x(i,401:600,2));
    az_postimpact=abs(x(i,401:600,3));
    
    SMA_preimpact=SMA_func(ax_preimpact,ay_preimpact,az_preimpact);  
    SMA_impact=SMA_func(ax_impact, ay_impact,az_impact);   
    SMA_postimpact=SMA_func(ax_postimpact, ay_postimpact,az_postimpact);
    
    SMA_fall_preimpact_vector(i)=SMA_preimpact;
    SMA_fall_impact_vector(i)=SMA_impact;
    SMA_fall_postimpact_vector(i)=SMA_postimpact;
    
end   
%%
cd F:\DATA
save('SMA_fall_preimpact_feature','SMA_fall_preimpact_vector')
save('SMA_fall_impact_feature','SMA_fall_impact_vector')
save('SMA_fall_postimpact_feature','SMA_fall_postimpact_vector')
    