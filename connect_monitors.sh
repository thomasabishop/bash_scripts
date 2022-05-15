# LVDS! = ThinkPad X220
# If VGA: 
# xrandr --output VGA1 --primary --above LVDS1

# If DPI 
# xrandr  --output DP1 --primary --above LVDS1

#VGA_STATUS = "$(xrandr)"
#DP_STATUS = "$(xrandr | awk '/DP1/ {print $2}')"

if [[ "$(xrandr | awk '/^VGA/ { print $2 }')" == "connected" ]]; then
	xrandr --output VGA1 --primary --above LVDS1
elif [[ "$(xrandr | awk '/^DP1/ { print $2 }')" == "connected" ]];then  
	xrandr  --output DP1 --primary --above LVDS1
else :
fi

