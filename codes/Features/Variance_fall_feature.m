for i=1:size(x)
    aVM=sqrt(x(i,:,1).^2 + x(i,:,2).^2 +x(i,:,3).^2);
    
    Variance_aVM_preimpact=var(aVM(1:200));
    Variance_aVM_impact=var(aVM(201:400));
    Variance_aVM_postimpact=var(aVM(401:600));
    Variance_fall_preimpact_vector(i)=Variance_aVM_preimpact;
    Variance_fall_impact_vector(i)=Variance_aVM_impact;
    Variance_fall_postimpact_vector(i)= Variance_aVM_postimpact;
end
cd F:\DATA
save('Variance_fall_preimpact_feature','Variance_fall_preimpact_vector')
save('Variance_fall_impact_feature','Variance_fall_impact_vector')
save('Variance_fall_postimpact_feature','Variance_fall_postimpact_vector')