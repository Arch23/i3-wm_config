#!/bin/sh

BACKGROUND='#000000'
BACK='#00000000'
R='#F4493BFF'
T='#00000000'
B='#426D8DFF'
T='#FFFFFFFF'
W='#113322FF'
V=$B

echo "foi chamado"

i3lock \
--insidevercolor=$BACK   \
--ringvercolor=$B     \
\
--insidewrongcolor=$R \
--ringwrongcolor=$R   \
\
--insidecolor=$BACK   \
--ringcolor=$R        \
--linecolor=$BACK        \
--separatorcolor=$BACK   \
\
--verifcolor=$B       \
--wrongcolor=$R       \
--timecolor=$R        \
--datecolor=$R        \
--layoutcolor=$R      \
--keyhlcolor=$B       \
--bshlcolor=$BACK     \
--radius=180          \
\
--screen 1            \
--clock               \
--indicator           \
--timestr="%H:%M:%S"  \
--datestr="%A, %m %Y" \
-c $BACKGROUND        \
--keylayout 2 \