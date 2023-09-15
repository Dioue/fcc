def add_time(start, duration, week_day:str =None):
  meridian = ["AM", "PM"]
  week_days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

  # Cleaning string into list
  start_list = [int(x) for x in start.split()[0].split(":")]
  duration_list = [int(x) for x in duration.split()[0].split(":")]

  # Summation

  if "PM" in start:
    start_min = ((start_list[0]*60)+720) + start_list[1]
  else:
    start_min = (start_list[0]*60) + start_list[1]

  dur_min = (duration_list[0]*60) + duration_list[1] 
  new_time = start_min + dur_min

  # formulas for equating time with respect to time constraints of meridians.
  hour = ((new_time//60)%24) if ((new_time//60)%24) < 13 else ((new_time//60)%24)//13 + ((new_time//60)%24)%13
  minute = (new_time%60)
  mer_count = (new_time//720)
  day_count = (new_time//1440)

  # band-aid
  if hour == 0:
    hour = 12

  # day count formatter
  if day_count == 1:
    fday = " (next day)"
  elif day_count > 1:
    fday = f" ({day_count} days later)"
  else:
    fday = ""

  # week of the day
  if week_day is not None:
    week_count = (week_days.index(week_day.title()) + day_count)%7
    day_today = week_days[week_count]

    return f"{hour}:{minute:02d} {meridian[mer_count%2]}, {day_today}{fday}"

  return f"{hour}:{minute:02d} {meridian[mer_count%2]}{fday}"