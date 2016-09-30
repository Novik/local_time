#= require ./calendar_date

{strftime, translate, getI18nValue} = LocalTime

class LocalTime.RelativeTime
  constructor: (@date) ->
    @calendarDate = LocalTime.CalendarDate.fromDate(@date)

  toString: (force = false) ->
    if time = @toTimeElapsedString(force)
      translate("time.elapsed", {time})
    else if date = @toWeekdayString()
      time = @toTimeString()
      translate("datetime.at", {date, time})
    else
      translate("date.on", date: @toDateString())

  toTimeOrDateString: ->
    if @calendarDate.isToday()
      @toTimeString()
    else
      @toDateString()

  toTimeElapsedString: (force = false) ->
    ms = new Date().getTime() - @date.getTime()
    seconds = Math.round ms / 1000
    minutes = Math.round seconds / 60
    hours = Math.round minutes / 60
    days = Math.round hours / 24
    months = Math.round days / 30
    years = Math.round months / 12
    if ms < 0
      null
    else if seconds < 10
      time = translate("time.second")
      translate("time.singular", {time})
    else if seconds < 45
      "#{seconds} #{translate("time.seconds", {}, seconds)}"
    else if seconds < 90
      time = translate("time.minute")
      translate("time.singular", {time})
    else if minutes < 45
      "#{minutes} #{translate("time.minutes", {}, minutes)}"
    else if minutes < 90
      time = translate("time.hour")
      translate("time.singularAn", {time})
    else if hours < 24
      "#{hours} #{translate("time.hours", {}, hours)}"
    else 
      if force
        if hours < 36
          time = translate("time.day")
          translate("time.singular", {time})
        else if days < 30
          "#{days} #{translate("time.days", {}, days)}"
        else if days < 45
          time = translate("time.month")
          translate("time.singular", {time})
        else if months < 12
          "#{months} #{translate("time.months", {}, months)}"
        else if months < 18
          time = translate("time.year")
          translate("time.singular", {time})
        else
          "#{years} #{translate("time.years", {}, years)}"
      else
        ""

  toWeekdayString: ->
    switch @calendarDate.daysPassed()
      when 0
        translate("date.today")
      when 1
        translate("date.yesterday")
      when -1
        translate("date.tomorrow")
      when 2,3,4,5,6
        strftime(@date, "%A")
      else
        ""

  toDateString: ->
    format = if @calendarDate.occursThisYear()
      getI18nValue("date.formats.thisYear")
    else
      getI18nValue("date.formats.default")

    strftime(@date, format)

  toTimeString: ->
    strftime(@date, getI18nValue("time.formats.default"))
