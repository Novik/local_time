{config} = LocalTime
{i18n} = config

LocalTime.getI18nValue = (keyPath = "", count = 1, locale = config.locale) ->
  value = getValue(config.i18n[locale], keyPath, count)
  if value?
    value
  else if locale isnt config.defaultLocale
    console.log keyPath
    LocalTime.getI18nValue(keyPath, count, config.defaultLocale)

LocalTime.translate = (keyPath, interpolations = {}, count, locale) ->
  string = LocalTime.getI18nValue(keyPath, count, locale)
  for key, replacement of interpolations
    string = string.replace("{#{key}}", replacement)
  string

getValue = (object, keyPath, count) ->
  value = object
  for key in keyPath.split(".")
    if value[key]?
      if typeof value[key] == "function"
        value = value[key](count)
      else
        value = value[key]
    else
      return null
  value
