#!/usr/bin/env python
import sys,time,csv,getopt,os.path
progress=0
ledstatus=[[255,69,0,1],[255,69,0,1],[255,69,0,1],[255,69,0,1],[255,69,0,1],[255,69,0,1],[255,69,0,1],[255,69,0,1]]
ledtemp=[255,69,0,1]

def update():
	os.remove('values.csv')
	with open('values.csv', 'w') as csvfile:
		ledupdate = csv.writer(csvfile, delimiter=' ', quotechar='|')
		for i in range(0,8):
			ledupdate.writerow(ledstatus[i])

def clear():
	for i in range(0,8):
		ledstatus[i]=[0,0,0,1]
	update()

def flash():
	for j in range(3):
		for i in range(0,8):
			ledstatus[i]=ledtemp
		update()
		time.sleep(0.2)
		clear()
		time.sleep(0.2)

progress=0

def readline(f):
	r = f.readline()
	while r == "":
		time.sleep(0.0001)
		r = f.readline()
	return r 

def loading(file):
	if os.path.isfile(file):
		oldprogress=0
		clear()
		while True:
			f = open(file,'r')
			progress = float(readline(f))	
			f.close()
			if progress != oldprogress:
				if progress < 100:
					for i in range(0,8):
						if progress >= (i*13):
							ledstatus[i]=[255,69,0,1]
					update()
				else:
					for i in range(0,8):
						ledstatus[i]=[0,255,0,1]
					update()
				oldprogress = progress
	else:
		print("no such file: " + file )
		exit()	
			

def main(argv):
   try:
       opts, args = getopt.getopt(argv,"hcsxf:r:g:b:l",["--red","--green","--blue","--flash","--clear","--watch-file","--start","--stop"])
   except getopt.GetoptError:
      print 'onoff.py <options>'
      sys.exit(2)
   for opt, arg in opts:
      if opt == '-h':
         print 'onoff.py -c (clear)'
         print 'onoff.py -f progressfile'
         print 'onoff.py -r "red" -g "green" -b "blue" -l (flash)' 
         sys.exit()
      elif opt in ("-r", "--red"):
         ledtemp[0] = arg
      elif opt in ("-g", "--green"):
         ledtemp[1] = arg
      elif opt in ("-b", "--blue"):
         ledtemp[2] = arg
      elif opt in ("-l", "--flash"):
         flash()
      elif opt in ("-c", "--clear"):
         clear()
      elif opt in ("-f", "--watch-file"):
         loading(arg)

if __name__ == "__main__":
   main(sys.argv[1:])

