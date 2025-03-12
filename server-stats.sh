r

echo "------------------------------"
echo "Server Performance Statistics"
echo "------------------------------"


echo "Total CPU usage:"
top -bn1 | grep "Cpu(s)" | \
sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
awk '{print 100 - $1"%"}'


echo "------------------------------"
echo "Total memory usage (Free vs Used including percentage):"
free -m | awk 'NR==2{printf "Used: %sMB (%.2f%%), Free: %sMB (%.2f%%)\n", $3, $3*100/$2, $4, $4*100/$2 }'


echo "------------------------------"
echo "Total disk usage (Free vs Used including percentage):"
df -h | awk '$NF=="/"{printf "Used: %dGB (%.2f%%), Free: %dGB (%.2f%%)\n", $3, $5, $4, 100-$5}'

echo "------------------------------"
echo "Top 5 processes by CPU usage:"
ps aux --sort=-%cpu | awk 'NR<=6{printf "%-10s %-10s %-10s %-10s\n", $1, $2, $3, $11 }' | column -t


echo "------------------------------"
echo "Top 5 processes by memory usage:"
ps aux --sort=-%mem | awk 'NR<=6{printf "%-10s %-10s %-10s %-10s\n", $1, $2, $4, $11 }' | column -t


echo "------------------------------"
echo "Operating System Version:"
lsb_release -a

echo "------------------------------"
echo "System Uptime:"
uptime -p

echo "------------------------------"
echo "Load Average:"
uptime

echo "------------------------------"
echo "Logged in users:"
who

echo "------------------------------"
echo "Failed login attempts:"
grep "Failed password" /var/log/auth.log | wc -l

echo "------------------------------"
echo "End of Server Performance Statistics"
echo "------------------------------"
