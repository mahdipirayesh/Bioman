s=0;
for i=1:size(ADLmatrix,2)
    
    window_numbers=size (ADLmatrix{i},1);
    x=ADLmatrix{i};
    
    for j=1:window_numbers
        s=s+1;
        
    ax_preimpact=abs(x(j,1:200,1));
    ay_preimpact=abs(x(j,1:200,2));
    az_preimpact=abs(x(j,1:200,3));
    
    ax_impact=abs(x(j,201:400,1));
    ay_impact=abs(x(j,201:400,2));
    az_impact=abs(x(j,201:400,3));
    
    ax_postimpact=abs(x(j,401:600,1));
    ay_postimpact=abs(x(j,401:600,2));
    az_postimpact=abs(x(j,401:600,3));
    
    SMA_preimpact=SMA_func(ax_preimpact,ay_preimpact,az_preimpact);  
    SMA_impact=SMA_func(ax_impact, ay_impact,az_impact);   
    SMA_postimpact=SMA_func(ax_postimpact, ay_postimpact,az_postimpact);
    
    SMA_ADL_preimpact_vector(s)=SMA_preimpact;
    SMA_ADL_impact_vector(s)=SMA_impact;
    SMA_ADL_postimpact_vector(s)=SMA_postimpact;
    
    end   
end

cd F:\DATA
save('SMA_ADL_preimpact_feature','SMA_ADL_preimpact_vector')
save('SMA_ADL_impact_feature','SMA_ADL_impact_vector')
save('SMA_ADL_postimpact_feature','SMA_ADL_postimpact_vector')

    
    