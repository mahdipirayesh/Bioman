s=0;
for i=1:size(ADLmatrix,2)
    
    window_numbers=size (ADLmatrix{i},1);
    x=ADLmatrix{i};
    
    
    for j=1:window_numbers
        s=s+1;
        aVM=sqrt(x(j,:,1).^2 + x(j,:,2).^2 +x(j,:,3).^2);
        aVM1=aVM(1:200);
    aVM2=aVM(201:400);
    aVM3=aVM(401:600);
    average_aVM_preimpact_vector=sum(aVM1(:))/numel(aVM1);
    average_aVM_impact_vector=sum(aVM2(:))/numel(aVM2);
    average_aVM_postimpact_vector=sum(aVM3(:))/numel(aVM3);
    
    average_ADL_preimpact_vector(s)=average_aVM_preimpact_vector;
    average_ADL_impact_vector(s)=average_aVM_impact_vector;
    average_ADL_postimpact_vector(s)=average_aVM_postimpact_vector;
    
    
    end
end
save('average_ADL_preimpact_feature','average_ADL_preimpact_vector')
save('average_ADL_impact_feature','average_ADL_impact_vector')
save('average_ADL_postimpact_feature','average_ADL_postimpact_vector')