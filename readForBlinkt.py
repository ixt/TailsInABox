#!/usr/bin/env python
import blinkt,csv,os.path
blinkt.set_clear_on_exit()

while True:
	if os.path.isfile('values.csv'):
		blinkt.clear()
		with open('values.csv', 'rb') as csvfile:
			ledupdate = csv.reader(csvfile, delimiter=' ', quotechar='|')
			i = 0
			for row in ledupdate:
				blinkt.set_pixel(i,row[0],row[1],row[2],1)
				i += 1
		blinkt.show()
