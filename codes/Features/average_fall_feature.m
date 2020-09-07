for i=1:size(x)
    aVM=sqrt(x(i,:,1).^2 + x(i,:,2).^2 +x(i,:,3).^2);
    
    aVM1=aVM(1:200);
    aVM2=aVM(201:400);
    aVM3=aVM(401:600);
    average_aVM_preimpact_vector=sum(aVM1(:))/numel(aVM1);
    average_aVM_impact_vector=sum(aVM2(:))/numel(aVM2);
    average_aVM_postimpact_vector=sum(aVM3(:))/numel(aVM3);
    
    average_fall_preimpact_vector(i)=average_aVM_preimpact_vector;
    average_fall_impact_vector(i)=average_aVM_impact_vector;
    average_fall_potimpact_vector(i)=average_aVM_postimpact_vector;
    
    
end