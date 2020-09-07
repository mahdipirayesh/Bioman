for i=1:size(x)
    aVM=sqrt(x(i,:,1).^2 + x(i,:,2).^2 +x(i,:,3).^2);
    
    maximum_aVM_preimpact_vector=max(aVM(1:200));
    maximum_aVM_impact_vector=max(aVM(201:400));
    maximum_aVM_postimpact_vector=max(aVM(401:600));
    MAX_fall_preimpact_vector(i)=maximum_aVM_preimpact_vector;
    MAX_fall_impact_vector(i)=maximum_aVM_impact_vector;
    MAX_fall_postimpact_vector(i)= maximum_aVM_postimpact_vector;
end