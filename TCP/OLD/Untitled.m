%Timing test between ML and UE
Data= mlread('D:\ML_UE4_Project\MonkeyLogic\task\UE4_Test\171214_Me_UE_Test.bhv2');

P_ST = Data(6).UEData.P_SampleTime;
U_QT = Data(6).UEData.UE_QueryTime;

P_ST = cellfun(@(x) str2double(x), P_ST);
 
U_QT = cell2mat(cellfun(@(x) datevec(x), U_QT, 'uni', 0));

for k=1:size(U_QT,1)
    
   tempU_QT(k,1) = etime(U_QT(k,:), U_QT(1,:));
    
end

tempP_ST = P_ST - P_ST(1);