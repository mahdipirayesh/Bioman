for i=1:size(x)
    ax_preimpact=x(i,1:200,1);
    ay_preimpact=x(i,1:200,2);
    az_preimpact=x(i,1:200,3);
    
    ax_impact=x(i,201:400,1);
    ay_impact=x(i,201:400,2);
    az_impact=x(i,201:400,3);
    
    ax_postimpact=x(i,401:600,1);
    ay_postimpact=x(i,401:600,2);
    az_postimpact=x(i,401:600,3);
    
    Energy_preimpact=Energy_func(ax_preimpact, ay_preimpact,az_preimpact);  
    Energy_impact=Energy_func(ax_impact, ay_impact,az_impact);   
    Energy_postimpact=Energy_func(ax_postimpact, ay_postimpact,az_postimpact);
    
    Energy_fall_preimpact_vector(i)=Energy_preimpact;
    Energy_fall_impact_vector(i)=Energy_impact;
    Energy_fall_postimpact_vector(i)=Energy_postimpact;
    
    
    
end

cd F:\DATA
save('Energy_fall_preimpact_feature','Energy_fall_preimpact_vector')
save('Energy_fall_impact_feature','Energy_fall_impact_vector')
save('Energy_fall_postimpact_feature','Energy_fall_postimpact_vector')