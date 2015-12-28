# International Date Parser


#### Purpose:
Extend the date parsing capabilities of Ruby to work with dates which months are different than english.

#### Usage:
```  
Date.parse_international("28 de Fevereiro de 2020")
DateTime.parse_international("28 de Fevereiro de 2020")
"28 de Fevereiro de 2020".to_international_date
```

#### Notes:
 * This routine works by substituting your local month names (as defined by Date::MONTH_TRANSLATIONS) for the
    international names when they occur in the date_string.  
 + As distributed, this code works for French, German, Italian, Portuguese and Spanish.  You must add the month
    names for any additional languages you wish to handle.  

## Credits
https://github.com/jackrg
