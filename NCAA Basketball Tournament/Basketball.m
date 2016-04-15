%% INITIAL READING IN OF THE DATA AND STATISTICS

clear
clc
close all

[game1 game2 gamedata] = xlsread('2016_Games.xlsx');
[player1 player2 playerdata] = xlsread('2016_Players.xlsx');
gamedata=gamedata(:,1:7);l1=length(gamedata);number1gamedata={0};counter=1;
kangame={0};kancount=1;uvagame={0};uvacount=1;oregame={0};orecount=1;uncgame={0};unccount=1;

%Cleaning up the entire data set to find values for the top four teams

for i=2:l1
    if strcmp(gamedata{i,2},'North Carolina') == 1 || strcmp(gamedata{i,5},'North Carolina') == 1
        for j=1:7
            number1gamedata{counter,j}=gamedata{i,j};
            uncgame{unccount,j}=gamedata{i,j};
        end
        unccount=unccount+1;
        counter=counter+1;
    elseif strcmp(gamedata{i,2},'Kansas') == 1 || strcmp(gamedata{i,5},'Kansas') == 1
        for j=1:7
            number1gamedata{counter,j}=gamedata{i,j};
            kangame{kancount,j}=gamedata{i,j};
        end
        kancount=kancount+1;
        counter=counter+1;
    elseif strcmp(gamedata{i,2},'Oregon') == 1 || strcmp(gamedata{i,5},'Oregon') == 1
        for j=1:7
            number1gamedata{counter,j}=gamedata{i,j};
            oregame{orecount,j}=gamedata{i,j};
        end
        orecount=orecount+1;
        counter=counter+1;
    elseif strcmp(gamedata{i,2},'Virginia') == 1 || strcmp(gamedata{i,5},'Virginia') == 1
        for j=1:7
            number1gamedata{counter,j}=gamedata{i,j};
            uvagame{uvacount,j}=gamedata{i,j};
        end
        uvacount=uvacount+1;
        counter=counter+1;
    end
end

%This eliminates duplicate entries in the resulting matrices

l2=length(number1gamedata);teamdata={0};counter=1;
for i=1:2:l2
    for j=1:7
        number1gamedata{counter,j}=number1gamedata{i,j};
    end
    counter=counter+1;
end

l3=length(playerdata);number1playerdata={0};counter=1;
kanplay={0};kancount=1;uvaplay={0};uvacount=1;uncplay={0};unccount=1;oreplay={0};orecount=1;

%Extracting the individual player data from the top four teams

for i=2:l3
    if strcmp(playerdata{i,6},'North Carolina') == 1
        for j=1:26
            number1playerdata{counter,j}=playerdata{i,j};
            uncplay{unccount,j}=playerdata{i,j};
        end
        counter=counter+1;
        unccount=unccount+1;
    elseif strcmp(playerdata{i,6},'Kansas') == 1 
        for j=1:26
            number1playerdata{counter,j}=playerdata{i,j};
            kanplay{kancount,j}=playerdata{i,j};
        end
        counter=counter+1;
        kancount=kancount+1;
    elseif strcmp(playerdata{i,6},'Oregon') == 1 
        for j=1:26
            number1playerdata{counter,j}=playerdata{i,j};
            oreplay{orecount,j}=playerdata{i,j};
        end
        counter=counter+1;
        orecount=orecount+1;
    elseif strcmp(playerdata{i,6},'Virginia') == 1 
        for j=1:26
            number1playerdata{counter,j}=playerdata{i,j};
            uvaplay{uvacount,j}=playerdata{i,j};
        end
        counter=counter+1;
        uvacount=uvacount+1;
    end
end

%Calculation of the NCAA average points in the season

avg=0;
for i=2:l1
    avg=avg+gamedata{i,4};
    avg=avg+gamedata{i,6};
end
avgpoints=avg/(2*(l1-1));

%Calculation of the NCAA average score differential in the season

dif=0;
for i=2:l1
    dif=dif+abs((gamedata{i,4}-gamedata{i,6}));
end
avgdif=dif/(2*(l1-1));

%Calculation of the score differentials for the top four teams

dif=0;avg=0;
for i=1:length(kangame)
    dif=dif+abs((kangame{i,4}-kangame{i,6}));
end
kandif=dif/((length(kangame)));dif=0;avg=0;
for i=1:length(uvagame)
    dif=dif+abs((uvagame{i,4}-uvagame{i,6}));
end
uvadif=dif/((length(uvagame)));dif=0;avg=0;
for i=1:length(uncgame)
    dif=dif+abs((uncgame{i,4}-uncgame{i,6}));
end
uncdif=dif/((length(uncgame)));dif=0;avg=0;
for i=1:length(oregame)
    dif=dif+abs((oregame{i,4}-oregame{i,6}));
end
oredif=dif/((length(oregame)));

%Calculating the NCAA averages for shooting percentages

fgmade=0;fgatt=0;made3=0;att3=0;ftmade=0;ftatt=0;
for i=2:length(playerdata)
    fgmade=fgmade+playerdata{i,10};
    fgatt=fgatt+playerdata{i,11};
    made3=made3+playerdata{i,14};
    att3=att3+playerdata{i,15};
    ftmade=ftmade+playerdata{i,16};
    ftatt=ftatt+playerdata{i,17};
