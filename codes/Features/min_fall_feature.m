for i=1:size(x)
    aVM=sqrt(x(i,:,1).^2 + x(i,:,2).^2 +x(i,:,3).^2);
    
    minimum_aVM_preimpact_vector=min(aVM(1:200));
    minimum_aVM_impact_vector=min(aVM(201:400));
    minimum_aVM_postimpact_vector=min(aVM(401:600));
    min_fall_preimpact_vector(i)=minimum_aVM_preimpact_vector;
    min_fall_impact_vector(i)=minimum_aVM_impact_vector;
    min_fall_postimpact_vector(i)= minimum_aVM_postimpact_vector;
end