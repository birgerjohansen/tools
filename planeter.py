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
        (body.az - moon.az)*180/np.pi, e.separation(moon, body)*180/np.pi))

angles = sorted(angles, key=itemgetter(3))

print('')
print('| Name    | Azimuth | Elevation | Azimuth diff | Angular sep |')
print('|---------|---------|-----------|--------------|-------------|')
for bodyitems in angles:
    name, az, el, az_diff, sep = bodyitems
    print('|', name.ljust(7), '|', "{:7.2f}".format(az), '|', \
            "{:6.2f}".format(el).rjust(9), '|',\
            "{:6.2f}".format(az_diff).rjust(12), '|',\
            "{:6.2f}".format(sep).rjust(11), '|')

print('')

table = tabulate(angles, headers=('Name', 'Azimuth', 'Elevation', 'Azimuth diff', 'Angular sep'),
                 tablefmt='pipe', floatfmt='.1f')
#print(table)
