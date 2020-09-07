s=0;
for i=1:size(ADLmatrix,2)
    
    window_numbers=size (ADLmatrix{i},1);
    x=ADLmatrix{i};
    
    for j=1:window_numbers
        s=s+1;
        aVM=sqrt(x(j,:,1).^2 + x(j,:,2).^2 +x(j,:,3).^2);
        
        Var_aVM_preimpact=var(aVM(1:200));
        Var_aVM_impact=var(aVM(201:400));
        Var_aVM_postimpact=var(aVM(401:600));
        Var_ADL_preimpact_vector(s)=Var_aVM_preimpact;
        Var_ADL_impact_vector(s)=Var_aVM_impact;
        Var_ADL_postimpact_vector(s)= Var_aVM_postimpact;
        
    end
    
end
cd F:\DATA
save('Var_ADL_preimpact_feature','Var_ADL_preimpact_vector')
save('Var_ADL_impact_feature','Var_ADL_impact_vector')
save('Var_ADL_postimpact_feature','Var_ADL_postimpact_vector')