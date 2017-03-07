[status, output] = system ('/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I');
data= strsplit(output,'agrCtlRSSI:|agrExtRSSI:|agrCtlNoise:|agrExtNoise:|state:|op mode:|lastTxRate:|maxRate:|lastAssocStatus:|802.11 auth:|link auth:|BSSID:|SSID:|MCS:|channel:','DelimiterType','RegularExpression');
agrCtlRSSI = str2double(data(2));
agrCtlNoise = data(4);