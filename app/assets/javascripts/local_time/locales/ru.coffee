(->

  numpf = (n, f, s, t) ->
    n10 = n % 10;
    if ( (n10 == 1) && ( (n == 1) || (n > 20) ) )
      return f;
    else if ( (n10 > 1) && (n10 < 5) && ( (n > 20) || (n < 10) ) )
      return s;
    else
      return t;

  LocalTime.config.locale = "ru"
  LocalTime.config.i18n =
    ru:
      date:
        dayNames: [
          "воскресенье"
          "понедельник"
          "вторник"
          "среда"
          "четверг"
          "пятница"
          "суббота"
        ]
        abbrDayNames: [
          "Вс"
          "Пн"
          "Вт"
          "Ср"
          "Чт"
          "Пт"
          "Сб"
        ]
        monthNames: [
          "января"
          "февраля"
          "марта"
          "апреля"
          "мая"
          "июня"
          "июля"
          "августа"
          "сентября"
          "октября"
          "ноября"
          "декабря"
        ]
        abbrMonthNames: [
          "янв."
          "февр."
          "марта"
          "апр."
          "мая"
          "июня"
          "июля"
          "авг."
          "сент."
          "окт."
          "нояб."
          "дек."
        ]
        yesterday: "вчера"
        today: "сегодня"
        tomorrow: "завтра"
        on: "{date}"
        formats:
          default: "%d.%m.%Y"
          thisYear: "%d %B"
      time:
        am: "утра"
        pm: "вечера"
        singular: "{time}"
        singularAn: "{time}"
        elapsed: "{time} назад"
        second: "секунду"
        seconds: (value) -> numpf value, "секунда", "секунды", "секунд"
        minute: "минуту"
        minutes: (value) -> numpf value, "минута", "минуты", "минут"
        hour: "час"
        hours: (value) -> numpf value, "час", "часа", "часов"
        day: "день",
        days: (value) -> numpf value, "день", "дня", "дней"
        month: "месяц",
        months: (value) -> numpf value, "месяц", "месяца", "месяцев"
        year: "год",
        years: (value) -> numpf value, "год", "года", "лет"
        formats:
          default: "%H:%M"
      datetime:
        at: "{date} в {time}"
        formats:
          default: "%d.%m.%Y %H:%M"
)()