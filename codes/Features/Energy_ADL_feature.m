s=0;
for i=1:size(ADLmatrix,2)
    
    window_numbers=size (ADLmatrix{i},1);
    x=ADLmatrix{i};
    
    for j=1:window_numbers
        s=s+1;
        
        ax_preimpact=x(j,1:200,1);
        ay_preimpact=x(j,1:200,2);
        az_preimpact=x(j,1:200,3);
        
        ax_impact=x(j,201:400,1);
        ay_impact=x(j,201:400,2);
        az_impact=x(j,201:400,3);
        
        ax_postimpact=x(j,401:600,1);
        ay_postimpact=x(j,401:600,2);
        az_postimpact=x(j,401:600,3);
        
        Energy_preimpact=Energy_func(ax_preimpact, ay_preimpact,az_preimpact);
        Energy_impact=Energy_func(ax_impact, ay_impact,az_impact);
        Energy_postimpact=Energy_func(ax_postimpact, ay_postimpact,az_postimpact);
        
        
        Energy_ADL_preimpact_vector(s)=Energy_preimpact;
        Energy_ADL_impact_vector(s)=Energy_impact;
        Energy_ADL_postimpact_vector(s)=Energy_postimpact;
        
        
    end
    
end
cd F:\DATA
save(' Energy_ADL_preimpact_feature','Energy_ADL_preimpact_vector')
save(' Energy_ADL_impact_feature','Energy_ADL_impact_vector')
save(' Energy_ADL_postimpact_feature','Energy_ADL_postimpact_vector')