NAME="Consumer"
COUNT=$(< COUNT)
SERVICE=$(< SERVICE)

NTH=`expr $COUNT + 1`
NAME+=$NTH
echo -e $SERVICE | sed -e "s/##NAME##/$NAME/g" > "/etc/systemd/system/$NAME.service"
echo "$NTH" > COUNT

systemctl enable "$NAME.service"
systemctl start "$NAME.service"
