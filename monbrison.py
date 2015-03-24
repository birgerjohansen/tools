#!/usr/bin/python

import sys, getopt
from datetime import date, timedelta


def main(argv):
    try:                                
        opts, args = getopt.getopt(argv, "hp:f:t:y", ["help", "period=",
            "fromyear=", "toyear=", "yearmode"])
    except getopt.GetoptError:
        usage()
        sys.exit(2)
    period = 6
    yearmode = 0
    fromyear = date.today().year
    toyear = fromyear
    for opt, arg in opts:
        if opt in ("-h", "--help"):
            usage()                     
            sys.exit()                  
        elif opt in ("-p", "--period"):
            if not arg.isdigit():
                print('Period must be integer. Exiting...')
                sys.exit(2)
            period=int(arg)
        elif opt in ("-f", "--fromyear"):
            if not arg.isdigit():
                print('Start year must be integer. Exiting...')
                sys.exit(2)
            fromyear=int(arg)
            toyear=fromyear
        elif opt in ("-t", "--toyear"):
            if not arg.isdigit():
                print('End year must be integer. Exiting...')
                sys.exit(2)
            toyear=int(arg)
        elif opt in ("-y", "--yearmode"):
            yearmode=1
    source = " ".join(args)
    if len(source) > 0:
        print('Unknown parameters', source)
    if fromyear < 1999:
        print('\nStarting from 1999...')
        fromyear = 1999
        if toyear < fromyear:
            toyear = fromyear
    if fromyear > toyear:
        print('Start year > End year. Exiting...')
        sys.exit(2)

    periods = createperiodtable([[5, 3, 9, 4, 10, 11, 6, 12, 1, 7, 2, 8, 3, 9,
            4, 10, 5, 11, 6, 12, 8, 2, 7, 'Closed', 'Closed', 1]])
    printheader()
    if yearmode:
        for year in range(fromyear, toyear + 1):
            printbyyear(periods, year)
    else:
        for year in range(fromyear, toyear + 1):
            printbyperiod(periods, period, year)
    print(66*'-')
    print('')

def yeartorow(year):
    row = (year - 1999) % 12
    return row

def nextperiod(currentperiod):
    if currentperiod != 'Closed':
        next = (currentperiod + 11) % 12
    else:
        next = 'Closed'
    if next == 0:
        next = 12
    return next

def createperiodtable(periods):
    dummy = periods[0]
    for n in range(0, 11):
        dummy = list(map(nextperiod, dummy))
        periods.append(dummy)
    return periods


def weekindex(periods, period, year):
    dummy = periods[yeartorow(year)]
    weeks = []
    weeks.append(dummy.index(period))
    weeks.append(dummy.index(period, weeks[0]+1))
    return weeks

def weeknumber(weekindex):
    return (weekindex+1)*2 -1

def startdate(weekindex, year):
    startweek = weeknumber(weekindex)
    start = iso_to_gregorian(year, startweek, 1) - timedelta(days=2)
    if startweek == 1:
        start = date(year-1, 12, 29)
    return start

def enddate(weekindex, year):
    endweek = weeknumber(weekindex) + 1
    endd = iso_to_gregorian(year, endweek, 1) + timedelta(days=5)
    if endweek > 50:
        endd = date(year, 12, 29)
    return endd

def printbyperiod(periods, period, year):
    weeks1, weeks2 = weekindex(periods, period, year)
    week1 = weeknumber(weeks1)
    week2 = weeknumber(weeks2)
    s1 = startdate(weeks1, year)
    e1 = enddate(weeks1, year)
    s2 = startdate(weeks2, year)
    e2 = enddate(weeks2, year)
    d1 = (e1-s1).days
    d2 = (e2-s2).days
    printresults(week1, s1, e1, d1, period, year)
    printresults(week2, s2, e2, d2, period, year)

def printbyyear(periods, year):
    index = 0
    for period in periods[yeartorow(year)]:
        week1 = weeknumber(index)
        s1 = startdate(index, year)
        e1 = enddate(index, year)
        d1 = (e1-s1).days
        printresults(week1, s1, e1, d1, period, year)
        index = index + 1
        

def printresults(startweek, s, e, d, period, year):
    print(year, '|', str(period).rjust(6),'|', \
           str(startweek).rjust(2)+'-'+str(startweek+1).rjust(2), \
           '|', s.strftime('%a %d.%m.%Y'), '|', e.strftime('%a %d.%m.%Y'), \
           '|', str(d)+' days')
    
def printheader():
    print('')
    print('Year | Period | Weeks | Start          | End            | Length')
    print(66*'-')

def usage():
    print('\n\tMonbrison weekperiod calculator\n')
    print('\tOptions:')
    print('\t-h or --help\t\tHelp')
    print('\t-p or --period\t\tPeriod')
    print('\t-f or --fromyear\tStart year')
    print('\t-t or --toyear\t\tEnd year')
    print('\t-y or --yearmode\tPrint all periods from a year sorted by date')
    print('\tDefult is current year as start year and current year as end year')
    print('\tDefult period is 6\n')

def iso_year_start(iso_year):
    "The gregorian calendar date of the first day of the given ISO year"
    fourth_jan = date(iso_year, 1, 4)
    delta = timedelta(fourth_jan.isoweekday()-1)
    return fourth_jan - delta
    
def iso_to_gregorian(iso_year, iso_week, iso_day):
    "Gregorian calendar date for the given ISO year, week and day"
    year_start = iso_year_start(iso_year)
    return year_start + timedelta(days=iso_day-1, weeks=iso_week-1)

if __name__ == "__main__":
    main(sys.argv[1:])
