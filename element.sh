#!/bin/bash

if [[ -z "$1" ]]; then
  echo "Please provide an element as an argument."
  exit 0
fi

escaped_input=${1//\'/\'\'}
PSQL="psql --username=freecodecamp --dbname=periodic_table -t -A -c"

RESULT=$($PSQL "SELECT e.atomic_number,
       e.name,
       e.symbol,
       t.type,
       TRIM(TRAILING '0' FROM CAST(p.atomic_mass AS TEXT)) AS atomic_mass,
       p.melting_point_celsius,
       p.boiling_point_celsius
FROM elements e
JOIN properties p USING (atomic_number)
JOIN types t USING (type_id)
WHERE e.atomic_number::TEXT = '$escaped_input'
   OR e.symbol = '$escaped_input'
   OR e.name = '$escaped_input';")

if [[ -z "$RESULT" ]]; then
  echo "I could not find that element in the database."
  exit 0
fi

IFS='|' read -r atomic_number name symbol type mass melting_point boiling_point <<< "$RESULT"

format_decimal() {
  echo "$1" | sed -E 's/(\.[0-9]*[1-9])0+$/\1/; s/\.0+$//; s/\.$//'
}

mass=$(format_decimal "$mass")
melting_point=$(format_decimal "$melting_point")
boiling_point=$(format_decimal "$boiling_point")

echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $mass amu. $name has a melting point of $melting_point celsius and a boiling point of $boiling_point celsius."
