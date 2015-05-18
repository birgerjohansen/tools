import ephem as e
import numpy as np
import datetime

sun = e.Sun()

site = e.Observer()

now = datetime.datetime.today()

#site.lat = 5.16*np.pi/180
#site.lon = -52.65*np.pi/180
#tz = -3

site.lat = 59.917*np.pi/180
site.lon = 10.75*np.pi/180
tz = +2 

tz_delta = datetime.timedelta(seconds=3600*tz)

site.date = e.date(now)
site.pressure = 0

twilights = ('Dagslys', 'Alm. tussmørke', 'Nautisk tussmørke', 'Astr. tussmørke')
center = (False, True, True, True)
horizons = ('-0:34', -6*np.pi/180, -12*np.pi/180, -18*np.pi/180)

print('')
print('|                    | Start | Slutt |')
print('|--------------------|-------|-------|')

for n in range(4):
    site.horizon = horizons[n]
    try:
        up = site.previous_rising(sun, use_center=center[n])
        down = site.next_setting(sun, use_center=center[n])
    except (e.AlwaysUpError, e.NeverUpError):
        print('|', twilights[n].ljust(18), '|',
                '--:--', '|',
                '--:--', '|')
    else:
        d_up = up.datetime() + tz_delta
        d_down = down.datetime() + tz_delta
        print('|', twilights[n].ljust(18), '|',
            d_up.strftime('%H:%M'), '|',
            d_down.strftime('%H:%M'),'|')
