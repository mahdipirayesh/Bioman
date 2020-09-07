s=0;
for i=1:size(ADLmatrix,2)
    
    window_numbers=size (ADLmatrix{i},1);
    x=ADLmatrix{i};
    
    for j=1:window_numbers
        s=s+1;
        aVM=sqrt(x(j,:,1).^2 + x(j,:,2).^2 +x(j,:,3).^2);
        
        minimum_aVM_preimpact_vector=min(aVM(1:199));
        minimum_aVM_impact_vector=min(aVM(200:400));
        minimum_aVM_postimpact_vector=min(aVM(401:600));
        
        min_ADL_preimpact_vector(s)=minimum_aVM_preimpact_vector;
        min_ADL_impact_vector(s)=minimum_aVM_impact_vector;
        min_ADL_postimpact_vector(s)= minimum_aVM_postimpact_vector;
        
    end
end

cd F:\DATA
save('Min_ADL_preimpact_feature','min_ADL_preimpact_vector')
save('Min_ADL_impact_feature','min_ADL_impact_vector')
save('Min_ADL_postimpact_feature','min_ADL_postimpact_vector')