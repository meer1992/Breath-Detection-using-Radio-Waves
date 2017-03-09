t = 0 ;
x = 0 ;
startSpot = 0;
interv = 1000 ; % considering 1000 samples
step = 0.1 ; % lowering step has a number of cycles and then acquire more data
while ( t <interv )
    [status, output] = system ('/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I');
    data= strsplit(output,'agrCtlRSSI:|agrExtRSSI:|agrCtlNoise:|agrExtNoise:|state:|op mode:|lastTxRate:|maxRate:|lastAssocStatus:|802.11 auth:|link auth:|BSSID:|SSID:|MCS:|channel:','DelimiterType','RegularExpression');
    agrCtlRSSI(1) = str2double(data(2));
%     disp(agrCtlRSSI);
    agrCtlNoise(1) = str2double(data(4));
    % Adding
    sum = agrCtlNoise(1)+agrCtlRSSI(1);
    x = [ x, sum];
    plot(x) ;
      if ((t/step)-500 < 0)
          startSpot = 0;
      else
          startSpot = (t/step)-500;
      end
%       axis([ startSpot, (t/step+50), 0 , 10 ]);
      grid
      t = t + step;
      drawnow;
      pause(0.01)
end