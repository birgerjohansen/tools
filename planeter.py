import ephem as e
import numpy as np
import datetime
from operator import itemgetter
from tabulate import tabulate

angles = []
moon = e.Moon()
mercury = e.Mercury()
venus = e.Venus()
mars = e.Mars()
jupiter = e.Jupiter()
saturn = e.Saturn()
sun = e.Sun()

oslo = e.Observer()
oslo.lat = 60*np.pi/180
oslo.lon = 11*np.pi/180
oslo.date = datetime.datetime.now()

for body in (moon, sun, mercury, venus, mars, jupiter, saturn):
    body.compute(oslo)
    angles.append((body.name, body.az*180/np.pi, body.alt*180/np.pi,
        e.separation(moon, body)*180/np.pi, body.mag, body.size))

angles = sorted(angles, key=itemgetter(3))

#print('')
#print('| Name    | Azimuth | Elevation | Angular sep |')
#print('|---------|---------|-----------|-------------|')
#for bodyitems in angles:
#    name, az, el, sep, mag, size = bodyitems
#    print('|', name.ljust(7), '|', "{:7.2f}".format(az), '|', \
#            "{:6.2f}".format(el).rjust(9), '|',\
#            "{:6.2f}".format(sep).rjust(11), '|')
#
print('')
print('Dato/klokkeslett:', oslo.date.datetime())
print(44*'-')
print('')

headers = ('Name', 'Azimuth', 'Elevation', 'Angular sep', 'Magnitude', 'Size')
table = tabulate(angles, headers, tablefmt='pipe', floatfmt='.2f')

print(table.replace(':', '-'))