end

fgavg=fgmade/fgatt;avg3=made3/att3;ftavg=ftmade/ftatt;

%Calculation of the top four team average points

ktot=0;
for i=1:length(kangame)
    if strcmp(kangame{i,2},'Kansas') == 1
        ktot=ktot+kangame{i,4};
    elseif strcmp(kangame{i,5},'Kansas') == 1
        ktot=ktot+kangame{i,6};
    end
end
kanavgpts=ktot/length(kangame);uvatot=0;
for i=1:length(uvagame)
    if strcmp(uvagame{i,2},'Virginia') == 1
        uvatot=uvatot+uvagame{i,4};
    elseif strcmp(uvagame{i,5},'Virginia') == 1
        uvatot=uvatot+uvagame{i,6};
    end
end
uvaavgpts=uvatot/length(uvagame);otot=0;
for i=1:length(oregame)
    if strcmp(oregame{i,2},'Oregon') == 1
        otot=otot+oregame{i,4};
    elseif strcmp(oregame{i,5},'Oregon') == 1
        otot=otot+oregame{i,6};
    end
end
oreavgpts=otot/length(oregame);unctot=0;
for i=1:length(uncgame)
    if strcmp(uncgame{i,2},'North Carolina') == 1
        unctot=unctot+uncgame{i,4};
    elseif strcmp(uncgame{i,5},'North Carolina') == 1
        unctot=unctot+uncgame{i,6};
    end
end
uncavgpts=unctot/length(uncgame);

%Calculating the shooting percentages for the top four teams

fgmade=0;fgatt=0;made3=0;att3=0;ftmade=0;ftatt=0;
for i=1:12
    fgmade=fgmade+uvaplay{i,10};
    fgatt=fgatt+uvaplay{i,11};
    made3=made3+uvaplay{i,14};
    att3=att3+uvaplay{i,15};
    ftmade=ftmade+uvaplay{i,16};
    ftatt=ftatt+uvaplay{i,17};
end
uvafgavg=fgmade/fgatt;uvaavg3=made3/att3;uvaftavg=ftmade/ftatt;
fgmade=0;fgatt=0;made3=0;att3=0;ftmade=0;ftatt=0;
for i=1:15
    fgmade=fgmade+uncplay{i,10};
    fgatt=fgatt+uncplay{i,11};
    made3=made3+uncplay{i,14};
    att3=att3+uncplay{i,15};
    ftmade=ftmade+uncplay{i,16};
    ftatt=ftatt+uncplay{i,17};
end
uncfgavg=fgmade/fgatt;uncavg3=made3/att3;uncftavg=ftmade/ftatt;
fgmade=0;fgatt=0;made3=0;att3=0;ftmade=0;ftatt=0;
for i=1:15
    fgmade=fgmade+kanplay{i,10};
    fgatt=fgatt+kanplay{i,11};
    made3=made3+kanplay{i,14};
    att3=att3+kanplay{i,15};
    ftmade=ftmade+kanplay{i,16};
    ftatt=ftatt+kanplay{i,17};
end
kanfgavg=fgmade/fgatt;kanavg3=made3/att3;kanftavg=ftmade/ftatt;
fgmade=0;fgatt=0;made3=0;att3=0;ftmade=0;ftatt=0;
for i=1:12
    fgmade=fgmade+oreplay{i,10};
    fgatt=fgatt+oreplay{i,11};
    made3=made3+oreplay{i,14};
    att3=att3+oreplay{i,15};
    ftmade=ftmade+oreplay{i,16};
    ftatt=ftatt+oreplay{i,17};
end
orefgavg=fgmade/fgatt;oreavg3=made3/att3;oreftavg=ftmade/ftatt;

%% GRAPHS OF THE DATA

%Pie charts for the class breakdowns

figure('color','white')
labels={'Freshman','Sophomore','Junior','Senior'};
explode=[1 1 1 1];
v=[2 4 1 5];
o=[3 4 2 3];
u=[2 3 5 5];
k=[3 3 5 4];
p1=pie(v,explode,labels)
p2=pie(o,explode,labels)
p3=pie(u,explode,labels)
p3=pie(k,explode,labels)
colormap([1 0 0;0 1 0;0 0 1;1 1 0]) 
      
%Bar graphs for the individual statistics
%Order of statistics is PPG, Point differential, FG %, 3PT %, FT %

uva=[70.56 12.41 48.82 40.66 75.40];
unc=[82.26 14.06 48.03 31.55 73.76];
kan=[81.56 16.71 49.44 42.62 70.60];
ore=[78.82 12.88 46.79 34.93 71.60];
ncaa=[72.53 6.62 44.07 34.80 69.85];
ppg=[uva(1) unc(1) kan(1) ore(1) ncaa(1)];
pdif=[uva(2) unc(2) kan(2) ore(2) ncaa(2)];
fgpct=[uva(3) unc(3) kan(3) ore(3) ncaa(3)];
pct3=[uva(4) unc(4) kan(4) ore(4) ncaa(4)];
ftpct=[uva(5) unc(5) kan(5) ore(5) ncaa(5)];
barh(ppg)
barh(pdif)
barh(fgpct)
barh(pct3)
barh(ftpct)