s=0;
for i=1:size(ADLmatrix,2)
    
    window_numbers=size (ADLmatrix{i},1);
    x=ADLmatrix{i};
    
    for j=1:window_numbers
        s=s+1;
        aVM=sqrt(x(j,:,1).^2 + x(j,:,2).^2 +x(j,:,3).^2);
        
        maximum_aVM_preimpact_vector=max(aVM(1:199)); % 200 omi ompact bayad bashad  
        maximum_aVM_impact_vector=max(aVM(200:400));
        maximum_aVM_postimpact_vector=max(aVM(401:600));
        
        MAX_ADL_preimpact_vector(s)=maximum_aVM_preimpact_vector;
        MAX_ADL_impact_vector(s)=maximum_aVM_impact_vector;
        MAX_ADL_postimpact_vector(s)= maximum_aVM_postimpact_vector;
        
    end
    
end

cd F:\DATA
save('MAX_ADL_preimpact_feature','MAX_ADL_preimpact_vector')
save('MAX_ADL_impact_feature','MAX_ADL_impact_vector')
save('MAX_ADL_postimpact_feature','MAX_ADL_postimpact_vector')