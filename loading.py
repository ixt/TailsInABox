#!/usr/bin/env python
import blinkt,sys,time

oldprogress=0
progress=0
blinkt.set_clear_on_exit()

def readline(f):
	r = f.readline()
	while r == "":
		time.sleep(0.0001)
		r = f.readline()
	return r 

while True:
	f = open('.log','r')
	progress = float(readline(f))	
	f.close()

	blinkt.clear()
	if progress < 100:
		for i in range(0,8):
			if progress >= (i*13):
				blinkt.set_pixel(i,255,69,0)
	else:
		for i in range(0,8):
			blinkt.set_pixel(i,0,255,0)
	
	blinkt.show()
