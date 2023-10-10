
select
{{ dbt_utils.generate_surrogate_key(['patient', 'encounter', 'code', '"DESCRIPTION"']) }} as condition_id,
"START" as start_date,
"STOP" as end_date,
patient as patient_id,
encounter as encounter_id,
code as condition_code,
"DESCRIPTION" as condition_description,
current_date as last_updated_date
from {{ source('clinic', 'conditions') }}